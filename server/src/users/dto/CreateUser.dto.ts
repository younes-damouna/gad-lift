import { IsNotEmpty, IsString } from "class-validator";

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
    email: string;

    @IsNotEmpty()
    @IsString()
    password: string;

    user_type?: string;
}