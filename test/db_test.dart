import "package:flutter_test/flutter_test.dart";
import 'package:morelia_client_flutter/modules/db.dart';

void main() {
  final db = DatabaseHandler(testing: true);

  group("Test Databasehandler - UserConfig table:", () {
    db.addUser("uuid", "login1", "hashPassword1");
    db.addUser("uuid666", "login2", "hashPassword");
    db.addUser("uuid_3", "login3", "hashPassword");

    test('Add user and get user by UUID', () async {
      var testOne = await db.getUserByUuid("uuid");
      expect(testOne[0].login, "login1");
    });
    test('Update user', () async {
      await db.updateUser("uuid666", "new_login", "hashPassword");
      var testTwo = await db.getUserByUuid("uuid666");
      expect(testTwo[0].login, "new_login");
    });
    test('Get all user', () async {
      var testThree = await db.getAllUser();
      expect(testThree[0].login, "login1");
      expect(testThree[1].login, "new_login");
      expect(testThree[2].login, "login3");
    });
    test('Get user by login', () async {
      var testFour = await db.getUserByLogin("login1");
      expect(testFour[0].uuid, "uuid");
    });
    test('Get user by login and password', () async {
      var testFive =
          await db.getUserByLoginAndPassword("login1", "hashPassword1");
      expect(testFive[0].uuid, "uuid");
    });
  });

  group("Test Databasehandler - Message table:", () {
    // db.addFlow("fuuid_1", ["uuid", "uuid666", "uuid_3"], title: "test");

    db.addMessage("fuuid_1", "uuuid_1", "muuid_1", 1, text: "text_1");
    db.addMessage("fuuid_2", "uuuid_2", "muuid_2", 12, text: "text_2");
    db.addMessage("fuuid_3", "uuuid_3", "muuid_3", 123, text: "text_3");
    db.addMessage("fuuid_4", "uuuid_4", "muuid_4", 1234, text: "text_4");
    db.addMessage("fuuid_5", "uuuid_5", "muuid_5", 12345, text: "text_5");
    db.addMessage("fuuid_6", "uuuid_6", "muuid_6", 123456, text: "text_6");
    db.addMessage("fuuid_7", "uuuid_7", "muuid_7", 1234567, text: "text_7");

    test('Add message and get all message', () async {
      var testOne = await db.getAllMessage();
      expect(testOne[0].time, 1);
    });
    test('Update message and get message by UUID', () async {
      await db.updateMessage("muuid_2", time: 12, text: "new_text");
      var testTwo = await db.getMessageByUuid("muuid_2");
      expect(testTwo[1].text, "new_text");
    });
    test('Get message by Text', () async {
      var testThree = await db.getMessageByText("text_3");
      expect(testThree[3].time, 123);
    });
    test('Get message by exact time', () async {
      var testFour = await db.getMessageByExactTime(1234);
      expect(testFour[0].uuid, "muuid_4");
    });
    test('Get message by less time', () async {
      var testFive = await db.getMessageByLessTime(123456);
      expect(testFive[0].uuid, "muuid_1");
    });
    test('Get message by more time', () async {
      var testSix = await db.getMessageByMoreTime(12345);
      expect(testSix[0].uuid, "muuid_6");
    });
    test('Get message by more time and flow', () async {
      var testSix = await db.getMessageByMoreTimeAndFlow(123456, "fuuid_1");
      expect(testSix[0].uuid, "Get_message_by_more_time");
    });
  }, skip: "Pass");
}
