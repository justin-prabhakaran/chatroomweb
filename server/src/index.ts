const app = require("express")();
const { Mongo } = require("./mongo");
const { Server } = require("socket.io");
const http = require("http").createServer(app);
const io = new Server(http);

const mongo = new Mongo()
mongo.conn

io.on("connection", (socket) => {

    console.log(socket.request.connection.remoteAddress + " :: connected");

    socket.on("createUser", ({ userName: , uid, rooms }) => {
        console.log(userName + "-------" + rooms);
        mon.createUserMongo(userName, rooms).then((user) => {
            socket.emit("userCreated", user);
        });
    });

    socket.on("createRoom", ({ id, name, pass, createdAt, createdBy }) => {
        mon.createRoomMongo(id, name, pass, createdAt, createdBy).then((room) => {
            socket.emit("roomCreated", room);
        });
    });

    socket.on("getUser", ({ userName, uid, rooms }) => {
        mon.getUser(uid).then((user) => {
            console.log("======user updated======");
            console.log(user);
            socket.emit("userGet", user);
        });
    });

});

http.listen(3000, () => {
    console.log("server started");
});

