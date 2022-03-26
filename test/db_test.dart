import "package:flutter_test/flutter_test.dart";
import 'package:morelia_client_flutter/modules/db.dart';

void main() {
  final db = DatabaseHandler(testing: true);

  group("Test DatabaseHandler - UserConfig table:", () {
    db.addUser("uuid_1", "login1", "hashPassword1");
    db.addUser("uuid_2", "login2", "hashPassword");
    db.addUser("uuid_3", "login3", "hashPassword");

    test('Add user and get user by UUID', () async {
      var result = await db.getUserByUuid("uuid_1");
      expect(result?.login, "login1");
    });
    test('Update user', () async {
      await db.updateUser("uuid_2", "new_login", "hashPassword");
      var result = await db.getUserByUuid("uuid_2");
      expect(result?.login, "new_login");
    });
    test('Get all user', () async {
      var result = await db.getAllUser();
      expect(result[0]?.login, "login1");
      expect(result[1]?.login, "new_login");
      expect(result[2]?.login, "login3");
    });
    test('Get user by login', () async {
      var result = await db.getUserByLogin("login1");
      expect(result[0]?.uuid, "uuid_1");
    });
    test('Get user by login and password', () async {
      var result =
          await db.getUserByLoginAndPassword("login1", "hashPassword1");
      expect(result[0]?.uuid, "uuid_1");
    });
  });

  group("Test DatabaseHandler - Message table:", () {
    db.addFlow("fuuid_1", ["uuid_1", "uuid_2", "uuid_3"],
        title: "test", timeCreated: 987654321);

    db.addMessage("fuuid_1", "uuuid_1", "muuid_1", 1, text: "text_1");
    db.addMessage("fuuid_2", "uuuid_2", "muuid_2", 12, text: "text_2");
    db.addMessage("fuuid_3", "uuuid_3", "muuid_3", 123, text: "text_3");
    db.addMessage("fuuid_4", "uuuid_4", "muuid_4", 1234, text: "text_4");
    db.addMessage("fuuid_5", "uuuid_5", "muuid_5", 12345, text: "text_5");
    db.addMessage("fuuid_6", "uuuid_6", "muuid_6", 123456, text: "text_6");
    db.addMessage("fuuid_7", "uuuid_7", "muuid_7", 1234567, text: "text_7");

    test('Add message and get all message', () async {
      var result = await db.getAllMessage();
      expect(result[0]?.uuid, "muuid_1");
      expect(result[0]?.time, 1);
    });
    test('Update message and get message by UUID', () async {
      await db.updateMessage("muuid_2", time: 12, text: "new_text");
      var result = await db.getMessageByUuid("muuid_2");
      expect(result?.text, "new_text");
    });
    test('Get message by Text', () async {
      var result = await db.getMessageByText("text_3");
      expect(result[0]?.time, 123);
    });
    test('Get message by exact time', () async {
      var result = await db.getMessageByExactTime(1234);
      expect(result[0]?.uuid, "muuid_4");
    });
    test('Get message by less time', () async {
      var result = await db.getMessageByLessTime(123456);
      expect(result[0]?.uuid, "muuid_1");
    });
    test('Get message by more time', () async {
      var result = await db.getMessageByMoreTime(12345);
      expect(result[0]?.uuid, "muuid_6");
    });
    test('Get message by more time and flow', () async {
      var result = await db.getMessageByMoreTimeAndFlow(123456, "fuuid_7");
      expect(result[0]?.uuid, "muuid_7");
    }, skip: "Not working. Requires IsarLink.");
    test('Get message by less time and flow', () async {
      var result = await db.getMessageByLessTimeAndFlow(123456, "fuuid_1");
      expect(result[0]?.uuid, "muuid_5");
    }, skip: "Not working. Requires IsarLink.");
    test('Get message by exact time and flow', () async {
      var result = await db.getMessageByExactTimeAndFlow(123456, "fuuid_6");
      expect(result[0]?.uuid, "muuid_6");
    }, skip: "Not working. Requires IsarLink.");
  });
  group("Test DatabaseHandler - Flow table:", () {
    db.addFlow("fuuid_2", ["uuid_1", "uuid_2", "uuid_3"],
        title: "test_2", timeCreated: 123456);

    db.addFlow("fuuid_3", ["uuid_1", "uuid_2", "uuid_3"],
        title: "test_3", timeCreated: 12345);

    db.addFlow("fuuid_4", ["uuid_1", "uuid_2", "uuid_3"],
        title: "test_4", timeCreated: 1234);

    test("Add flow and get all flow", () async {
      var result = await db.getAllFlow();
      expect(result[1]?.uuid, "fuuid_2");
    });
    test("Get flow by UUID", () async {
      var result = await db.getFlowByUuid("fuuid_3");
      expect(result?.title, "test_3");
    });
    test("Get flow by Title", () async {
      var result = await db.getFlowByTitle("test_3");
      expect(result[0]?.uuid, "fuuid_3");
    });
    test("Get flow by More Time", () async {
      var result = await db.getFlowByMoreTime(1234);
      expect(result[0]?.title, "test_3");
    });
    test("Get flow by Less Time", () async {
      var result = await db.getFlowByLessTime(123456);
      expect(result[0]?.title, "test_4");
    });
    test("Get flow by Exact Time", () async {
      var result = await db.getFlowByExactTime(1234);
      expect(result[0]?.title, "test_4");
    });
    test("Update flow", () async {
      await db.updateFlow("fuuid_4", title: "new_text");
      var result = await db.getFlowByUuid("fuuid_4");
      expect(result?.title, "new_text");
    });
  });
  group("Test DatabaseHandler - ApplicationSetting table:", () {
    db.addSettings("127.0.0.1", "443");

    test("Add and get settings", () async {
      var result = await db.getSettings();
      expect(result?.server, "127.0.0.1");
    });
  });
}
