import { Controller, Get, Param, Post, UseGuards } from '@nestjs/common';
import { DevicesService } from './devices.service';
import { HttpService } from '@nestjs/axios';
import { Control } from 'src/enums/control.enum';
import { AuthGuard } from 'src/auth/auth.guard';
import { RolesGuard } from 'src/guards/roles.guard';
import { Role } from 'src/enums/role.enum';
import { Roles } from 'src/customDecorators/roles.decorator';

@Controller('devices')
export class DevicesController {
    constructor(private deviceService: DevicesService, httpService: HttpService) { }

    @Get(':action')
    @UseGuards(AuthGuard)
    async testServer(@Param('action') action: String) {
        return await this.deviceService.control(action)


    }


    @Get()
    @UseGuards(AuthGuard)
    async getDevices() {
        return await this.deviceService.getDevices()


    }

    @Roles(Role.Admin)
    @UseGuards(RolesGuard)
    @Post()
    @UseGuards(AuthGuard)
    async addDevice() {
        return await this.deviceService.getDevices()


    }
}
