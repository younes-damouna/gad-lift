import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { MongooseModule } from '@nestjs/mongoose';
import { UsersModule } from './users/users.module';
import { AuthModule } from './auth/auth.module';
import { FamiliesModule } from './families/families.module';


@Module({
  imports: [
    ConfigModule.forRoot({isGlobal:true
      // ,
      // envFilePath:'../.env'
    }
      ),
    // importing Mongoose model and load env url
    MongooseModule.forRootAsync({
      imports:[ConfigModule],
      inject:[ConfigService],
      useFactory:async (config:ConfigService)=>({
        uri:config.get<string>('MONGODB_URL')
      })
    }),
    // registring the users module
    UsersModule,
    AuthModule,
    FamiliesModule,
   
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
