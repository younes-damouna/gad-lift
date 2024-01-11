import { Type } from "class-transformer";
import { IsNotEmpty, IsOptional, IsString, ValidateNested } from "class-validator";
import { User } from "src/entities/user.entity";
import { CreateUserDto } from "src/users/dto/CreateUser.dto";

export class createFamilyDto{
    // @IsString()
    code: string;

    // @IsNotEmpty()
    @ValidateNested()
    @Type(()=>CreateUserDto)
    parent: CreateUserDto;

    @IsOptional()
    requests: User[];

    @IsOptional()
    members: {
        status: string,
        user: User

    }[]
}