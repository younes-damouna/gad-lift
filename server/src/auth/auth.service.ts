import { Injectable, UnauthorizedException } from '@nestjs/common';
import { User } from 'src/users/user.entity';
import { usersService } from 'src/users/users.service';

@Injectable()
export class AuthService {
    constructor(private usersService: usersService) { }

    async validateUser(email: string, password: string): Promise<any> {
        const user: User = await this.usersService.findOne(email);
        if (user && user.password === password) {
            const { password, ...result } = user;
            return result;
        }
        return null;

    }

    async login(email: string, pass: string): Promise<any> {

        const user: User = await this.usersService.findOne(email);
        console.log(user?.password)
        if (user?.password !== pass) {

            throw new UnauthorizedException();

        }
        const { password, ...result } = user;
        // TODO: Generate a JWT and return it here
        // instead of the user object
        return result;
    }
}