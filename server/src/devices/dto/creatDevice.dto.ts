import { IsIP, IsMACAddress, IsNotEmpty, IsOptional, IsString } from "class-validator";
import { isIPv4 } from "net";

export class createDeviceDto {
    @IsNotEmpty()
 
    @IsMACAddress()
    mac_address: string;
    @IsNotEmpty()
    @IsIP()
    
    ip_address: string;
    @IsNotEmpty()
    @IsString()
    building_name: string;
    @IsOptional()

    status: boolean;

}