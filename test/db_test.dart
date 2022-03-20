import "package:flutter_test/flutter_test.dart";
import 'package:morelia_client_flutter/modules/db.dart';


void main() {
  final db = DatabaseHandler(testing: true);

  void deleteDb(List<dynamic> listObject) {
    for (var i = 0; i < 100; i++) {
      try {
        print('FIND: ID=${listObject[i].id}, UUID=${listObject[i].uuid}');
        db.deleteIndexInDb(listObject[i].id);
      } catch (e) {
        continue;
      }
    }
  }

  group("Test Databasehandler class:", () {
    test('Add user and get user by UUID', () async {
      await db.addUser("uuid", "login", "hashPassword");
      var result = await db.getUserByUuid("uuid");
      deleteDb(result);
      expect(result[0].login, "login");
    });
    test('Update user', () async {
      await db.addUser("uuid666", "login", "hashPassword");
      await db.updateUser("uuid666", "new_login", "hashPassword");
      var result = await db.getUserByUuid("uuid666");
      deleteDb(result);
      expect(result[0].login, "new_login");
    });
    test('Get all user', () async {
      await db.addUser("Get_all_user1", "login1", "hashPassword");
      await db.addUser("Get_all_user2", "login2", "hashPassword");
      await db.addUser("Get_all_user3", "login3", "hashPassword");
      var result = await db.getAllUser();
      deleteDb(result);
      expect(result[0].login, "login1");
      expect(result[1].login, "login2");
      expect(result[2].login, "login3");
    });
    test('Get user by login', () async {
      await db.addUser("Get_user_by_login", "login_1", "hashPassword");
      var result = await db.getUserByLogin("login_1");
      deleteDb(result);
      expect(result[0].uuid, "Get_user_by_login");
    });
    test('Get user by login and password', () async {
      await db.addUser(
          "Get_user_by_login_and_password", "login_1", "hashPassword_1");
      var result =
          await db.getUserByLoginAndPassword("login_1", "hashPassword_1");
      deleteDb(result);
      expect(result[0].uuid, "Get_user_by_login_and_password");
    });
    test('Add message and get all message', () async {
      await db.addMessage("Add_message", 1, "Add_message_text");
      var result = await db.getAllMessage();
      deleteDb(result);
      expect(result[0].time, 1);
    });
    test('Update message and get message by UUID', () async {
      await db.addMessage("Update_message", 12, "Update_message_text");
      await db.updateMessage("Update_message", 12, "new_text");
      var result = await db.getMessageByUuid("Update_message");
      deleteDb(result);
      expect(result[0].text, "new_text");
    });
    test('Get message by Text', () async {
      await db.addMessage("Get_message_by_Text", 123, "Get_message_text");
      var result = await db.getMessageByText("Get_message_text");
      deleteDb(result);
      expect(result[0].time, 123);
    });
    test('Get message by exact time', () async {
      await db.addMessage("Get_message_by_exact_time", 1234, "exact_time_text");
      var result = await db.getMessageByExactTime(1234);
      deleteDb(result);
      expect(result[0].uuid, "Get_message_by_exact_time");
    });
    test('Get message by less time', () async {
      await db.addMessage("Get_message_by_less_time", 12345, "less_time_text");
      var result = await db.getMessageByLessTime(12345);
      deleteDb(result);
      expect(result[2].uuid, "Get_message_by_less_time");
    });
    // test('Get message by more time', () async {
    //   await db.addMessage("Get_message_by_more_time", 123456, "more_time_text");
    //   var result = await db.getMessageByLessTime(123456);
    //   deleteDb(result);
    //   expect(result[0].uuid, "Get_message_by_more_time");
    // });
  });
}
