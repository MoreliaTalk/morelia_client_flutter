import "package:flutter_test/flutter_test.dart";
import "package:morelia_client_flutter/modules/hash.dart";

void main() {
  group("Test Hash module: ", () {
    test("hashPassword function", () async {
      const testPassword = "test_password";
      var hash = await hashPassword(testPassword);
      var hash2 = await hashPassword(testPassword);
      expect(hash["hashPassword"], isNot(hash2["hashPassword"]));
      expect(hash["hashPassword"], isA<String>());
      expect(hash["salt"], isA<String>());
      expect(hash["salt"]?.length, 16);
      expect(hash["key"], isA<String>());
      expect(hash["key"]?.length, 8);
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
