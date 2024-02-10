// const mongoose = require('mongoose');

// // User Schema
// const userSchema = new mongoose.Schema({
//   uid: {
//     type: mongoose.Schema.Types.ObjectId,
//     default: function () {
//       return this._id
//     },
//   },
//   userName: {
//     type: String,
//     required: true
//   },
//   rooms: [
//     {
//       type: mongoose.Schema.Types.ObjectId,
//       ref: 'Room'
//     }
//   ]
// });

// const User = mongoose.model('User', userSchema);

// // Room Schema
// const roomSchema = new mongoose.Schema({
//   id: {
//     type: mongoose.Schema.Types.ObjectId,
//     default: function () {
//       return this._id;
//     }
//   },
//   name: {
//     type: String,
//     required: true
//   },
//   pass: {
//     type: String,
//   },
//   createdAt: {
//     type: Number
//   },
//   createdBy: {
//     type: mongoose.Schema.Types.ObjectId,
//     ref: 'User',
//     required: true
//   },
// });

// const Room = mongoose.model('Room', roomSchema);

// // Chat Schema
// const chatSchema = new mongoose.Schema({
//   message: {
//     type: String,
//     required: true
//   },
//   time: {
//     type: Date,
//     default: Date.now
//   },
//   from: {
//     type: mongoose.Schema.Types.ObjectId,
//     ref: 'User',
//     required: true
//   },
//   to: {
//     type: mongoose.Schema.Types.ObjectId,
//     ref: 'Room',
//     required: true
//   }
// });

// const Chat = mongoose.model('Chat', chatSchema);

// module.exports = { User, Room, Chat };


const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// Define Room Schema
const roomSchema = new Schema({
  id: {
    type: String,
    default: function () {
      return this._id
    }
  },
  name: {
    type: String,
    required: true,
  },
  pass: String,
  createdAt: {
    type: Number,
    required: true,
  },
  createdBy: {
    type: Schema.Types.ObjectId,
    ref: 'User', // Assuming User model is also defined
    required: true,
  }
});

// Define User Schema
const userSchema = new Schema({
  userName: {
    type: String,
    required: true,
  },
  uid: {
    type: String,
    default: function () {
      return this._id
    }
  },
  rooms: [{
    type: Schema.Types.ObjectId,
    ref: 'Room', // Assuming Room model is also defined
  }]
});

// Define models based on schemas
const Room = mongoose.model('Room', roomSchema);
const User = mongoose.model('User', userSchema);

module.exports = { Room, User };

