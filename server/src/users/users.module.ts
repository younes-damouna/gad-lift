import { Module, forwardRef } from "@nestjs/common";
import { MongooseModule } from "@nestjs/mongoose";
import { User, UserSchema } from "../schemas/user.schema";
import { usersService } from "./users.service";
import { UserController } from "./users.controller";
import { UserSettings, UserSettingsSchema } from "src/schemas/userSettings.schema";
import { AuthModule } from "src/auth/auth.module";
import { HashService } from "./hash.service";

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
        ) 
        // ,forwardRef(() => AuthModule),
    ],
    providers: [usersService,HashService],
    // register the usersController
    controllers: [UserController],
    exports:[usersService]
})

export class UsersModule { }