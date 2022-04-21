import 'dart:io';

import "package:flutter_test/flutter_test.dart";
import 'package:morelia_client_flutter/modules/controller.dart';
import 'package:morelia_client_flutter/modules/database/db.dart';
import 'package:morelia_client_flutter/modules/database/db_initialize.dart';
import 'package:morelia_client_flutter/modules/server_connection/server_ws.dart';

void main() async {
  dbInitialize();
  final database = DatabaseHandler();
  late ServerConnection? conn;
  late HttpServer server;
  const uuid = "uuid1";
  const correctLogin = "login1";
  const correctPassword = "password1";
  await database.addUser(uuid, correctLogin, correctPassword);

  group("Test UserHandler class: ", () {
    setUp(() async {
      server = await HttpServer.bind("localhost", 0);
      conn = ServerConnection("ws://localhost:" + server.port.toString());
    });
    tearDown(() async {
      conn = null;
      await server.close(force: true);
    });
    test("logIn function with wrong login and password", () async {
      const wrongLogin = "login2";
      const wrongPassword = "password2";
      final user = UserHandler(database, conn!);

      var result = await user.logIn(wrongLogin, wrongPassword);

      expect(result["status"], isFalse);
      expect(result["uuid"], null);
      expect(result["detail"], "Wrong login or password");
    }, skip: false, tags: "reg_user");

    test("logIn function with correct login and password", () async {
      final user = UserHandler(database, conn!);

      var result = await user.logIn(correctLogin, correctPassword);

      expect(result["status"], isTrue);
      expect(result["uuid"], "uuid1");
      expect(result["detail"], "LogIn completed");
    }, skip: false, tags: "reg_user");

    test("registerUser function", () async {}, skip: true, tags: "reg_user");
    dbClean();
  });
}
