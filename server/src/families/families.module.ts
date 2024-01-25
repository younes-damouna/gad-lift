import { Module } from "@nestjs/common";
import { MongooseModule } from "@nestjs/mongoose";
import mongoose from "mongoose";
import { Family, FamilySchema } from "src/schemas/family.schema";
import { FamiliesController } from './families.controller';
import { FamiliesService } from './families.service';
import { PushNotificationsService } from "src/push-notifications/push-notifications.service";


@Module({
    imports: [
        MongooseModule.forFeature(
            [
                {
                    name: Family.name,
                    schema: FamilySchema
                }
            ]
        )
    ],
    providers: [FamiliesService,PushNotificationsService,],
    exports: [],
    controllers: [FamiliesController]
})

export class FamiliesModule { }