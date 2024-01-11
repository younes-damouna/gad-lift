import { BadRequestException, Injectable, NotFoundException, Request } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import mongoose, { Model } from 'mongoose';
import { Family } from 'src/schemas/family.schema';
import { createFamilyDto } from './dto/CreateFamily.dto';

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
        if(family){
            family.requests.push(req.user.user);
            return (await family.save()).populate('requests');

        }
        throw new NotFoundException({message:'Family Not Found!'});

    }

    async findFamily(code: string) {
        const family = await this.FamilyModel.findOne({ code });
        return family;

    }
}
