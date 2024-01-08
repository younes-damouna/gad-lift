import { Injectable } from "@nestjs/common";
import { InjectModel } from "@nestjs/mongoose";
import { Model } from "mongoose";
import { User } from "src/schemas/user.schema";
import { CreateUserDto } from "./dto/CreateUser.dto";
import { UpdateUserDto } from "./dto/UpdateUser.dto";
import { UserSettings } from "src/schemas/userSettings.schema";

// Service is used to interact with the database
@Injectable()
export class usersService {
    constructor(@InjectModel(User.name) private UserModel: Model<User>,
        @InjectModel(UserSettings.name) private UserSettingsModel: Model<UserSettings>) { }
    //dto stands for data transfer object
    async createUser({ settings, ...createUserDto }: CreateUserDto) {
        if (settings) {
            const newSettings = new this.UserSettingsModel(settings);
            const savedNewSettings = await newSettings.save()
            const newUser = new this.UserModel({ ...createUserDto, settings: savedNewSettings._id });
            // console.log(newUser)
            return newUser.save();


        }
        const newUser = new this.UserModel(createUserDto);
        return newUser.save();

    }
    getUsers() {
        return this.UserModel.find().populate('settings');
    }

    getUserById(id: string) {
        return this.UserModel.findById(id).populate('settings');

    }
    updateUser(id: string, updateUserDto: UpdateUserDto) {
        return this.UserModel.findByIdAndUpdate(id, updateUserDto, { new: true });


    }
    deleteUser(id: string) {
        return this.UserModel.findByIdAndDelete(id);
    }

}