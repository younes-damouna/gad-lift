import { IsIP, IsMACAddress, IsNotEmpty, IsString } from "class-validator";
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
    @IsNotEmpty()

    status: boolean;

}