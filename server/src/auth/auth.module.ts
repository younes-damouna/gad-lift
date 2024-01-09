import { Module } from '@nestjs/common';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import { UsersModule } from 'src/users/users.module';
import { JwtModule } from '@nestjs/jwt';
import { jwtConstants } from 'src/strategy/constants';
import { HashService } from 'src/common/hash.service';

@Module({
  imports: [UsersModule,
    JwtModule.register({
      global: true,
      secret: jwtConstants.secret,
      signOptions: { expiresIn: '3600s' },
    }),
    ],

  controllers: [AuthController],
  providers: [AuthService,HashService],
  exports: [AuthService],

})
export class AuthModule {}
