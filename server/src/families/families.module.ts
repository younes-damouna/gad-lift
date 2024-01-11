import { Module } from "@nestjs/common";
import { MongooseModule } from "@nestjs/mongoose";
import mongoose from "mongoose";
import { Family, FamilySchema } from "src/schemas/family.schema";
import { FamiliesController } from './families.controller';
import { FamiliesService } from './families.service';


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
    providers: [FamiliesService],
    exports: [],
    controllers: [FamiliesController]
})

export class FamiliesModule { }