// import { Inject, Injectable } from '@nestjs/common';
// import { ConfigService } from '@nestjs/config';
// import * as admin from 'firebase-admin';
// import * as serviceAccount from './../../firebase-admin-sdk.json';
// import { CreatePushNotificationDto } from './dto/createPushNotifications.dto';
// import { firebaseApp } from 'src/config/firebase.config';
// @Injectable()
// export class  {
//     // constructor(@Inject(firebaseApp) private readonly firebaseApp: admin.app.App){}
//     // async send(createPushNotificationDto:CreatePushNotificationDto) {


//     // }
// }
import { Injectable } from '@nestjs/common';
import * as admin from 'firebase-admin';
import { from, Observable } from 'rxjs';

@Injectable()
export class PushNotificationsService {
  private messaging: admin.messaging.Messaging;
  private readonly app: admin.app.App;

  constructor() {
    const serviceAccount = require('./../../firebase-admin-sdk.json')
    if (!admin.apps.length) {
    admin.initializeApp({
      credential: admin.credential.cert(serviceAccount),
    },      
    );
} else {
    // Use the default app if it has already been initialized
    this.app = admin.app();
  }

    this.messaging = admin.messaging();
  }

  async send(token: string, title: string, body: string) {
    const message: admin.messaging.Message = {
      notification: {
        title: title,
        body: body,
      },
      token: token,
    };

    return  from(this.messaging.send(message));
  }
}
