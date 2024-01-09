import { Body, Controller, HttpCode, HttpStatus, Post, Request, UseGuards } from '@nestjs/common';
import { AuthService } from './auth.service';
import { User } from 'src/entities/user.entity';
import { AuthGuard } from '@nestjs/passport';
import { LocalAuthGuard } from './local-auth.guard';

@Controller('auth')
export class AuthController {
    constructor(private authService:AuthService){}
    @HttpCode(HttpStatus.OK)
    // @UseGuards(AuthGuard('local'))
    @UseGuards(LocalAuthGuard)

    @Post('login')
    login(@Request() req:any){
        console.log(req.user)
        return this.authService.login(req.user)

    }
}
