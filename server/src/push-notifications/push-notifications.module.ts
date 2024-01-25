import { Module } from '@nestjs/common';
import { PushNotificationsController } from './push-notifications.controller';
import { PushNotificationsService } from './push-notifications.service';
 import * as admin from 'firebase-admin';
@Module({
  controllers: [PushNotificationsController],
  providers: [PushNotificationsService]
})
export class PushNotificationsModule {}
