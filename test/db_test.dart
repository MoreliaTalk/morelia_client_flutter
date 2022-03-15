import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:morelia_client_flutter/modules/db.dart';

void main() {
  test('Function test', () async {
    writeUserConfig(uuid: "uuid", login: "login", hashPassword: "hashPassword");
    var result = await readByUuid("uuid");
    expect(result[1], 1);
  });
  test('Class test', () async {
    var dbOne = DatabaseHandler(testing: true);
    print("1ST run ${dbOne.dbConnect}");
    var dbTwo = DatabaseHandler(testing: true);
    print("2ST run ${dbTwo.dbConnect}");
    writeUserConfig(uuid: "uuid", login: "login", hashPassword: "hashPassword");
    var result = await readByUuid("uuid");
    expect(result[1], 1);
  });
}
