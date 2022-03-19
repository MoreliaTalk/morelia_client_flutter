import "package:flutter_test/flutter_test.dart";
import 'package:morelia_client_flutter/modules/db.dart';
import 'package:faker/faker.dart';

void main() {
  test('Class test', () async {
    var dbOne = DatabaseHandler(testing: true);
    print("1ST run ${dbOne.dbConnect}");
    await dbOne.addUser("uuid12", "login", "hashPassword");
    var result = await dbOne.getAllUser();
    expect(result[0].id, 1);
    await dbOne.deleteDb(result[0].id);
  });
}
