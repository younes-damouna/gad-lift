import { IsEmail, IsNotEmpty, IsOptional, IsString, MinLength, minLength } from "class-validator";

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
}