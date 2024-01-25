import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import mongoose from "mongoose";
import { User } from "src/entities/user.entity";


@Schema({ timestamps: true })
export class Family {
    @Prop({
        required: true,
        unique: true
    })
    code: string;
    @Prop()
    floor: number;

    @Prop({ type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true })
    parent: User;

    @Prop({ type: [mongoose.Schema.Types.ObjectId], ref: 'User' })
    requests?: User[];


    @Prop({ type: [mongoose.Schema.Types.ObjectId], ref: 'User' })
    members: User[];



}
export const FamilySchema = SchemaFactory.createForClass(Family);
