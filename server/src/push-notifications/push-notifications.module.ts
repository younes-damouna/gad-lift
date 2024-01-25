import { Module } from '@nestjs/common';
import { PushNotificationsController } from './push-notifications.controller';

@Module({
  controllers: [PushNotificationsController]
})
export class PushNotificationsModule {}
