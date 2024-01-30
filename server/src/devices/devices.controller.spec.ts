import { Test, TestingModule } from '@nestjs/testing';
import { DevicesController } from './devices.controller';
// import { beforeEach, describe, it } from 'node:test';
import { DevicesService } from './devices.service';
import { HttpService } from '@nestjs/axios';

describe('DevicesController', () => {
  let deviceController: DevicesController;
  let deviceService: DevicesService;

  const mockDevice = {
    _id: '61c0ccf11d7bf83d153d7c06',

    mac_address: '12-12-12-12-12-12-12-12',
    ip_address: '192.168.1.0',
   building:"hi",
    status:false

  };

  const mockUser = {
    _id: '61c0ccf11d7bf83d153d7c06',
    first_name: 'ali',
    title: 'user',
    email: 'youda@example.com',
  };

  const mockDeviceService: any = {
    findAll: jest.fn().mockResolvedValueOnce([mockDevice]),
    create: jest.fn(),
    findById: jest.fn().mockResolvedValueOnce(mockDevice),
    updateById: jest.fn(),
    deleteById: jest.fn().mockResolvedValueOnce({ deleted: true }),
  };
  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [DevicesController],
      providers: [
        {
          provide: deviceService as any,
          useValue: mockDeviceService,
        }, HttpService]
    }).compile();

    deviceController = module.get<DevicesController>(DevicesController);
  });

  it('should be defined', () => {
    expect(deviceController).toBeDefined();
  });


  // describe('getAllBooks', () => {
  //   it('should get all books', async () => {
  //     const result = await deviceController.getDevices();

  //     expect(deviceService.getDevices).toHaveBeenCalled();
  //     expect(result).toEqual([mockDevice]);
  //   });
  // });



});



