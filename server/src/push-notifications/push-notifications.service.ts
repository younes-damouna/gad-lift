import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import * as admin from 'firebase-admin';

import * as serviceAccount from './../../firebase-admin-sdk.json';
import { CreatePushNotificationDto } from './dto/createPushNotifications.dto';
@Injectable()
export class PushNotificationsService {
   
   
    //     const firebaseConfig = {
    //         type: configService.get<string>('TYPE'),
    //         project_id: configService.get<string>('PROJECT_ID'),
    //         private_key_id: configService.get<string>('PRIVATE_KEY_ID'),
    //         private_key: configService.get<string>('PRIVATE_KEY').replace(/\\n/g, '\n'),
    //         client_email: configService.get<string>('CLIENT_EMAIL'),
    //         client_id: configService.get<string>('CLIENT_ID'),
    //         auth_uri: configService.get<string>('AUTH_URI'),
    //         token_uri: configService.get<string>('TOKEN_URI'),
    //         auth_provider_x509_cert_url: configService.get<string>('AUTH_PROVIDER_X509_CERT_URL'),
    //         client_x509_cert_url: configService.get<string>('CLIENT_X509_CERT_URL'),
    //       } as admin.ServiceAccount;
    //     console.log(`${serviceAccount.auth_provider_x509_cert_url}`);
  
    async send(createPushNotificationDto:CreatePushNotificationDto) {


    }
}
