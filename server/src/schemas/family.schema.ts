import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import mongoose from "mongoose";
import { User } from "./user.schema";


@Schema({ timestamps: true })
export class Family {
    @Prop({
        required: true,
    })
    code: string;

    @Prop({ type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true })
    parent: User;

    @Prop({ type: [mongoose.Schema.Types.ObjectId], ref: 'User' })
    requests?: User[];

    @Prop({ type: [mongoose.Schema.Types.ObjectId], ref: 'User' })
    members: { status: string, user: User }[];



}