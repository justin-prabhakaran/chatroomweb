const app = require("express")();

const { Server } = require("socket.io");
const http = require("http").createServer(app);
const io = new Server(http);

const { connect, createUser } = require('./mongo');
let count = 0;
connect();
io.on("connection", (socket) => {
    count++;
    console.log(socket.id + " -- connected");

    socket.on("createUser", ({ name, rooms }) => {
        console.log(name + "-------" + rooms);
        createUser(name, rooms).then((id) => {
            socket.emit("userCreated", { id });
            console.log(id);
        });
    });
});

http.listen(3000, () => {
    console.log("server started");
});

