import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import mongoose from "mongoose";
import { Family } from "./family.schema";
import { Timestamp } from "rxjs";


export type DeviceDocument = Device & Document;
@Schema({ timestamps: true })
export class Device {
    @Prop({
        required: true,

    })
    mac_address: string;
    @Prop({
        required: true,
        unique: true

    })
    ip_address: string;

    @Prop({})
    building_name: string;

    @Prop({default:false})
    status: boolean;



}
export const DeviceSchema = SchemaFactory.createForClass(Device);
