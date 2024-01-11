import { Body, Controller, Post, Request, UseGuards } from '@nestjs/common';
import { FamiliesService } from './families.service';
import { AuthGuard } from 'src/auth/auth.guard';
import { createFamilyDto } from './dto/CreateFamily.dto';

@Controller('families')
export class FamiliesController {
    constructor(private familyService: FamiliesService) { }
    @Post()
    @UseGuards(AuthGuard)
    async createFamily(@Request() req, @Body() createFamilyDto: createFamilyDto) {


        return this.familyService.createFamily(createFamilyDto, req)
        // console.log(req.user)
    }

    @Post('/request-to-join')
    @UseGuards(AuthGuard)
    async requestToJoinFamily(@Request() req, @Body('code') code) {
        return this.familyService.requestTojoinFamily(req, code);

    }
    @Post('/accept-member')
    @UseGuards(AuthGuard)
    async acceptMember(@Body('id') id) {
        return this.familyService.acceptMember(id);

    }

}
