import 'dart:convert';
import 'dart:io';

import "package:flutter_test/flutter_test.dart";
import 'package:isar/isar.dart';
import 'package:morelia_client_flutter/modules/database/db.dart';
import 'package:path/path.dart' as path;

void main() async {
  late DatabaseHandler db;
  setUp(() async {
    final file = File(
        path.join(Directory.current.path, ".dart_tool", "package_config.json"));
    for (var i in jsonDecode(await file.readAsString())["packages"]) {
      if (i["name"] == "isar_flutter_libs") {
        Isar.initializeLibraries(libraries: {
          IsarAbi.linuxX64: path.join(
              (i["rootUri"] as String).substring(7), "linux", "libisar.so"),
          IsarAbi.linuxArm64: path.join(
              (i["rootUri"] as String).substring(7), "linux", "libisar.so"),
          IsarAbi.macosArm64: path.join(
              (i["rootUri"] as String).substring(7), "macos", "libisar.dylib"),
          IsarAbi.macosX64: path.join(
              (i["rootUri"] as String).substring(7), "macos", "libisar.dylib"),
          IsarAbi.windowsX64: path.join(
              (i["rootUri"] as String).substring(7), "windows", "libisar.ddl")
        });
      }
    }

    db = DatabaseHandler();
    db.connect();
  });

  tearDown(() async {
    db.dbConnect.close(deleteFromDisk: true);
  });

  group("Test DatabaseHandler - UserConfig table:", () {
    test('Add user and get user by UUID', () async {
      await db.addUser("uuid", "login", "hashPassword");
      var result = await db.getUserByUuid("uuid");
      expect(result?.login, "login");
    });

    test('Update user', () async {
      await db.addUser("uuid", "login", "hashPassword");

      await db.updateUser("uuid", "new_login", "hashPassword");
      var result = await db.getUserByUuid("uuid");

      expect(result?.login, "new_login");
    });

    test('Get all user', () async {
      await db.addUser("uuid", "login", "hashPassword");
      await db.addUser("uuid1", "login1", "hashPassword");
      await db.addUser("uuid2", "login2", "hashPassword");

      var result = await db.getAllUser();
      expect(result[0]?.login, "login");
      expect(result[1]?.login, "login1");
      expect(result[2]?.login, "login2");
    });

    test('Get user by login', () async {
      await db.addUser("uuid", "login", "hashPassword");

      var result = await db.getUserByLogin("login");
      expect(result[0]?.uuid, "uuid");
    });

    test('Get user by login and password', () async {
      await db.addUser("uuid", "login", "hashPassword");

      var result = await db.getUserByLoginAndPassword("login", "hashPassword");
      expect(result[0]?.uuid, "uuid");
    });
  });

  group("Test DatabaseHandler - Message table:", () {
    setUp(() async {
      await db.addUser("user_uuid", "login", "hashPassword");
      await db.addFlow("flow_uuid", "user_uuid", ["user_uuid"],
          title: "FlowTest", timeCreated: 987);
      await db.addMessage("flow_uuid", "user_uuid", "message_uuid", 123,
          text: "text");
    });

    test('Add message and get all message', () async {
      final result = await db.getAllMessages();
      expect(result[0]?.uuid, "message_uuid");
      expect(result[0]?.time, 123);
    });

    test('Update message and get message by UUID', () async {
      await db.updateMessage("message_uuid", time: 1234, text: "new_text");
      var result = await db.getMessagesByUuid("message_uuid");
      expect(result?.text, "new_text");
    });

    test('Get message by Text', () async {
      var result = await db.getMessagesByText("text");
      expect(result[0]?.time, 123);
    });

    test('Get message by exact time', () async {
      var result = await db.getMessagesByExactTime(123);
      expect(result[0]?.uuid, "message_uuid");
    });

    test('Get message by less time', () async {
      var result = await db.getMessagesByLessTime(124);
      expect(result[0]?.uuid, "message_uuid");
    });
    test('Get message by more time', () async {
      var result = await db.getMessagesByMoreTime(122);
      expect(result[0]?.uuid, "message_uuid");
    });

    test('Get message by more time and flow', () async {
      var result = await db.getMessagesByMoreTimeAndFlow(122, "flow_uuid");
      expect(result[0]?.uuid, "message_uuid");
    });

    test('Get message by less time and flow', () async {
      var result = await db.getMessagesByLessTimeAndFlow(124, "flow_uuid");
      expect(result[0]?.uuid, "message_uuid");
    });

    test('Get message by exact time and flow', () async {
      var result = await db.getMessagesByExactTimeAndFlow(123, "flow_uuid");
      expect(result[0]?.uuid, "message_uuid");
    });
  });

  group("Test DatabaseHandler - Flow table:", () {
    test("Add flow and get all flow", () async {
      await db.addUser("user_uuid", "login", "hashPassword");
      await db.addFlow("flow_uuid", "user_uuid", ["user_uuid"],
          title: "FlowTest", timeCreated: 123456);
      await db.addFlow("flow_uuid2", "user_uuid", ["user_uuid"],
          title: "FlowTest2", timeCreated: 123456);

      var result = await db.getAllFlow();
      expect(result[0]?.uuid, "flow_uuid");
      expect(result[1]?.uuid, "flow_uuid2");
    });

    test("Get flow by UUID", () async {
      await db.addUser("user_uuid", "login", "hashPassword");
      await db.addFlow("flow_uuid", "user_uuid", ["user_uuid"],
          title: "FlowTest", timeCreated: 123456);

      var result = await db.getFlowByUuid("flow_uuid");
      expect(result?.title, "FlowTest");
    });

    test("Get flow by Title", () async {
      await db.addUser("user_uuid", "login", "hashPassword");
      await db.addFlow("flow_uuid", "user_uuid", ["user_uuid"],
          title: "FlowTest", timeCreated: 123456);

      var result = await db.getFlowByTitle("FlowTest");
      expect(result[0]?.uuid, "flow_uuid");
    });

    test("Get flow by More Time", () async {
      await db.addUser("user_uuid", "login", "hashPassword");
      await db.addFlow("flow_uuid", "user_uuid", ["user_uuid"],
          title: "FlowTest", timeCreated: 123456);

      var result = await db.getFlowByMoreTime(123455);
      expect(result[0]?.title, "FlowTest");
    });

    test("Get flow by Less Time", () async {
      await db.addUser("user_uuid", "login", "hashPassword");
      await db.addFlow("flow_uuid", "user_uuid", ["user_uuid"],
          title: "FlowTest", timeCreated: 123456);

      var result = await db.getFlowByLessTime(123457);
      expect(result[0]?.title, "FlowTest");
    });

    test("Get flow by Exact Time", () async {
      await db.addUser("user_uuid", "login", "hashPassword");
      await db.addFlow("flow_uuid", "user_uuid", ["user_uuid"],
          title: "FlowTest", timeCreated: 123456);

      var result = await db.getFlowByExactTime(123456);
      expect(result[0]?.title, "FlowTest");
    });

    test("Update flow", () async {
      await db.addUser("user_uuid", "login", "hashPassword");
      await db.addFlow("flow_uuid", "user_uuid", ["user_uuid"],
          title: "FlowTest", timeCreated: 123456);

      await db.updateFlow("flow_uuid", title: "newTitle");
      var result = await db.getFlowByUuid("flow_uuid");
      expect(result?.title, "newTitle");
    });
  });
}
