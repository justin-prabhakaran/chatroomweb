
import mongoose, { Schema, Document } from "mongoose";

interface RoomDoc extends Document {
    id: Schema.Types.ObjectId,
    name: string
    pass: string
    createdAt: number
    createdBy: Schema.Types.ObjectId
}

interface UserDoc extends Document {
    uid: Schema.Types.ObjectId
    userName: string
    rooms: Array<Schema.Types.ObjectId>
}

interface ChatDoc extends Document {
    id: Schema.Types.ObjectId
    text: String
    msgBy: Schema.Types.ObjectId
    time: Number,
    roomId: Schema.Types.ObjectId
}

const chatScema = new Schema<ChatDoc>({
    id: {
        type: Schema.Types.ObjectId,
        default: function (this: ChatDoc) {
            return this._id;
        }
    },
    text: {
        type: String,
        required: true
    },
    msgBy: {
        type: Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },
    time: {
        type: Number,
        required: true
    },
    roomId: {
        type: Schema.Types.ObjectId,
        ref: 'Room',
        required: true
    }

});
const roomSchema = new Schema<RoomDoc>({
    id: {
        type: Schema.Types.ObjectId,
        default: function (this: RoomDoc) {
            return this._id;
        }
    },
    name: {
        type: String,
        require: true,
    },
    pass: String,
    createdAt: {
        type: Number,
        required: true,
    },
    createdBy: {
        type: Schema.Types.ObjectId,
        ref: 'User',
        required: true,
    },

});

const userSchema = new Schema<UserDoc>({
    uid: {
        type: Schema.Types.ObjectId,
        default: function (this: UserDoc) {
            return this._id;
        }
    },
    userName: {
        type: String,
        required: true
    },
    rooms: [{
        type: Schema.Types.ObjectId,
        ref: 'Room',
    }]
});

export const Room = mongoose.model<RoomDoc>('Room', roomSchema);
export const User = mongoose.model<UserDoc>('User', userSchema);
export const Chat = mongoose.model<ChatDoc>('Chat', chatScema);