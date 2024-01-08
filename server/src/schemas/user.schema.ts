import {Prop,Schema,SchemaFactory} from '@nestjs/mongoose'
import { HydratedDocument } from 'mongoose'

export type UserDocument= HydratedDocument<User>;
@Schema()
export class User{
    @Prop()
    first_name:string;

    @Prop()
    last_name:string;

    @Prop()
    email:string;

    @Prop()
    password:string

    @Prop()
    user_type:string;


}

export const UserSchema=SchemaFactory.createForClass(User);
