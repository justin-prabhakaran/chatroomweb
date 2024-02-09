const mongoose = require('mongoose');

// User Schema
const userSchema = new mongoose.Schema({
  uid: {
    type: mongoose.Schema.Types.ObjectId,
    default: function () {
      return this._id
    },
  },
  userName: {
    type: String,
    required: true
  },
  rooms: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Room'
    }
  ]
});

const User = mongoose.model('User', userSchema);

// Room Schema
const roomSchema = new mongoose.Schema({
  id: {
    type: mongoose.Schema.Types.ObjectId,
    default: function () {
      return this._id;
    }
  },
  name: {
    type: String,
    required: true
  },
  pass: {
    type: String,
  },
  createdBy: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
});

const Room = mongoose.model('Room', roomSchema);

// Chat Schema
const chatSchema = new mongoose.Schema({
  message: {
    type: String,
    required: true
  },
  time: {
    type: Date,
    default: Date.now
  },
  from: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  to: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Room',
    required: true
  }
});

const Chat = mongoose.model('Chat', chatSchema);

module.exports = { User, Room, Chat };