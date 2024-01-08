import { Module } from "@nestjs/common";
import { MongooseModule } from "@nestjs/mongoose";
import { User,UserSchema } from "../schemas/user.schema";
import { usersService } from "./users.service";

@Module({
    imports:[
        // register mongoose schemas
        MongooseModule.forFeature(
            [{name:User.name,schema:UserSchema}]
        )
    ],
    providers:[usersService]
})

export class UsersModule{}