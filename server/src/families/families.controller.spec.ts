import { Test, TestingModule } from '@nestjs/testing';
import { FamiliesController } from './families.controller';
import { beforeEach, describe, it } from 'node:test';
import { FamiliesService } from './families.service';
import { Family } from 'src/entities/family.entity';
import { Model } from 'mongoose';
import { PushNotificationsService } from 'src/push-notifications/push-notifications.service';
import { pushNotifications } from 'electron';
import { Controller } from '@nestjs/common';
import jest from '@jest/globals'
describe('FamiliesController', () => {
  let controller: FamiliesController;
  let service:FamiliesService;
  let pushNotifications:PushNotificationsService;
  let model=Family;

  beforeEach(async () => {
    service=new FamiliesService(  Model, pushNotifications);

    const module: TestingModule = await Test.createTestingModule({
      controllers: [FamiliesController],
    }).compile();

    controller = module.get<FamiliesController>(FamiliesController);
  });

  it('should be defined', () => {
    const result = ['test'];
    jest.spyOn(service, 'findAll').mockImplementation(() => result);

    expect( service.getFamilies()).toBe(result);
  });
});
