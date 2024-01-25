import { Body, Controller, Post } from '@nestjs/common';
import { PushNotificationsService } from './push-notifications.service';

@Controller('push-notifications')
export class PushNotificationsController {
    constructor(private readonly pushNotificationsService:PushNotificationsService){}

    @Post()
    async send(@Body() pushNotificationDto:PushNotificationDto){
        console.log(`method called ${this.send.name}`)
        return await this.pushNotificationsService.send(pushNotificationsDto);

    }
}
