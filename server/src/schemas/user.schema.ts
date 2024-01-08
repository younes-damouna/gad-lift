import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose'
import mongoose, { HydratedDocument } from 'mongoose'
import { UserSettings } from './userSettings.schema';

export type UserDocument = HydratedDocument<User>;
@Schema({timestamps:true})
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

    @Prop({ default: "User" })
    user_type: string;
    
    @Prop({ type: mongoose.Schema.Types.ObjectId, ref: 'UserSettings'})
    settings?:UserSettings;


}

export const UserSchema = SchemaFactory.createForClass(User);
