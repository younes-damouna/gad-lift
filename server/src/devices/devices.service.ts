import { HttpException, Injectable } from '@nestjs/common';
import { HttpService } from "@nestjs/axios";
import axios from 'axios';
import { Control } from 'src/enums/control.enum';

@Injectable()
export class DevicesService {
    constructor(private httpService: HttpService) { }

    async control(action: String): Promise<any> {
        console.log(action);
        try {

            console.log('try')
            const response = await axios.get(`http://192.168.0.100/box/${action}`);

            return {
                "message": response.data,
                "statusCode": 200
            };
        } catch (error) {
            console.log(error)
            // Handle error
            console.error('Error turning on LED on NodeMCU:', error.message);
            // return  HttpException('wrong',400);
        }

        console.log('called')
    }
}
