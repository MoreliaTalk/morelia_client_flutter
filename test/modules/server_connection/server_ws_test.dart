import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'package:flutter_test/flutter_test.dart';
import 'package:morelia_client_flutter/modules/server_connection/server_ws.dart';
import 'package:morelia_client_flutter/modules/server_connection/api.dart'
    as api;

void main() {
  group("Tests ServerConnection class", () {
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

    test("Test get_update", () async {
      final server = await io.HttpServer.bind("localhost", 8444);

      Completer completer = Completer();
      server.transform(io.WebSocketTransformer()).listen((webSocket) {
        webSocket.listen((request) {
          var newRequest = api.Validator(type: "get_update");
          newRequest.jsonapi = api.Version(
              version: api.protocolVersion, revision: api.protocolRevision);

          newRequest.data = api.Data();
          newRequest.data?.time = 123;
          newRequest.data?.user = [];
          newRequest.data?.user
              ?.add(api.User(auth_id: "auth_id", uuid: "user_uuid"));
          assert(request == jsonEncode(newRequest.toJson()));
          completer.complete();
        });
      });

      var connection = ServerConnection("ws://localhost:8444/");
      connection.connect();

      connection.get_update(
          user_uuid: "user_uuid", auth_id: "auth_id", time: 123);
      await completer.future;
    });

    test("Test send_message", () async {
      final server = await io.HttpServer.bind("localhost", 8444);

      Completer completer = Completer();
      server.transform(io.WebSocketTransformer()).listen((webSocket) {
        webSocket.listen((request) {
          var newRequest = api.Validator(type: "send_message");

          newRequest.jsonapi = api.Version(
              version: api.protocolVersion, revision: api.protocolRevision);

          newRequest.data = api.Data();
          newRequest.data?.time = 123;
          newRequest.data?.user = [];
          newRequest.data?.user
              ?.add(api.User(auth_id: "auth_id", uuid: "user_uuid"));
          newRequest.data?.flow = [];
          newRequest.data?.flow?.add(api.Flow(uuid: "flow_uuid"));
          newRequest.data?.message = [];
          newRequest.data?.message
              ?.add(api.Message(text: "text", client_id: 345));

          assert(request == jsonEncode(newRequest.toJson()));
          completer.complete();
        });
      });

      var connection = ServerConnection("ws://localhost:8444/");
      connection.connect();

      connection.send_message(
          user_uuid: "user_uuid",
          auth_id: "auth_id",
          flow_uuid: "flow_uuid",
          time: 123,
          client_id: 345,
          text: "text");
      await completer.future;
    });

    test("Test all_messages", () async {
      final server = await io.HttpServer.bind("localhost", 8444);

      Completer completer = Completer();
      server.transform(io.WebSocketTransformer()).listen((webSocket) {
        webSocket.listen((request) {
          var newRequest = api.Validator(type: "all_messages");
          newRequest.jsonapi = api.Version(
              version: api.protocolVersion, revision: api.protocolRevision);

          newRequest.data = api.Data();
          newRequest.data?.time = 123;

          newRequest.data?.user = [];
          newRequest.data?.user
              ?.add(api.User(uuid: "user_uuid", auth_id: "auth_id"));

          newRequest.data?.flow = [];
          newRequest.data?.flow?.add(api.Flow(uuid: "flow_uuid"));
          assert(request == jsonEncode(newRequest.toJson()));
          completer.complete();
        });
      });

      var connection = ServerConnection("ws://localhost:8444/");
      connection.connect();

      connection.all_messages(
          user_uuid: "user_uuid",
          auth_id: "auth_id",
          flow_uuid: "flow_uuid",
          time: 123);
      await completer.future;
    });

    test("Test add_flow", () async {
      final server = await io.HttpServer.bind("localhost", 8444);

      Completer completer = Completer();
      server.transform(io.WebSocketTransformer()).listen((webSocket) {
        webSocket.listen((request) {
          var newRequest = api.Validator(type: "add_flow");

          newRequest.jsonapi = api.Version(
              version: api.protocolVersion, revision: api.protocolRevision);

          newRequest.data = api.Data();
          newRequest.data?.user = [];
          newRequest.data?.user
              ?.add(api.User(auth_id: "auth_id", uuid: "user_uuid"));
          newRequest.data?.flow = [];
          newRequest.data?.flow?.add(api.Flow(
              type: "chat",
              title: "flow_title",
              info: "flow_info",
              owner: "123",
              users: ["123", "345"]));

          assert(request == jsonEncode(newRequest.toJson()));
          completer.complete();
        });
      });

      var connection = ServerConnection("ws://localhost:8444/");
      connection.connect();

      connection.add_flow(
          user_uuid: "user_uuid",
          auth_id: "auth_id",
          flow_type: "chat",
          flow_owner: "123",
          flow_users: ["123", "345"],
          flow_title: "flow_title",
          flow_info: "flow_info");
      await completer.future;
    });
  });
}

/*
test("Test get_update", () async {
    final server = await io.HttpServer.bind("localhost", 8444);

    Completer completer = Completer();
    server.transform(io.WebSocketTransformer()).listen((webSocket) {
      webSocket.listen((request) {
        assert(request == jsonEncode(newRequest.toJson()));
        completer.complete();
      });
    });

    var connection = ServerConnection("ws://localhost:8444/");
    connection.connect();
    await completer.future;
  });
*/
