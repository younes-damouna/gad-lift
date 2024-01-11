import { IsNotEmpty, IsOptional, IsString } from "class-validator";
import { User } from "src/entities/user.entity";

export class createFamilyDto{
    @IsString()
    code: string;

    @IsNotEmpty()
    parent: User;

    @IsOptional()
    requests: User[];
    @IsOptional()

    members: {
        status: string,
        user: User

    }[]
}