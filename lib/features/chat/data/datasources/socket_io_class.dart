import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketAPI {
  static final SocketAPI _instance = SocketAPI._internal();

  SocketAPI._internal();

  factory SocketAPI() {
    return _instance;
  }
  io.Socket? _socket;
  void connect() {
    _socket = io.io(
        "http://localhost:3000",
        io.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());

    if (!_socket!.connected) {
      _socket!.connect();
      _socket!.onConnect((data) => print(data));
      _socket!.onConnectError((data) => print(data));
      _socket!.onError((data) => print(data));
    }
  }

  void event(String event, dynamic data) {
    _socket!.emit(event, data);
  }

  void on(String event, fun) {
    _socket!.on(event, fun);
  }
}
