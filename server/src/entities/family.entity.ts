import { User } from "./user.entity";

export class Family {
    code: string;
    parent: User;
    requests: User[];
    members: {
        status: string,
        user: User

    }[]

}