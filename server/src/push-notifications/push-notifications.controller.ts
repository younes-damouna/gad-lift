import { Body, Controller, Post } from '@nestjs/common';
import { PushNotificationsService } from './push-notifications.service';
import { CreatePushNotificationDto } from './dto/createPushNotifications.dto';

@Controller('push-notifications')
export class PushNotificationsController {
    constructor(private readonly pushNotificationsService: PushNotificationsService) { }

    @Post()
    send() {
        // @Body() createPushNotificationDto:CreatePushNotificationDto
        console.log(`method called ${this.send.name}`)
        return this.pushNotificationsService.send(`eTik-Vl-RVWFzBskKM0bN5:APA91bHciqOX23KU1H7sLi5xIGMarRdMxC1okQ3bO-hkyG4sCrvCAFwUN1WlHYAZuYgqlgh1JZIDERGGovrB0jr6ulm8yprs6s_JsgzbFdTigQ5komJzTVyqFLRfakZSCAhOFFGzl3Wm`, 'string', 'string');

    }
}
