import mongoose from "mongoose";

export class User {
  
    first_name: string;
    last_name: string;
    email: string;
    password: string;
    user_type: string;
}