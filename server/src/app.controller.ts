import { Controller, Get, Param, Post, Req, Request, Res, UseGuards } from '@nestjs/common';
import { AppService } from './app.service';
import { AuthGuard } from '@nestjs/passport';
import path, { join } from 'path';
import { Response } from 'express';
import { existsSync } from 'fs';


@Controller('google')
export class AppController {
  constructor(private readonly appService: AppService) { }

  @Get()
  @UseGuards(AuthGuard('google'))
  async googleAuth(@Req() req) { }
  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Get('redirect')
  @UseGuards(AuthGuard('google'))
  googleAuthRedirect(@Req() req) {
    return this.appService.googleLogin(req)
  }
  
}

