import express from "express";
import http from "http";

import { Server } from "socket.io";
import { MongoOperations } from "./mongo";
const server = http.createServer(express());
const io = new Server(server);

const mongoOperations: MongoOperations = new MongoOperations();

mongoOperations.connect();

io.on("connection", (socket) => {
    //? CREATE NEW USER
    socket.on("createUser", ({ userName, uid, rooms }) => {
        console.log(userName + " Connected");
        mongoOperations.createUser(userName, rooms);
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