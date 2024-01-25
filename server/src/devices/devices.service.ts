import { HttpException, Injectable } from '@nestjs/common';
import { HttpService } from "@nestjs/axios";
import axios from 'axios';
import { Control } from 'src/enums/control.enum';

@Injectable()
export class DevicesService {
    constructor(private httpService: HttpService) { }

    async control(action: String): Promise<any> {
       
        try {

            
            const response = await axios.get(`http://192.168.0.100/box/${action}`);

            return {
                "message": response.data,
                "statusCode": 200
            };
        } catch (error) {

            console.error('Error turning reaching to Node MCU', error.message);
            return new HttpException(error.message, 400);
        }


    }
}
