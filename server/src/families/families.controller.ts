import { Body, Controller, Post, Request, UseGuards } from '@nestjs/common';
import { FamiliesService } from './families.service';
import { AuthGuard } from 'src/auth/auth.guard';
import { createFamilyDto } from './dto/CreateFamily.dto';
import { RolesGuard } from 'src/guards/roles.guard';
import { Roles } from 'src/customDecorators/roles.decorator';
import { Role } from 'src/enums/role.enum';

@Controller('families')
export class FamiliesController {
    constructor(private familyService: FamiliesService) { }
    @Post()
    @UseGuards(AuthGuard)
    async createFamily(@Request() req, @Body() createFamilyDto: createFamilyDto) {


        return this.familyService.createFamily(createFamilyDto, req)

    }

    @Post('/request-to-join')
    @UseGuards(AuthGuard)

    async requestToJoinFamily(@Request() req, @Body('code') code) {


        return this.familyService.requestTojoinFamily(req, code);

    }

    @Post('/get-requests')
    @UseGuards(AuthGuard)

    async getRequests(@Request() req) {


        return this.familyService.getRequests(req);

    }

    @Roles(Role.User)
    @UseGuards(RolesGuard)
    @Post('/accept-member')
    @UseGuards(AuthGuard)
    async acceptMember(@Body('id') id) {
        return this.familyService.acceptMember(id);

    }

    @Post('/is-parent')
    @UseGuards(AuthGuard)
    async checkIfParent(@Request() req){
      
        
        return this.familyService.checkIfParent(req);

    }

}
