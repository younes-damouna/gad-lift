import { Type } from "class-transformer";
import { IsEmail, IsNotEmpty, IsOptional, IsString, MinLength, ValidateNested, minLength } from "class-validator";
import { User } from "../../entities/user.entity";

export class CreateUserSettingsDto extends  User{

    @IsOptional()
    theme?: string;

    @IsOptional()
    language?: string;
}
export class CreateUserDto {
    // Validating the data that is coming from the frontend
    @IsNotEmpty()
    @IsString()
    first_name: string;

    @IsOptional()
    mobile_number?: number;
    
    @IsNotEmpty()
    @IsString()
    last_name: string;

    @IsNotEmpty()
    @IsString()
    @IsEmail()

    email: string;

    @IsNotEmpty()
    @IsString()
    @MinLength(8)
    password: string;

    @IsOptional()
    user_type?: string;

    @IsOptional()
    profile_img?:String;

    @IsOptional()
    @ValidateNested()
    @Type(()=>CreateUserSettingsDto)
    settings?: CreateUserSettingsDto;
}