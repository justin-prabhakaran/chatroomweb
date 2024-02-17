"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const http_1 = __importDefault(require("http"));
const socket_io_1 = require("socket.io");
const mongo_1 = require("./mongo");
const server = http_1.default.createServer((0, express_1.default)());
const io = new socket_io_1.Server(server);
const mongoOperations = new mongo_1.MongoOperations();
mongoOperations.connect();
io.on("connection", (socket) => {
    //? CREATE NEW USER
    socket.on("createUser", ({ userName, uid, rooms }) => {
        console.log(userName + " Connected");
        mongoOperations.createUser(userName, rooms).then((user) => {
            socket.emit("userCreated", user);
        });
    });
    //? CREATE NEW ROOM
    socket.on("createRoom", ({ id, name, pass, createdAt, createdBy }) => {
        mongoOperations
            .createRoom(name, pass, createdAt, createdBy)
            .then((room) => {
            socket.emit("roomCreated", room);
        });
    });
    socket.on("getUser", ({ uid, userName, rooms }) => {
        console.log("===UPDATE USER CALLED===");
        console.log({ uid, userName, rooms });
        mongoOperations.getUser(uid).then((user) => {
            console.log("===user updated===");
            console.log(user);
            socket.emit("userGet", user);
        });
    });
});
server.listen(3000, () => {
    console.log("server started");
});
