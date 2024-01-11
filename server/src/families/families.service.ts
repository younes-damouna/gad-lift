import { BadRequestException, Injectable, NotFoundException, Request } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import mongoose, { Model } from 'mongoose';
import { Family } from 'src/schemas/family.schema';
import { createFamilyDto } from './dto/CreateFamily.dto';
import { User } from 'src/entities/user.entity';

@Injectable()
export class FamiliesService {
    constructor(@InjectModel(Family.name) private FamilyModel: Model<Family>) {


    }
    async createFamily(createFamilyDto: createFamilyDto, @Request() req) {
        const user = await this.checkUserHaveFamily(req.user.user._id);

        if (user) {
            console.log(user);
            throw new BadRequestException({ message: "Already in a family" });
        }
        const family = new this.FamilyModel(createFamilyDto);
        family.code = this.createRandomFamilyCode();
        family.parent = req.user.user._id;
        const createdFamily = (await family.save()).populate('parent')
        // console.log(req.user.user._id)
        // const family 
        return createdFamily;

    }

    createRandomFamilyCode(): string {

        return parseInt((Math.random() * 1000000).toString()).toString();

    }
    async checkUserHaveFamily(id: mongoose.Schema.Types.ObjectId) {
        const user = await this.FamilyModel.findOne({ parent: id });
        return user;

    }
    async requestTojoinFamily(@Request() req, code: string) {
        // search for the family based on its code
        const family = await this.findFamily(code);
        const member = await this.checkUserIfMember(req.user.user._id);
        const familyy=await this.acceptMember(req.user.user._id);
        // console.log(familyy)
        // return user;
        if (member) {
            throw new BadRequestException({ message: "You Are Already a Member!" },)
        }
        if (family) {
            if (family.requests.length === 0) {

            } else {
                const isInRequests = family.requests.map((user: any) => {

                    return req.user.user._id == user._id;
                })
                if (isInRequests) {


                    throw new BadRequestException({ message: "Waiting For Approval!" },)
                }
            }
            family.requests.push(req.user.user);
            return (await family.save()).populate('requests');

        }
        throw new NotFoundException({ message: 'Family Not Found!' });

    }

    async findFamily(code: string) {
        const family = await this.FamilyModel.findOne({ code });
        return family;

    }
    async checkUserIfMember(id: mongoose.Schema.Types.ObjectId) {
        const user = (await this.FamilyModel.findOne({ members: { $in: [id] } }));
        return user;

    }
    async acceptMember(id:mongoose.Schema.Types.ObjectId){
        const family= await this.FamilyModel.findOne({requests:{$in:[id]}}).populate('requests');
        console.log();
        const requests=family.requests.filter((request:any)=>{
            return request._id==id
        })
        family.requests=requests;
        family.members.push(id);
        return family;


    }
}
