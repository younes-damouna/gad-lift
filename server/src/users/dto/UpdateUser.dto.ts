import { Type } from "class-transformer";
import { IsOptional, IsString } from "class-validator";
import { createFamilyDto } from "src/families/dto/CreateFamily.dto";

export class UpdateUserDto {
    @IsOptional()
    @IsString()
    first_name?: string;

    @IsOptional()
    @IsString()
    last_name?: string;

    @IsOptional()
    @IsString()
    password?: string;

    @Type(() => createFamilyDto)

    family: createFamilyDto

}