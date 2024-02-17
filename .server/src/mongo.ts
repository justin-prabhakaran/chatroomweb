import mongo from "mongoose";
import { User, Room } from "./model";

const DB =
    "mongodb+srv://selvahaarish:YInjmgXapOY9QIMj@cluster0.stkkebn.mongodb.net/?retryWrites=true&w=majority";

module.exports = class Mongo {
    constructor() {

    }
    async createUserMongo(userName, rooms) {
        try {
            const newUser = new User({ userName, rooms });
            await newUser.save();
            console.log(newUser);
            return newUser;
        } catch (error) {
            console.log(error);
        }

    };
    connectMongo() {
        mongo.connect(DB).then(
            () => {
                console.log("db connected");
            },
            (err) => {
                console.log(err);
            }
        );
    };
    async createRoomMongo(id, name, pass, createdAt, createdBy) {
        try {
            // Find the user by id
            const user = await User.findById(createdBy);
            console.log(user)
            if (!user) {
                console.log('User not found');
                return;
            }

            // Create a new room with createdBy set to the user object
            const newRoom = new Room({ name, pass, createdAt, createdBy });
            user.rooms.push(newRoom.id);
            console.log("======USER======");
            console.log(user)

            await user.save();
            await newRoom.save();
            this_room = await Room.findById(newRoom.id);
            console.log("=======ROOM=======");
            console.log(this_room);
            return this_room;
        } catch (err) {
            console.log(err);
        }
    }
    async getUser(id) {
        try {

            const user = await User.findById(id);
            if (!user) {
                console.log("User not found");
                return;
            }
            return user;

        } catch (error) {
            console.log(error)
        }
    }
}
module.exports = { mon }