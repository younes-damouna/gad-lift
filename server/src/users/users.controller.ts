import { BadRequestException, Body, Controller, Delete, FileTypeValidator, Get, HttpException, MaxFileSizeValidator, Param, ParseFilePipe, Patch, Post, Req, UploadedFile, UseInterceptors, UsePipes, ValidationPipe } from "@nestjs/common";
import { UsersService } from "./users.service";
import { CreateUserDto } from "./dto/CreateUser.dto";
import mongoose from "mongoose";
import { UpdateUserDto } from "./dto/UpdateUser.dto";
import { FileInterceptor } from "@nestjs/platform-express";
import { diskStorage } from "multer";

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
    @Post(':id')
    @UsePipes(new ValidationPipe())
    @UseInterceptors(FileInterceptor('profile_img',{
        storage: diskStorage({
          destination: 'uploads',
          filename: (req, file, cb) => {
            cb(null, file.originalname);
          },
        }),
      }))
    async updateUser(@Param('id') id: string, @Body() updateUserDto: UpdateUserDto,@Req() request:Request, @UploadedFile(
        // new ParseFilePipe({
        //     validators: [
        //         new FileTypeValidator({ fileType: '.(png|jpeg|jpg)' }),
        //         new MaxFileSizeValidator({ maxSize: 1024 * 1024 * 4 }),
        //     ],
        // }),

    ) profile_img?: Express.Multer.File)
     {
        console.log(profile_img.path)
        const isValidId = mongoose.Types.ObjectId.isValid(id);
        if (!isValidId) throw new HttpException('Invalid ID', 400);
        updateUserDto.profile_img=profile_img.path;
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