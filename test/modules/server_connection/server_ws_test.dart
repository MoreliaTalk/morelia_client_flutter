import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'package:flutter_test/flutter_test.dart';
import 'package:morelia_client_flutter/modules/server_connection/server_ws.dart';
import 'package:morelia_client_flutter/modules/server_connection/api.dart'
    as api;

void main() {
  test("Test connect", () async {
    final server = await io.HttpServer.bind("localhost", 8444);

    Completer completer = Completer();
    server
        .transform(io.WebSocketTransformer())
        .listen((_) => completer.complete());

    var connection = ServerConnection("ws://localhost:8444/");
    connection.connect();

    await completer.future;
  });

  test("Test disconnect", () async {
    final server = await io.HttpServer.bind("localhost", 8444);

    Completer completer = Completer();
    server.transform(io.WebSocketTransformer()).listen((webSocket) {
      webSocket.listen((event) {}, onDone: () => completer.complete());
    });

    var connection = ServerConnection("ws://localhost:8444/");
    connection.connect();
    connection.disconnect();

    await completer.future;
  });

  test("Test register_user", () async {
    final server = await io.HttpServer.bind("localhost", 8444);

    Completer completer = Completer();
    server.transform(io.WebSocketTransformer()).listen((webSocket) {
      webSocket.listen((request) {
        var newRequest = api.Validator(type: "register_user");
        newRequest.jsonapi = api.Version(
            version: api.protocolVersion, revision: api.protocolRevision);
        newRequest.data = api.Data();
        newRequest.data?.user = [];
        newRequest.data?.user
            ?.add(api.User(password: "password", login: "login"));
        assert(request == jsonEncode(newRequest.toJson()));
        completer.complete();
      });
    });
    var connection = ServerConnection("ws://localhost:8444/");
    connection.connect();

    connection.register_user(password: "password", login: "login");
    await completer.future;
  });

  test("Test authentication", () async {
    final server = await io.HttpServer.bind("localhost", 8444);

    Completer completer = Completer();
    server.transform(io.WebSocketTransformer()).listen((webSocket) {
      webSocket.listen((request) {
        var newRequest = api.Validator(type: "authentication");
        newRequest.jsonapi = api.Version(
            version: api.protocolVersion, revision: api.protocolRevision);

        newRequest.data = api.Data();
        newRequest.data?.user = [];
        newRequest.data?.user
            ?.add(api.User(login: "login", password: "password"));

        assert(request == jsonEncode(newRequest.toJson()));
        completer.complete();
      });
    });

    var connection = ServerConnection("ws://localhost:8444/");
    connection.connect();

    connection.authentication(login: "login", password: "password");
    await completer.future;
  });


}
