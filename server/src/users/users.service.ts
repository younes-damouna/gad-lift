import { BadRequestException, Injectable } from "@nestjs/common";
import { InjectModel } from "@nestjs/mongoose";
import { Model } from "mongoose";
import { User } from "src/schemas/user.schema";
import { CreateUserDto } from "./dto/CreateUser.dto";
import { UpdateUserDto } from "./dto/UpdateUser.dto";
import { UserSettings } from "src/schemas/userSettings.schema";
import { HashService } from "../common/hash.service";

// Service is used to interact with the database
@Injectable()
export class usersService {
    constructor(
        @InjectModel(User.name) private UserModel: Model<User>,
        @InjectModel(UserSettings.name) private UserSettingsModel: Model<UserSettings>,
        private hashService: HashService
    ) { }
    //dto stands for data transfer object
    async createUser({ settings, ...createUserDto }: CreateUserDto) {
        const createUser = new this.UserModel(createUserDto);
        const user = await this.findOne(createUser.email);
        createUser.password = await this.hashService.hashPassword(createUser.password);
      

        if (user) {
            console.log(user);
            throw new BadRequestException();
        }
        if (settings) {
            const newSettings = new this.UserSettingsModel(settings);
            const savedNewSettings = await newSettings.save()
            const newUser = new this.UserModel({ ...createUserDto, settings: savedNewSettings._id });
            newUser.password = await this.hashService.hashPassword(newUser.password);
            // console.log(newUser)
            return newUser.save();


        }
        const newUser = new this.UserModel(createUserDto);
        newUser.password = await this.hashService.hashPassword(newUser.password);

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
    async findOne(email: string): Promise<any> {
        return await this.UserModel.findOne({ email }).select('+password');
        //  console.log(user);

        //  return user;

    }

}