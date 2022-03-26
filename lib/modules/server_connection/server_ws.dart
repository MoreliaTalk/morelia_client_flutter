import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'api.dart' as api;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class ServerWebsockets {
  final String _url;
  late WebSocketChannel _channel;

  ServerWebsockets(this._url);

  Future<api.Validator> _sendData(api.Validator data) async {
    Completer<api.Validator> completer = Completer();
    _channel.stream.listen((response) {
      completer.complete(api.Validator.fromJson(jsonDecode(response)));
    });
    _channel.sink.add(jsonEncode(data.toJson()));
    return completer.future;
  }

  api.Validator _addProtocolVersionToRequest(api.Validator request) {
    if (request.jsonapi == null) {
      request.jsonapi = api.Version(
          version: api.protocolVersion, revision: api.protocolRevision);
      return request;
    } else {
      request.jsonapi?.version = api.protocolVersion;
      request.jsonapi?.revision = api.protocolRevision;
      return request;
    }
  }

  Future<api.Validator> register_user(
      {required String password,
      required String login,
      String? email,
      String? username}) async {
    var newRequest = api.Validator(type: "register_user");
    newRequest = _addProtocolVersionToRequest(newRequest);

    newRequest.data = api.Data();
    newRequest.data?.user = [];
    newRequest.data?.user?.add(api.User(
        password: password, login: login, email: email, username: username));
    return await _sendData(newRequest);
  }

  Future<api.Validator> authentication(
      {required String password, required String login}) async {
    var newRequest = api.Validator(type: "authentication");
    newRequest = _addProtocolVersionToRequest(newRequest);

    newRequest.data = api.Data();
    newRequest.data?.user = [];
    newRequest.data?.user?.add(api.User(password: password, login: login));
    return await _sendData(newRequest);
  }

  Future<api.Validator> get_update(
      {required String user_uuid,
      required String auth_id,
      required int time}) async {
    var newRequest = api.Validator(type: "get_update");
    newRequest = _addProtocolVersionToRequest(newRequest);

    newRequest.data = api.Data();
    newRequest.data?.time = time;
    newRequest.data?.user = [];
    newRequest.data?.user?.add(api.User(auth_id: auth_id, uuid: user_uuid));
    return await _sendData(newRequest);
  }

  Future<api.Validator> send_message(
      {required String user_uuid,
      required String auth_id,
      required String flow_uuid,
      required int time,
      required int client_id,
      required String text,
      required Uint8List file_picture,
      required Uint8List file_video,
      required Uint8List file_audio,
      required Uint8List file_document,
      required Uint8List emoji}) async {
    var newRequest = api.Validator(type: "send_message");
    newRequest = _addProtocolVersionToRequest(newRequest);

    newRequest.data = api.Data();
    newRequest.data?.time = time;

    newRequest.data?.user = [];
    newRequest.data?.user?.add(api.User(auth_id: auth_id, uuid: user_uuid));

    newRequest.data?.flow = [];
    newRequest.data?.flow?.add(api.Flow(uuid: flow_uuid));
    newRequest.data?.message = [];
    newRequest.data?.message?.add(api.Message(
        text: text,
        file_picture: file_picture,
        file_video: file_video,
        file_audio: file_audio,
        file_document: file_document,
        emoji: emoji));

    return await _sendData(newRequest);
  }

  Future<api.Validator> all_messages(
      {required String user_uuid,
      required String auth_id,
      required String flow_uuid,
      required int time}) async {
    var newRequest = api.Validator(type: "all_messages");
    newRequest = _addProtocolVersionToRequest(newRequest);

    newRequest.data = api.Data();
    newRequest.data?.time = time;

    newRequest.data?.user = [];
    newRequest.data?.user?.add(api.User(auth_id: auth_id, uuid: user_uuid));

    newRequest.data?.flow = [];
    newRequest.data?.flow?.add(api.Flow(uuid: flow_uuid));
    return await _sendData(newRequest);
  }

  Future<api.Validator> add_flow(
      {required String user_uuid,
      required String auth_id,
      required String flow_type,
      required String flow_owner,
      required List<String> flow_users,
      String? flow_title,
      String? flow_info}) async {
    var newRequest = api.Validator(type: "add_flow");
    newRequest = _addProtocolVersionToRequest(newRequest);

    newRequest.data = api.Data();

    newRequest.data?.user = [];
    newRequest.data?.user?.add(api.User(auth_id: auth_id, uuid: user_uuid));

    newRequest.data?.flow = [];
    newRequest.data?.flow?.add(api.Flow(
        type: flow_type,
        title: flow_title,
        info: flow_info,
        owner: flow_owner,
        users: flow_users));
    return await _sendData(newRequest);
  }

  Future<api.Validator> all_flow(
      {required String user_uuid,
        required String auth_id}) async {
    var newRequest = api.Validator(type: "all_flow");
    newRequest = _addProtocolVersionToRequest(newRequest);

    newRequest.data = api.Data();

    newRequest.data?.user = [];
    newRequest.data?.user?.add(api.User(auth_id: auth_id, uuid: user_uuid));
    return await _sendData(newRequest);
  }

  void connect() {
    _channel = WebSocketChannel.connect(Uri.parse(_url));
  }
}
