import { Test, TestingModule } from '@nestjs/testing';
import { FamiliesController } from './families.controller';
// import { beforeEach, describe, it } from 'node:test';
import { FamiliesService } from './families.service';
import { Family } from 'src/entities/family.entity';
import { Model } from 'mongoose';
import { PushNotificationsService } from 'src/push-notifications/push-notifications.service';
import { pushNotifications } from 'electron';
import { Controller } from '@nestjs/common';
// import jest from '@jest/globals'
// import jest from 'jest'
import jest from 'jest'
import { User } from 'src/entities/user.entity';
import { PassportModule } from '@nestjs/passport';
describe('FamiliesController', () => {
  let familyController: FamiliesController;
  let familyService: FamiliesService;
  let pushNotificationsService:PushNotificationsService
  const mockUser = new User();
  mockUser.first_name = "user"
  mockUser.last_name = "user"
  mockUser.email = "email@example.com"
  mockUser.password = "12345678"

  const mocKfamily = new Family();
  mocKfamily.code = "123123"
  mocKfamily.members = []
  mocKfamily.requests = []
  mocKfamily.parent = mockUser

  const mockFamilyService = {
    findAll: (familyService as any).fn().mockResolvedValueOnce([mocKfamily]),
    create:(familyService as any).fn(),
    findById: (familyService as any).fn().mockResolvedValueOnce(mocKfamily),
    updateById: (familyService as any).fn(),
    deleteById: (familyService as any).fn().mockResolvedValueOnce({ deleted: true }),
  }


  beforeEach(async () => {


    const module: TestingModule = await Test.createTestingModule({
      imports: [
        PassportModule.register(
          [
            { defaultStrategy: 'jwt' }
          ]
        )
      ],
      controllers: [FamiliesController,],
      providers: [{
        provide: FamiliesService,
        useValue: mockFamilyService,
      }, PushNotificationsService]

    }).compile();
    familyService = module.get<FamiliesService>(FamiliesService);
    familyController = module.get<FamiliesController>(FamiliesController);


  });

  it('should be defined', () => {
    expect(familyController).toBeDefined();
  });

  describe('getAllBooks', () => {
    it('should get all books', async () => {
      const result = await familyController.getFamilies();

      expect(familyService.getFamilies).toHaveBeenCalled();
      expect(result).toEqual([mocKfamily]);
    });
  });
  // it('should be defined', () => {
  //   const result = ['test'];
  //   // jest.spyOn(service, 'findAll').mockImplementation(() => result);

  //   // expect( service.getFamilies()).toBe(result);
  // });
});
