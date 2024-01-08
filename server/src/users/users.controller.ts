import { Body, Controller, Get, Post, UsePipes, ValidationPipe } from "@nestjs/common";
import { usersService } from "./users.service";
import { CreateUserDto } from "./dto/CreateUser.dto";

// path the route to the @controller decorator
@Controller('users')
export class UserController{
// this layer should interact with the service layer
constructor(private usersService:usersService){}
    @Post()
    // use pipes will enable validation inside this controller only
    // @UsePipes(new ValidationPipe())
    // request.body is same as @Body()
    createUser(@Body() createUserDto:CreateUserDto){
    
        console.log(createUserDto)
            return this.usersService.createUser(createUserDto)
    }

    @Get()
    getUsers(){
        return this.usersService.getUsers()
    }

   
}