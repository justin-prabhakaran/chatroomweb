const mongo = require("mongoose");
const { User, Room, Chat } = require("./model");

const DB =
    "mongodb+srv://selvahaarish:YInjmgXapOY9QIMj@cluster0.stkkebn.mongodb.net/?retryWrites=true&w=majority";

let createUserMongo = async (userName, rooms) => {
    try {
        const newUser = new User({ userName, rooms });
        await newUser.save();
        console.log(newUser);
        return newUser;
    } catch (error) {
        console.log(error);
    }

};
let connectMongo = () => {
    mongo.connect(DB).then(
        () => {
            console.log("db connected");
        },
        (err) => {
            console.log(err);
        }
    );
};
let createRoomMongo = async (id, name, pass, createdBy) => {
    try {
        const newRoom = new Room({ name, pass, createdBy: createdBy.uid });
        await newRoom.save();
        console.log(newRoom);
        return newRoom;
    } catch (err) {
        console.log(err);
    }
}
module.exports = { connectMongo, createUserMongo, createRoomMongo }