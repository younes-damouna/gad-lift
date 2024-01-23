import { Controller, Get } from '@nestjs/common';
import { DevicesService } from './devices.service';
import { HttpService } from '@nestjs/axios';

@Controller('devices')
export class DevicesController {
    constructor(private deviceService:DevicesService,httpService:HttpService){}

    @Get()
    async testServer(){
        return await this.deviceService.turnMotorUp()
        // await fetch('http://192.168.0.100/LED1/off').then(
             
        // );
    
    }
}
