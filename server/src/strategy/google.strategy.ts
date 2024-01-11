import { Inject, Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { PassportStrategy } from "@nestjs/passport";
import passport from "passport";
import { Strategy } from "passport-google-oauth2";

import { config } from 'dotenv';
config();
@Injectable()
export class GoogleStrategy extends PassportStrategy(Strategy,'google'){

    constructor(
      
        
    ){
        super({
            clientID: process.env.GOOGLE_CLIENT_ID,
            clientSecret: process.env.GOOGLE_SECRET,
            callbackURL: 'http://localhost:3000/google/redirect',
            scope: ['email', 'profile'],
          });
    }
}