import express from "express";
import http from "http";

import { Server } from "socket.io";
import { MongoOperations } from "./mongo";

const server = http.createServer(express());
const io = new Server(server);

const mongoOperations: MongoOperations = new MongoOperations();

mongoOperations.connect();

io.on("connection", (socket) => {

    socket.onAny((event, args) => {
        console.log(event + " <<<<< " + args);
    })
    socket.onAnyOutgoing((event, args) => {
        console.log(event + " >>>>> " + args)
    })
    console.log(socket.conn.remoteAddress + " IS CONNECTED")
    //? CREATE NEW USER
    socket.on("createUser", ({ userName, uid, rooms }) => {
        console.log(userName + " Connected");
        mongoOperations.createUser(userName, rooms).then((user) => {
            socket.emit("userCreated", user);
        });
    });

    //? CREATE NEW ROOM
    socket.on("createRoom", async ({ id, name, pass, createdAt, createdBy }) => {
        const room = await mongoOperations
            .createRoom(name, pass, createdAt, createdBy)
        if (room != null) {
            console.log(room.id + " IS JOINED");
            socket.join(room.id);

            socket.emit('roomCreated', room);
        }
    });

    //? JOIN ROOM
    socket.on('joinRoom', async (id, userId) => {
        const room = await mongoOperations.connectRoom(id);
        const user = await mongoOperations.getUser(userId);

        if (room != null && user != null) {
            user.rooms.push(room.id);

            await user.save()
            socket.join(room.id);
            console.log(room.id + " IS JOINED");
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

    //? SEND MESSAGE
    socket.on('sendMessage', async ({
        text,
        msgBy,
        time,
        roomId
    }) => {
        console.log(text);
        const chat = await mongoOperations.createChat(text, msgBy, time, roomId);
        const room = await mongoOperations.connectRoom(roomId);
        if (chat != null && room != null) {
            const res = await socket.to(room.id).emit('recieveMessage', chat);
            console.log(socket.rooms);
            console.log(chat);
            console.log(res);

        }
    });


});

server.listen(3000, () => {
    console.log("server started");
});

