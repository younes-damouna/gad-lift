import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose'
import mongoose, { HydratedDocument } from 'mongoose'
import { UserSettings } from './userSettings.schema';
import { Family } from './family.schema';

// export type UserDocument = HydratedDocument<User>;
export type UserDocument = User & Document;

@Schema({ timestamps: true })
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
    @Prop({ default: "" })
    profile_img: string;
    @Prop({

        required: true,
        minlength: 8,
    })
    password: string;

    @Prop({ required: false,default: "" })
    mobile_number?: String;

    @Prop({ default: "User" })
    user_type: string;

    @Prop({ required: false, default: "" })
    floor: string;

    @Prop({ type: mongoose.Schema.Types.ObjectId, ref: 'UserSettings' })
    settings?: UserSettings;

    @Prop({ default: null, type: mongoose.Schema.Types.ObjectId, ref: 'Family' })
    family: Family

}

export const UserSchema = SchemaFactory.createForClass(User);
