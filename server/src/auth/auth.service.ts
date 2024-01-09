import { Injectable, UnauthorizedException } from '@nestjs/common';
import { usersService } from '../users/users.service';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class AuthService {
  constructor(private usersService: usersService,private jwtService: JwtService) {}

  async signIn(email: string, pass: string): Promise<any> {
    const user = await this.usersService.findOne(email);
    if (user?.password !== pass) {
      throw new UnauthorizedException();
    }
    const payload = {  user: user};
    return {
      access_token: await this.jwtService.signAsync(payload),
    };
  
  }
}