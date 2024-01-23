import { Controller, Get, Param } from '@nestjs/common';
import { DevicesService } from './devices.service';
import { HttpService } from '@nestjs/axios';
import { Control } from 'src/enums/control.enum';

@Controller('devices')
export class DevicesController {
    constructor(private deviceService: DevicesService, httpService: HttpService) { }

    @Get(':action')
    async testServer(@Param('action') action: String) {
        return await this.deviceService.control(action)
       

    }
}
