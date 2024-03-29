import { BadRequestException, Body, Controller, Delete, FileTypeValidator, Get, HttpException, MaxFileSizeValidator, Param, ParseFilePipe, Patch, Post, Req, UploadedFile, UseGuards, UseInterceptors, UsePipes, ValidationPipe } from "@nestjs/common";
import { UsersService } from "./users.service";
import { CreateUserDto } from "./dto/CreateUser.dto";
import mongoose from "mongoose";
import { UpdateUserDto } from "./dto/UpdateUser.dto";
import { FileInterceptor } from "@nestjs/platform-express";
import { diskStorage } from "multer";
import { FileController } from "src/file.controller";
import { join } from "path";
import { ConfigService } from "@nestjs/config";
import { Roles } from "src/customDecorators/roles.decorator";
import { Role } from "src/enums/role.enum";
import { RolesGuard } from "src/guards/roles.guard";
import { AuthGuard } from "src/auth/auth.guard";

// path the route to the @controller decorator
@Controller('users')
export class UserController {
    // this layer should interact with the service layer
    constructor(private usersService: UsersService, private readonly configService: ConfigService) { }

    //     // use pipes will enable validation inside this controller only

    
  
    @Roles(Role.Admin)
    @UseGuards(RolesGuard)
    @Get()
    @UseGuards(AuthGuard)

    async getUsers()   {
        return await this.usersService.getUsers()
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
    @UseInterceptors(FileInterceptor('profile_img', {
        storage: diskStorage({
            destination: 'uploads',
            filename: (req, file, cb) => {
                cb(null, file.originalname);
            },
        }),
    }))
    async updateUser(@Param('id') id: string, @Body() updateUserDto: UpdateUserDto, @Req() request: any, @UploadedFile(


    ) profile_img?: Express.Multer.File) {
        const port = this.configService.get<string>('PORT');

        let path =''
        if(profile_img?.fieldname) path=`http://${request.hostname}:${port}/uploads/${profile_img?.filename.replace(/\\/g, '/')}`;
        updateUserDto.profile_img = path
        const isValidId = mongoose.Types.ObjectId.isValid(id);
        if (!isValidId) throw new HttpException('Invalid ID', 400);

        const UpdatedUser = await this.usersService.updateUser(id, updateUserDto);
        if (!UpdatedUser) throw new HttpException('User Not Found', 404);
        console.log(UpdatedUser)
        return UpdatedUser;


    }
    @Delete(':id')
    async deleteUser(@Param('id') id: string) {
        const isValidId = mongoose.Types.ObjectId.isValid(id);
        if (!isValidId) throw new HttpException('Invalid ID', 400);
        const deletedUser = await this.usersService.deleteUser(id);
        if (!deletedUser) throw new HttpException('User Not Found', 404);

        return;
    }




}