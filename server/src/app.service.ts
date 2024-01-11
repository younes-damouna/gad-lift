import { Injectable, Req } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Hello World!';
  }
  googleLogin(@Req() req) {
    if (!req.user) {
      return 'No user from google'
    }
  }
}
