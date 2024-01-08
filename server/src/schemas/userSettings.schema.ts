import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";


@Schema()
export class UserSettings{
    @Prop({default:"light",required:false})
    theme:string;
    @Prop({default:"en",required:false})
    language:string;
}
export const UserSettingsSchema=SchemaFactory.createForClass(UserSettings);