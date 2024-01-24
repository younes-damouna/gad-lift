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
  // @Get('/uploads/:filename')
  // getImage(@Param('filename') filename: string, @Res() res: Response): void {
    
  //   const imagePath = path.join(__dirname, 'google/uploads',filename); // Adjust the path as needed
  //   console.log(imagePath)

  //   res.sendFile(imagePath);
  // }

  // @Get('/uploads/:filename')
  // serveFile(@Param('filename') filename: string, @Res() res) {
  //   const path = join(__dirname, '..', 'uploads', filename);
  //   console.log(path)
  //   if (existsSync(path)) {
  //     return res.sendFile(path);
  //   } else {
  //     return res.status(404).send('File not found');
  //   }
  // }
}

