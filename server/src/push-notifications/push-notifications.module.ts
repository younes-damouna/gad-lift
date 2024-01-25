import { Module } from '@nestjs/common';
import { PushNotificationsController } from './push-notifications.controller';
import { PushNotificationsService } from './push-notifications.service';
import { ConfigModule, ConfigService } from '@nestjs/config';

@Module({
  imports:[
  
   
   

    
  ],
  controllers: [PushNotificationsController],
  providers: [PushNotificationsService
  ]
})
export class PushNotificationsModule {}
