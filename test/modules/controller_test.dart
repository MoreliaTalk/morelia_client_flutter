import 'dart:convert';
import 'dart:io';

import "package:flutter_test/flutter_test.dart";
import 'package:morelia_client_flutter/modules/controller.dart';
import 'package:morelia_client_flutter/modules/database/db.dart';
import 'package:morelia_client_flutter/modules/database/db_initialize.dart';
import 'package:morelia_client_flutter/modules/server_connection/api.dart'
    as api;
import 'package:morelia_client_flutter/modules/server_connection/server_ws.dart';

void main() async {
  dbInitialize();
  final database = DatabaseHandler();
  late ServerConnection conn;
  late HttpServer server;
  const uuid = "uuid1";
  const correctLogin = "login1";
  const correctPassword = "password1";
  await database.addUser(uuid, correctLogin, correctPassword);

  group("Test UserHandler class: ", () {
    setUp(() async {
      server = await HttpServer.bind("localhost", 1234);
      conn = ServerConnection("ws://localhost:1234");
    });
    tearDown(() async {
      await server.close(force: true);
    });
    test("logIn function with wrong login and password", () async {
      const wrongLogin = "login2";
      const wrongPassword = "password2";
      final user = UserHandler(database, conn);

      var result = await user.logIn(wrongLogin, wrongPassword);

      expect(result.inDatabase, isFalse);
      expect(result.uuid, null);
      expect(result.detail, "Wrong login or password");
    }, skip: false, tags: "reg_user");

    test("logIn function with correct login and password", () async {
      final user = UserHandler(database, conn);

      var result = await user.logIn(correctLogin, correctPassword);

      expect(result.inDatabase, isTrue);
      expect(result.uuid, "uuid1");
      expect(result.detail, "LogIn completed");
    }, skip: false, tags: "reg_user");

    test("checkUser function", () async {
      final user = UserHandler(database, conn);

      var result = await user.checkUser(correctLogin, correctPassword);

      expect(result.inDatabase, true);
      expect(result.uuid, uuid);
    }, skip: false, tags: "reg_user");

    // TODO: переделать код, чтобы сервер выдавал response.
    test("registerUser function", () async {
      final user = UserHandler(database, conn);
      const newUser = "newUser";
      const newPassword = "newPassword";
      dynamic result;

      server.listen((request) {
        WebSocketTransformer.upgrade(request).then((webSocket) {
          api.Validator response;
          response = api.Validator(type: "error");

          webSocket.listen((event) {
            var request = jsonDecode(event);
            print("REQUEST=${request["type"]}");
            var response = api.Validator(type: request["type"]);
            response.jsonapi = api.Version(
                version: api.protocolVersion, revision: api.protocolRevision);
            response.data = api.Data();
            response.data?.user = [];
            response.data?.user
                ?.add(api.User(password: "newPassword", login: "newLogin"));
          }, cancelOnError: true);

          result = response.toJson();
          webSocket.add(result);
          print("RESULT=$result");
        });
      });

      result = await user.registerUser(newUser, newPassword, username: "TEST");

      expect(result["status"], isTrue);
      expect(result["detail"], "User registered complete");
    }, skip: true, tags: "reg_user");
    dbClean();
  });
}
