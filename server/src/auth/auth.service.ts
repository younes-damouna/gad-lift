import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { User } from 'src/entities/user.entity';
import { HashService } from 'src/common/hash.service';
import { usersService } from 'src/users/users.service';

@Injectable()
export class AuthService {
    constructor(private usersService: usersService, private hashService:HashService, private jwtService:JwtService) { }

    async validateUser(email: string, password: string): Promise<any> {
        
        const user: User = await this.usersService.findOne(email);
        if (user && (await this.hashService.comparePassword(user.password , password))) {
            // const { password, ...result} = user;
            // console.log(result)
            return user;
        }
        return null;
    }

    async login(user:any): Promise<any> {

        // const user: User = await this.usersService.findOne(email);
        // console.log(user?.password)
        // if (user?.password !== pass) {

        //     throw new UnauthorizedException();

        // }
        // const { password, ...result } = user;
        // // TODO: Generate a JWT and return it here
        // // instead of the user object
        // return user;
        const payload = {
            email: user.email,
            sub: user.id
          };
          return {
            access_token: this.jwtService.sign(payload),
          };

       
    }
}
