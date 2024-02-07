const mongo = require("mongoose");
const { User, Room, Chat } = require("./model");

const DB =
    "mongodb+srv://selvahaarish:YInjmgXapOY9QIMj@cluster0.stkkebn.mongodb.net/?retryWrites=true&w=majority";

let createUser = async (name, rooms) => {
    console.log(name + "<>" + rooms);
    const user = new User({
        name,
        rooms,
    });
    return await user.save().then(
        (data) => {
            return data._id.toString();
        }
    );
};
let connect = () => {
    mongo.connect(DB).then(
        () => {
            console.log("db connected");
        },
        (err) => {
            console.log(err);
        }
    );
};

module.exports = { connect, createUser }