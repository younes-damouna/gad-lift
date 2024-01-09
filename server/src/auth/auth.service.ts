import { Injectable } from '@nestjs/common';
import { usersService } from 'src/users/users.service';

@Injectable()
export class AuthService {
    constructor(private usersService:usersService){}

    async validateUser(email:string,password:string){
        const user=await this.usersService.findOne(email);
        if(user &&user.password===password){
            const {password ,...result}=user;
            return result;

        }
        return null;


    }
}
