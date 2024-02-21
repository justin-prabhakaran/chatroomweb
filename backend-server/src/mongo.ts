import mongoose from "mongoose";
import { Chat, Room, User } from "./model";

const DB: string = "mongodb+srv://selvahaarish:YInjmgXapOY9QIMj@cluster0.stkkebn.mongodb.net/?retryWrites=true&w=majority";

export class MongoOperations {

    connect() {
        mongoose.connect(DB).then(() => {
            console.log("CONNCETED TO DATABASE");
        },
            (err) => {
                console.log(err);
            });
    }

    async createUser(userName: string, rooms: Array<string>) {
        try {
            const newUser: mongoose.Document = new User({
                userName,
                rooms
            });
            await newUser.save();
            console.log("===USER CREATED===");
            console.log(newUser);
            return newUser;
        } catch (err) {
            console.log(err);
        }
    }

    async createRoom(name: string, pass: string | null, createdAt: number, createdBy: string) {
        try {
            const user = await User.findById(createdBy);
            if (!user) {
                console.log("<<<USER NOT FOUND>>>");
                return;
            }

            const newRoom = new Room({
                name,
                pass,
                createdAt,
                createdBy
            });
            user.rooms.push(newRoom._id);

            await user.save();
            await newRoom.save();


            const this_room = await Room.findById(newRoom._id);

            console.log("===USER===");
            console.log(user);
            console.log("===ROOM===");
            console.log(this_room);

            return this_room;
        } catch (err) {
            console.log(err);
        }
    }
    async getUser(id: string) {
        try {

            const user = await User.findById(id);
            if (user == null) {
                console.log("User not found");
                return;
            }
            return user;

        } catch (error) {
            console.log(error);
        }
    }

    async createChat(message: string, by: string, time: Number) {
        try {
            const user = await User.findById(by);
            if (user != null) {
                const newChat = new Chat(
                    message,
                    by,
                    time
                );
                return newChat;
            }
        } catch (err) {
            console.log(err);
        }
    }

    async getChat(id: string) {
        try {
            const chat = await Chat.findById(id);
            if (chat != null) {
                return chat;
            }
        } catch (err) {
            console.log("Chat Not Found");
        }
    }

    async connectRoom(id: string) {
        try {
            const room = await Room.findById(id);
            if (room != null) {
                return room;
            }
            console.log("CANNOT CONNECT TO ROOM <NOT FOUND>!!");
        } catch (err) {
            console.log(err);
        }
    }


}