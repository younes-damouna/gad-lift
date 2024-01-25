import { Body, Controller, Post } from '@nestjs/common';
import { PushNotificationsService } from './push-notifications.service';
import { CreatePushNotificationDto } from './dto/createPushNotifications.dto';

@Controller('push-notifications')
export class PushNotificationsController {
    constructor(private readonly pushNotificationsService:PushNotificationsService){}

    @Post()
    async send(@Body() createPushNotificationDto:CreatePushNotificationDto){
        console.log(`method called ${this.send.name}`)
        return await this.pushNotificationsService.send(createPushNotificationDto);

    }
}
