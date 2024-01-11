import { Module } from "@nestjs/common";
import { MongooseModule } from "@nestjs/mongoose";
import mongoose from "mongoose";
import { Family, FamilySchema } from "src/schemas/family.schema";


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
    providers: [],
    exports: []
})

export class FamiliesModule { }