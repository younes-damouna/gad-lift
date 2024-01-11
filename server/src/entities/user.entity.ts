import mongoose from "mongoose";

export class User {
    // id:mongoose.Schema.Types.ObjectId;
    first_name: string;
    last_name: string;
    email: string;
    password: string;
    user_type: string;
}