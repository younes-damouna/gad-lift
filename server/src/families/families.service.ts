import { BadRequestException, HttpException, Injectable, NotFoundException, Request } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import mongoose, { Model } from 'mongoose';
import { Family } from 'src/schemas/family.schema';
import { createFamilyDto } from './dto/CreateFamily.dto';
import { User } from 'src/entities/user.entity';
import { PushNotificationsService } from 'src/push-notifications/push-notifications.service';

@Injectable()
export class FamiliesService {
    constructor(@InjectModel(Family.name) private FamilyModel: Model<Family>,private pushNotificationsService:PushNotificationsService) {



    }
    async createFamily(createFamilyDto: createFamilyDto, @Request() req) {
        const user = await this.checkUserHaveFamily(req.user.user._id);
        console.log(createFamilyDto);


        if (user) {
            console.log(user);
            throw new BadRequestException({ message: "Already in a family" });
        }
        const family = new this.FamilyModel(createFamilyDto);
        family.code = this.createRandomFamilyCode();
        family.floor = createFamilyDto.floor;

        family.parent = req.user.user._id;
        const createdFamily = (await family.save()).populate('parent')

        return createdFamily;

    }

    createRandomFamilyCode(): string {

        return parseInt((Math.random() * 1000000).toString()).toString();

    }
    async checkUserHaveFamily(id: mongoose.Schema.Types.ObjectId) {
        const user = await this.FamilyModel.findOne({ parent: id });
        return user;

    }
    async checkIfParent(@Request() req){
        const family = await this.FamilyModel.findOne({ parent: req.user.user._id });
        if (!family)
        return {
            "exists": false,
            "statusCode": 404
        };
        return {
            "exists": true,
            "statusCode": 200,
            "family_code":family.code,
        };
    }
    async getRequests(@Request() req) {
        const family = await this.FamilyModel.findOne({ parent: req.user.user._id }).populate('requests', '-password').populate('members', '-password');
        if (!family)
            throw new BadRequestException({ message: "You Don't Have a Family" },)
        return {
            "requests": family.requests,
            "members": family.members
        };

    }
    async requestTojoinFamily(@Request() req, code: string) {
        // search for the family based on its code

        const family = await this.findFamily(code);
        const member = await this.checkUserIfMember(req.user.user._id);
       


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
            this.pushNotificationsService.send(`eTik-Vl-RVWFzBskKM0bN5:APA91bHciqOX23KU1H7sLi5xIGMarRdMxC1okQ3bO-hkyG4sCrvCAFwUN1WlHYAZuYgqlgh1JZIDERGGovrB0jr6ulm8yprs6s_JsgzbFdTigQ5komJzTVyqFLRfakZSCAhOFFGzl3Wm`, `Welcome ${req.user.user.first_name} ${req.user.user.last_name}`, 'string');

            return (await family.save()).populate('requests');

        }
        throw new NotFoundException({ message: 'Family Not Found!' });

    }

    async findFamily(code: string) {
        const family = await this.FamilyModel.findOne({ code });
        return family;

    }
    async checkUserIfMember(id: mongoose.Schema.Types.ObjectId) {
        const user = await this.FamilyModel.findOne({ members: { $in: [id] } });
        return user;

    }
    async acceptMember(id: string) {
        this.isValidMongooseId(id);
        const family = await this.FamilyModel.findOne({ requests: { $in: [id] } }).populate('requests');
        if (family) {
            const allRequests = family.requests?.filter((request: any) => {
                return request._id != id
            })
            const toBeAccepted = family.requests?.filter((request: any) => {
                return request._id == id
            })
            console.log(family);
            family.requests = allRequests;

            family.members.push(toBeAccepted[0]);

            return family.save();
        }
        throw new BadRequestException({ message: "You Are Already a Member!" },)




    }

    isValidMongooseId(id: string) {
        const isValidId = mongoose.Types.ObjectId.isValid(id);
        if (!isValidId) throw new HttpException('User not found', 404);
    }
}
