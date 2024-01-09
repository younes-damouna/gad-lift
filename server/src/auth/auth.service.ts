import { Injectable, UnauthorizedException } from '@nestjs/common';
import { usersService } from '../users/users.service';
import { JwtService } from '@nestjs/jwt';
import { User } from 'src/entities/user.entity';
import { HashService } from 'src/common/hash.service';

@Injectable()
export class AuthService {
  constructor(private usersService: usersService,private jwtService: JwtService,private hashService:HashService) {}
  async validateUser(email: string, password: string): Promise<any> {
        
    const user: User = await this.usersService.findOne(email);
    if (user && (await this.hashService.comparePassword(password , user.password))) {
       
        return user;
    }
    throw new UnauthorizedException();
}
  async signIn(email: string, pass: string): Promise<any> {
    const user = await this.validateUser(email,pass);
   
    
 

    const payload = {  user: user};
    return {
        user:user,
      access_token: await this.jwtService.signAsync(payload),
    };
  
  }
}