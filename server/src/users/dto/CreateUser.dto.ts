import { Type } from "class-transformer";
import { IsEmail, IsNotEmpty, IsOptional, IsString, MinLength, ValidateNested, minLength } from "class-validator";

export class CreateUserSettingsDto {

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
    @ValidateNested()
    @Type(()=>CreateUserSettingsDto)
    settings?: CreateUserSettingsDto
}