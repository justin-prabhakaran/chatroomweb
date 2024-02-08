const app = require("express")();

const { Server } = require("socket.io");
const http = require("http").createServer(app);
const io = new Server(http);

const { connect, createUser } = require('./mongo');
let count = 0;
connect();
io.on("connection", (socket) => {
    count++;
    console.log(count);
    console.log(socket.handshake.address + " -- connected");

    socket.on("createUser", ({ name, rooms }) => {
        console.log(name + "-------" + rooms);
        createUser(name, rooms).then((id) => {
            count++;
            socket.emit("userCreated", { id });
            console.log(id);
            console.log(count);
        });
    });
});

http.listen(3000, () => {
    console.log("server started");
});

