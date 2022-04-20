import 'dart:io';

import "package:flutter_test/flutter_test.dart";
import 'package:morelia_client_flutter/modules/controller.dart';
import 'package:morelia_client_flutter/modules/database/db.dart';
import 'package:morelia_client_flutter/modules/database/db_initialize.dart';
import 'package:morelia_client_flutter/modules/server_connection/server_ws.dart';

void main() {
  dbInitialize();

  late DatabaseHandler? db;
  late ServerConnection? conn;
  late HttpServer server;

  setUp(() async {
    const uuid = "uuid1";
    const login = "login1";
    const password = "password1";

    db = DatabaseHandler();
    server = await HttpServer.bind("localhost", 0);
    conn = ServerConnection("ws://localhost:" + server.port.toString());

    await db!.addUser(uuid, login, password);
  });
  group("Test UserHandler class: ", () {
    test("logIn function with wrong login and password", () async {
      const wrongLogin = "login2";
      const wrongPassword = "password2";
      final user = UserHandler(db!, conn!);

      var result = await user.logIn(wrongLogin, wrongPassword);

      expect(result["status"], isFalse);
      expect(result["uuid"], null);
      expect(result["detail"], "Wrong login or password");
    }, skip: true, tags: "reg_user");

    test("logIn function with correct login and password", () async {
      const correctLogin = "login1";
      const correctPassword = "password1";
      final user = UserHandler(db!, conn!);

      var result = await user.logIn(correctLogin, correctPassword);

      expect(result["status"], isTrue);
      expect(result["uuid"], "uuid1");
      expect(result["detail"], "LogIn completed");
    }, skip: true, tags: "reg_user");

    test("registerUser function", () async {}, skip: true, tags: "reg_user");
  });
  tearDown(() async {
    db = null;
    conn = null;
    await server.close(force: true);
  });
}
