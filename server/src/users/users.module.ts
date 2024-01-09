import { Module, forwardRef } from "@nestjs/common";
import { MongooseModule } from "@nestjs/mongoose";
import { User, UserSchema } from "../schemas/user.schema";
import { usersService } from "./users.service";
import { UserController } from "./users.controller";
import { UserSettings, UserSettingsSchema } from "src/schemas/userSettings.schema";

import { HashService } from "../common/hash.service";
import { JwtModule } from "@nestjs/jwt";
import { jwtConstants } from "src/strategy/constants";

import { JwtStrategy } from "src/strategy/jwt.strategy";


@Module({
    imports: [
        // register mongoose schemas
        MongooseModule.forFeature(
            [
                {
                    name: User.name,
                    schema: UserSchema
                }
                ,
                {
                    name: UserSettings.name,
                    schema: UserSettingsSchema
                }
            ]
        ) ,
        JwtModule.register({
            secret: jwtConstants.secret,
            signOptions: {
              expiresIn: '60d'
            },
          }),
        // ,forwardRef(() => AuthModule),
    ],
    providers: [usersService,HashService,JwtStrategy],
    // register the usersController
    controllers: [UserController],
    exports:[usersService]
})

export class UsersModule { }