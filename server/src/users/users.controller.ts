import { BadRequestException, Body, Controller, Delete, Get, HttpException, Param, Patch, Post, UsePipes, ValidationPipe } from "@nestjs/common";
import { UsersService } from "./users.service";
import { CreateUserDto } from "./dto/CreateUser.dto";
import mongoose from "mongoose";
import { UpdateUserDto } from "./dto/UpdateUser.dto";

// path the route to the @controller decorator
@Controller('users')
export class UserController {
    // this layer should interact with the service layer
    constructor(private usersService: UsersService) { }
//     @Post()
//     // use pipes will enable validation inside this controller only
//     // @UsePipes(new ValidationPipe())
//     // request.body is same as @Body()
//    async createUser(@Body() createUserDto: CreateUserDto) {
      
//         console.log(createUserDto)
//         return this.usersService.createUser(createUserDto)
//     }

    @Get()
    getUsers() {
        return this.usersService.getUsers()
    }
    //users/:id
    @Get(':id')
    async getUserById(@Param('id') id: string) {
        const isValidId = mongoose.Types.ObjectId.isValid(id);
        if (!isValidId) throw new HttpException('User not found', 404);
        const findUser = await this.usersService.getUserById(id);
        if (!findUser) throw new HttpException('User not found', 404);
        return findUser;

    }
    // to update a record in db
    @Patch(':id')
    @UsePipes(new ValidationPipe())
    async updateUser(@Param('id') id: string, @Body() updateUserDto: UpdateUserDto) {
        const isValidId = mongoose.Types.ObjectId.isValid(id);
        if (!isValidId) throw new HttpException('Invalid ID', 400);
        const UpdatedUser = await this.usersService.updateUser(id, updateUserDto);
        if (!UpdatedUser) throw new HttpException('User Not Found', 404);
        // console.log(UpdatedUser)
        return UpdatedUser;


    }
    @Delete(':id')
    async deleteUser(@Param('id') id: string) {
        const isValidId = mongoose.Types.ObjectId.isValid(id);
        if (!isValidId) throw new HttpException('Invalid ID', 400);
        const deletedUser = await this.usersService.deleteUser(id);
        if (!deletedUser) throw new HttpException('User Not Found', 404);
        // console.log(deletedUser);
        return;
    }




}