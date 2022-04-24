import "package:flutter_test/flutter_test.dart";
import "package:morelia_client_flutter/modules/hash.dart";

void main() {
  group("Test Hash module: ", () {
    test("hashPassword function", () async {
      const testPassword = "test_password";
      var password = await hashPassword(testPassword);
      var password2 = await hashPassword(testPassword);
      expect(password.hash, isNot(password2.hash));
      expect(password.hash, isA<String>());
      expect(password.salt, isA<String>());
      expect(password.salt?.length, 16);
      expect(password.key, isA<String>());
      expect(password.key?.length, 8);
    }, skip: false, tags: "functions");
    test("genString function", () {
      var testGen = genString(0);
      expect(testGen.length, 0);
      expect(genString(32).length, 32);
      expect(genString(1000).length, 1000);
      expect(testGen, isA<String>());
      expect(testGen, "");
    }, skip: false, tags: "functions");
  });
}
