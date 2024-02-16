"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.MongoOperations = void 0;
const mongoose_1 = __importDefault(require("mongoose"));
const model_1 = require("./model");
const DB = "mongodb+srv://selvahaarish:YInjmgXapOY9QIMj@cluster0.stkkebn.mongodb.net/?retryWrites=true&w=majority";
class MongoOperations {
    connect() {
        mongoose_1.default.connect(DB).then(() => {
            console.log("CONNCETED TO DATABASE");
        }, (err) => {
            console.log(err);
        });
    }
    createUser(userName, rooms) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const newUser = new model_1.User({
                    userName,
                    rooms
                });
                yield newUser.save();
                console.log("===USER CREATED===");
                console.log(newUser);
                return newUser;
            }
            catch (err) {
                console.log(err);
            }
        });
    }
    createRoom(name, pass, createdAt, createdBy) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const user = yield model_1.User.findById(createdBy);
                if (!user) {
                    console.log("<<<USER NOT FOUND>>>");
                    return;
                }
                const newRoom = new model_1.Room({
                    name,
                    pass,
                    createdAt,
                    createdBy
                });
                user.rooms.push(newRoom._id);
                yield user.save();
                yield newRoom.save();
                const this_room = yield model_1.Room.findById(newRoom._id);
                console.log("===USER===");
                console.log(user);
                console.log("===ROOM===");
                console.log(this_room);
                return this_room;
            }
            catch (err) {
                console.log(err);
            }
        });
    }
    getUser(id) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const user = yield model_1.User.findById(id);
                if (!user) {
                    console.log("User not found");
                    return;
                }
                return user;
            }
            catch (error) {
                console.log(error);
            }
        });
    }
}
exports.MongoOperations = MongoOperations;
