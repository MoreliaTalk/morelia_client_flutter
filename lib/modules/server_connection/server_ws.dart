import 'dart:async';
import 'dart:convert';

import 'package:morelia_client_flutter/modules/server_connection/api.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class ServerWebsockets {
  final String _url;
  late WebSocketChannel _channel;

  ServerWebsockets(this._url);

  Future<Validator> _sendData(Validator data) async {
    Completer<Validator> completer = Completer();
    _channel.stream.listen((response) {
      completer.complete(Validator.fromJson(jsonDecode(response)));
    });
    _channel.sink.add(jsonEncode(data.toJson()));
    return completer.future;
  }

  Validator _addProtocolVersionToRequest(Validator request) {
    if (request.jsonapi == null) {
      request.jsonapi =
          Version(version: protocolVersion, revision: protocolRevision);
      return request;
    } else {
      request.jsonapi?.version = protocolVersion;
      request.jsonapi?.revision = protocolRevision;
      return request;
    }
  }

  Future<Validator> register_user(
      {required String password,
      required String login,
      String? email,
      String? username}) async {
    var newRequest = Validator(type: "register_user");
    newRequest = _addProtocolVersionToRequest(newRequest);

    newRequest.data = Data();
    newRequest.data?.user = [];
    newRequest.data?.user?.add(User(
        password: password, login: login, email: email, username: username));
    return await _sendData(newRequest);
  }

  void connect() {
    _channel = WebSocketChannel.connect(Uri.parse(_url));
  }
}
