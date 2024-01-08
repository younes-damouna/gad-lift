import { Module } from "@nestjs/common";
import { MongooseModule } from "@nestjs/mongoose";
import { User, UserSchema } from "../schemas/user.schema";
import { usersService } from "./users.service";
import { UserController } from "./users.controller";
import { UserSettings, UserSettingsSchema } from "src/schemas/userSettings.schema";

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
    ],
    providers: [usersService],
    // register the usersController
    controllers: [UserController]
})

export class UsersModule { }