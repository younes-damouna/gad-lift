import { Inject, Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { PassportStrategy } from "@nestjs/passport";
import passport from "passport";
import { Strategy, VerifyCallback } from "passport-google-oauth2";

import { config } from 'dotenv';
config();
@Injectable()
export class GoogleStrategy extends PassportStrategy(Strategy, 'google') {

    constructor(


    ) {
        super({
            clientID: process.env.GOOGLE_CLIENT_ID,
            clientSecret: process.env.GOOGLE_SECRET,
            callbackURL: process.env.CALLBACK_URL,
            scope: ['email', 'profile'],
        });
    }


    async validate(accessToken: string, refreshToken: string, profile: any, done: VerifyCallback): Promise<any> {
        const { name, emails, photos } = profile;
        const user = {
            email: emails[0].value,
            firstName: name.givenName,
            lastName: name.familyName,
            picture: photos[0].value,
            accessToken
        }
        done(null, user);

    }
}