import 'dart:io';

import "package:flutter_test/flutter_test.dart";
import 'package:isar/isar.dart';
import 'package:morelia_client_flutter/modules/controller.dart';
import 'package:morelia_client_flutter/modules/database/db.dart';
import 'package:morelia_client_flutter/modules/server_connection/server_ws.dart';
import 'package:path/path.dart' as path;

void main() {
  final dartToolDir = path.join(Directory.current.path, 'test/fixtures');
  const String libWin = 'isar_windows_x64.dll';
  const String libMac = 'libisar_macos_x64.dylib';
  const String libLinux = 'libisar_linux_x64.so';
  const String libAndroid = 'libisar_android_arm64.so';

  try {
    Isar.initializeLibraries(libraries: {
      'windows': path.join(dartToolDir, libWin),
      'macos': path.join(dartToolDir, libMac),
      'linux': path.join(dartToolDir, libLinux),
      'android': path.join(dartToolDir, libAndroid)
    });
  } catch (e) {
    throw 'libisar* auxiliary libraries are not in "test/fixtures" directory.';
  }
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
    }, skip: false, tags: "reg_user");

    test("logIn function with correct login and password", () async {
      const correctLogin = "login1";
      const correctPassword = "password1";
      final user = UserHandler(db!, conn!);

      var result = await user.logIn(correctLogin, correctPassword);

      expect(result["status"], isTrue);
      expect(result["uuid"], "uuid1");
      expect(result["detail"], "LogIn completed");
    }, skip: false, tags: "reg_user");

    test("registerUser function", () async {}, skip: false, tags: "reg_user");
  });
  tearDown(() async {
    db = null;
    conn = null;
    await server.close(force: true);
  });
}
