import { Injectable, Request } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Family } from 'src/schemas/family.schema';
import { createFamilyDto } from './dto/CreateFamily.dto';

@Injectable()
export class FamiliesService {
    constructor(@InjectModel(Family.name) private FamilyModel: Model<Family>) {

      
    }
    async createFamily(createFamilyDto:createFamilyDto,@Request() req){
        const createFamily= new this.FamilyModel(createFamilyDto);
        createFamily.code=this.createRandomFamilyCode();
        createFamily.parent=req.user.user._id;
        return createFamily.save()
        // console.log(req.user.user._id)
        // const family 

    }
    createRandomFamilyCode() :string{
        
        return parseInt((Math.random()*1000000).toString()).toString();

    }
}
