import { Controller, Get, Param, UseGuards } from '@nestjs/common';
import { DevicesService } from './devices.service';
import { HttpService } from '@nestjs/axios';
import { Control } from 'src/enums/control.enum';
import { AuthGuard } from 'src/auth/auth.guard';

@Controller('devices')
export class DevicesController {
    constructor(private deviceService: DevicesService, httpService: HttpService) { }

    @Get(':action')
    @UseGuards(AuthGuard)
    async testServer(@Param('action') action: String) {
        return await this.deviceService.control(action)
       

    }
}
