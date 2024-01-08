import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose'
import { HydratedDocument } from 'mongoose'

export type UserDocument = HydratedDocument<User>;
@Schema()
export class User {
    @Prop({
        required: true,
        minlength: 6
    })
    first_name: string;

    @Prop({
        required: true,
        minlength: 6
    })
    last_name: string;

    @Prop({
        required: true,
        unique: true,
        minlength: 6,
        trim: true
    })
    email: string;

    @Prop({
      
        required: true,
        minlength: 8
    })
    password: string;

    @Prop({ default:"User"})
    user_type: string;


}

export const UserSchema = SchemaFactory.createForClass(User);
