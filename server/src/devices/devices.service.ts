import { HttpException, Injectable, Request, UnprocessableEntityException } from '@nestjs/common';
import { HttpService } from "@nestjs/axios";
import axios from 'axios';
import { Control } from 'src/enums/control.enum';
import { InjectModel } from '@nestjs/mongoose';
import { Device } from 'src/schemas/device.schema';
import { Model } from 'mongoose';
import { createDeviceDto } from './dto/creatDevice.dto';

@Injectable()
export class DevicesService {
    constructor(private httpService: HttpService, @InjectModel(Device.name) private DeviceModel: Model<Device>) { }

    async control(action: String): Promise<any> {

        try {


            const response = await axios.get(`http://192.168.0.100/box/${action}`);

            return {
                "message": response.data,
                "statusCode": 200
            };
        } catch (error) {

            console.error('Error turning reaching to Node MCU', error.message);
            return new HttpException(error.message, 400);
        }


    }
    async getDevices() {
        return this.DeviceModel.find();

    }
    async addDevice(createDeviceDto: createDeviceDto, @Request() req) {
        const createDevice = new this.DeviceModel(createDeviceDto);
        const device = await this.findOne(createDeviceDto.mac_address);
        if (device) {
            throw new UnprocessableEntityException();
        } else {
            return createDevice.save();

        }
        // return this.DeviceModel
    }

    async findOne(mac_address: string): Promise<any> {
        const device = await this.DeviceModel.findOne({ mac_address });

        return device;

    }

}
