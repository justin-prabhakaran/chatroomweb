const app = require("express")();

const { Server } = require("socket.io");
const http = require("http").createServer(app);
const io = new Server(http);

const { connectMongo, createUserMongo, createRoomMongo } = require('./mongo');


connectMongo();

io.on("connection", (socket) => {

    console.log(socket.request.connection.remoteAddress + " :: connected");

    socket.on("createUser", ({ userName, uid, rooms }) => {
        console.log(userName + "-------" + rooms);
        createUserMongo(userName, rooms).then((user) => {
            socket.emit("userCreated", user);
        });
    });

    socket.on("createRoom", ({ id, name, pass, createdBy }) => {
        createRoomMongo(id, name, pass, createdBy).then((room) => {
            socket.emit("roomCreated", room);
        });
    });
});

http.listen(3000, () => {
    console.log("server started");
});

