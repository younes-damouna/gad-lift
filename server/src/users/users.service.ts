import { Injectable } from "@nestjs/common";
import { InjectModel } from "@nestjs/mongoose";
import { Model } from "mongoose";
import { User } from "src/schemas/user.schema";
import { CreateUserDto } from "./dto/CreateUser.dto";

// Service is used to interact with the database
@Injectable()
export class usersService{
    constructor(@InjectModel(User.name) private UserModel:Model<User>){}
    //dto stands for data transfer object
    createUser(createUserDto:CreateUserDto){
        const newUser= new this.UserModel(createUserDto);
        return newUser.save();

    }
    getUsers(){
        return this.UserModel.find();
    }

}