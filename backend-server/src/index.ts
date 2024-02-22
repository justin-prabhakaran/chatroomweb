import express from "express";
import http from "http";

import { Server } from "socket.io";
import { MongoOperations } from "./mongo";

const server = http.createServer(express());
const io = new Server(server);

const mongoOperations: MongoOperations = new MongoOperations();

mongoOperations.connect();

io.on("connection", (socket) => {
    console.log(socket.conn.remoteAddress + " IS CONNECTED")
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

    //? JOIN ROOM
    socket.on('joinRoom', async (id) => {
        const room = await mongoOperations.connectRoom(id);
        if (room != null) {
            socket.join(room.id);
            socket.emit("roomJoined", true);
        } else {
            socket.emit("roomJoined", false);
        }
    });

    //? GET USER DETAILS
    socket.on("getUser", (id) => {
        console.log("===UPDATE USER CALLED===");
        console.log(id);
        mongoOperations.getUser(id).then((user) => {
            console.log("===user updated===");
            console.log(user);
            socket.emit("userGet", user);
        });
    });

    //? GET ROOM

    socket.on('getRoom', (id: string) => {
        mongoOperations.connectRoom(id).then((room) => {
            socket.emit('roomGot', room);
        })
    });

});

server.listen(3000, () => {
    console.log("server started");
});
