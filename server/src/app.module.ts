import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { MongooseModule } from '@nestjs/mongoose';
import { UsersModule } from './users/users.module';
import { AuthModule } from './auth/auth.module';
import { FamiliesModule } from './families/families.module';
import { GoogleStrategy } from './strategy/google.strategy';
import { DevicesModule } from './devices/devices.module';
import { ServeStaticModule } from '@nestjs/serve-static';
import { FileController } from './file.controller';



@Module({
  imports: [  
  //   ServeStaticModule.forRoot({
  //   rootPath: join(__dirname, '..'),
  // }),
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
    DevicesModule,
   
   
  ],
  controllers: [AppController, FileController, ],
  providers: [AppService,GoogleStrategy, ],
})
export class AppModule {}
