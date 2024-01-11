import { Body, Injectable, UnauthorizedException } from '@nestjs/common';
import { UsersService } from '../users/users.service';
import { JwtService } from '@nestjs/jwt';
import { User } from 'src/entities/user.entity';
import { HashService } from 'src/common/hash.service';
import { CreateUserDto } from 'src/users/dto/CreateUser.dto';

@Injectable()
export class AuthService {
  constructor(private usersService: UsersService, private jwtService: JwtService, private hashService: HashService) { }
  async validateUser(email: string, password: string): Promise<any> {

    const user: User = await this.usersService.findOne(email);
    if (user && (await this.hashService.comparePassword(password, user.password))) {

      return user;
    }
    throw new UnauthorizedException();
  }
  async register(@Body() createUserDto: CreateUserDto) {
    return this.usersService.createUser(createUserDto)
  }
  async signIn(email: string, pass: string): Promise<any> {
    const user = await this.validateUser(email, pass);




    const payload = { user: user };
    return {
      user: user,
      access_token: await this.jwtService.signAsync(payload),
    };

  }

}