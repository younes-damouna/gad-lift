import { Module } from '@nestjs/common';
import { DevicesController } from './devices.controller';
import { DevicesService } from './devices.service';
import { MongooseModule } from '@nestjs/mongoose';
import { Device, DeviceSchema } from 'src/schemas/device.schema';
import { HttpModule } from '@nestjs/axios';

@Module({
  imports: [,
    MongooseModule.forFeature([
      {
        name: Device.name,
        schema: DeviceSchema
      }
    ])
  ],
  controllers: [DevicesController],
  providers: [DevicesService]
})
export class DevicesModule { }
