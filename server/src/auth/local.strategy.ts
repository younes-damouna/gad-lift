// import { Strategy } from 'passport-strategy';
import { Strategy } from 'passport-local';

import { PassportStrategy } from '@nestjs/passport';
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { AuthService } from './auth.service';

@Injectable()
export class LocalStrategy extends PassportStrategy(Strategy, "local") {
    constructor(private authService: AuthService) {
        super();
    }

    async validate(email: string, password: string): Promise<any> {
        const user = await this.authService.validateUser(email, password);
        console.log(user)
        if (!user) {
            throw new UnauthorizedException(
                {
                    message: "You have entered a wrong username or password"
                }
            );

        }
        return user;

    }

}

