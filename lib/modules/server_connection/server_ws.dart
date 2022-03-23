import 'package:morelia_client_flutter/modules/server_connection/api.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class ServerWebsockets {
  final String _url;
  late WebSocketChannel _channel;

  ServerWebsockets(this._url) {

  }

  void connect() {
    _channel = WebSocketChannel.connect(Uri.parse(_url));
  }
}
