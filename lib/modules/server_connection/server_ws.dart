import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'api.dart' as api;
import 'package:web_socket_channel/web_socket_channel.dart';

class ServerConnection {
  final String _url;
  late WebSocketChannel _channel;

  ServerConnection(this._url);

  void connect() {
    _channel = WebSocketChannel.connect(Uri.parse(_url));
  }

  void disconnect() {
    _channel.sink.close(1000);
  }

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
      {required String login,
      required String password,
      String? username,
      String? email}) async {
    var newRequest = api.Validator(type: "register_user");
    newRequest = _addProtocolVersionToRequest(newRequest);

    newRequest.data = api.Data();
    newRequest.data?.user = [];
    newRequest.data?.user?.add(api.User(
      login: login,
      password: password,
      username: username,
      email: email,
    ));
    return await _sendData(newRequest);
  }

  Future<api.Validator> authentication(
      {required String login, required String password}) async {
    var newRequest = api.Validator(type: "authentication");
    newRequest = _addProtocolVersionToRequest(newRequest);

    newRequest.data = api.Data();
    newRequest.data?.user = [];
    newRequest.data?.user?.add(api.User(login: login, password: password));
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
      Uint8List? file_picture,
      Uint8List? file_video,
      Uint8List? file_audio,
      Uint8List? file_document,
      Uint8List? emoji}) async {
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
        client_id: client_id,
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
    newRequest.data?.user?.add(api.User(uuid: user_uuid, auth_id: auth_id));

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
      {required String user_uuid, required String auth_id}) async {
    var newRequest = api.Validator(type: "all_flow");
    newRequest = _addProtocolVersionToRequest(newRequest);

    newRequest.data = api.Data();

    newRequest.data?.user = [];
    newRequest.data?.user?.add(api.User(auth_id: auth_id, uuid: user_uuid));
    return await _sendData(newRequest);
  }

  Future<api.Validator> user_info(
      {required String user_uuid,
      required String auth_id,
      List<String>? users_uuids_for_request}) async {
    var newRequest = api.Validator(type: "user_info");
    newRequest = _addProtocolVersionToRequest(newRequest);

    newRequest.data = api.Data();

    newRequest.data?.user = [];
    newRequest.data?.user?.add(api.User(auth_id: auth_id, uuid: user_uuid));

    if (users_uuids_for_request != null) {
      for (final user in users_uuids_for_request) {
        newRequest.data?.user?.add(api.User(uuid: user));
      }
    }

    return await _sendData(newRequest);
  }

  Future<api.Validator> delete_user(
      {required String uuid,
      required String auth_id,
      required String login,
      required String password}) async {
    var newRequest = api.Validator(type: "delete_user");
    newRequest = _addProtocolVersionToRequest(newRequest);

    newRequest.data = api.Data();

    newRequest.data?.user = [];
    newRequest.data?.user?.add(api.User(
        login: login, password: password, uuid: uuid, auth_id: auth_id));

    return await _sendData(newRequest);
  }

  Future<api.Validator> delete_message(
      {required String user_uuid,
      required String auth_id,
      required String flow_uuid,
      required String message_uuid}) async {
    var newRequest = api.Validator(type: "delete_message");
    newRequest = _addProtocolVersionToRequest(newRequest);

    newRequest.data = api.Data();

    newRequest.data?.user = [];
    newRequest.data?.user?.add(api.User(uuid: user_uuid, auth_id: auth_id));

    newRequest.data?.flow = [];
    newRequest.data?.flow?.add(api.Flow(uuid: flow_uuid));

    newRequest.data?.message = [];
    newRequest.data?.message?.add(api.Message(uuid: message_uuid));

    return await _sendData(newRequest);
  }

  Future<api.Validator> edited_message(
      {required String user_uuid,
      required String auth_id,
      required String message_uuid,
      String? text,
      Uint8List? file_picture,
      Uint8List? file_video,
      Uint8List? file_audio,
      Uint8List? file_document,
      Uint8List? emoji}) async {
    var newRequest = api.Validator(type: "edited_message");
    newRequest = _addProtocolVersionToRequest(newRequest);

    newRequest.data = api.Data();

    newRequest.data?.user = [];
    newRequest.data?.user?.add(api.User(uuid: user_uuid, auth_id: auth_id));

    newRequest.data?.message = [];
    newRequest.data?.message?.add(api.Message(
        uuid: message_uuid,
        text: text,
        file_picture: file_picture,
        file_video: file_video,
        file_audio: file_audio,
        file_document: file_document,
        emoji: emoji));

    return await _sendData(newRequest);
  }

  Future<api.Validator> ping_pong(
      {required String user_uuid, required String auth_id}) async {
    var newRequest = api.Validator(type: "ping_pong");
    newRequest = _addProtocolVersionToRequest(newRequest);

    newRequest.data = api.Data();
    newRequest.data?.user = [];
    newRequest.data?.user?.add(api.User(uuid: user_uuid, auth_id: auth_id));

    return await _sendData(newRequest);
  }
}
