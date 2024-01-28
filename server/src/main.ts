import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ConfigService } from '@nestjs/config';
import { ValidationPipe } from '@nestjs/common';
import * as admin from 'firebase-admin';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  const configService = app.get(ConfigService);
  const port = configService.get<number>('PORT');
  // enable validation globally
  app.useGlobalPipes(new ValidationPipe());
  app.enableCors({ origin: true })

  const firebaseConfig = {
    type: configService.get<string>('TYPE'),
    project_id: configService.get<string>('PROJECT_ID'),
    private_key_id: configService.get<string>('PRIVATE_KEY_ID'),
    private_key: (configService.get<string>('PRIVATE_KEY')).replace(/\\n/g, '\n'),
    client_email: configService.get<string>('CLIENT_EMAIL'),
    client_id: configService.get<string>('CLIENT_ID'),
    auth_uri: configService.get<string>('AUTH_URI'),
    token_uri: configService.get<string>('TOKEN_URI'),
    auth_provider_x509_cert_url: configService.get<string>('AUTH_CERT_URL'),
    client_x509_cert_url: configService.get<string>('CLIENT_CERT_URL'),
    universe_domain: configService.get<string>('UNIVERSAL_DOMAIN'),
  } as admin.ServiceAccount;

   
  if (!admin.apps.length) {
    // Initialize the app if it hasn't been initialized yet
    admin.initializeApp({
      credential: admin.credential.cert(firebaseConfig),
    });
  }
  const firebaseApp = admin.app();

  // app.set('firebaseApp', firebaseApp);
  await app.listen(port);
}
bootstrap();
