import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ConfigService } from '@nestjs/config';
import { ValidationPipe } from '@nestjs/common';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  const configService = app.get(ConfigService);
  const port = configService.get<number>('PORT');
  // enable validation globally
  app.useGlobalPipes(new ValidationPipe());
  app.enableCors({ origin: true })

  await app.listen(port);
}
bootstrap();
