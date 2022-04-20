// import 'dart:io';

import "package:flutter_test/flutter_test.dart";
import 'package:morelia_client_flutter/modules/database/db.dart';
import 'package:morelia_client_flutter/modules/database/db_initialize.dart';

void main() {
  group("Test database initializer: ", () {
    test("run dbInitialize function", () {
      expect(dbInitialize(), "initialize completed");
    }, skip: false, tags: "functions");
  });
  group("Test database clean function: ", () {
    setUp(() {
      dbInitialize();
    });
    test("run dbClean", () async {
      var testDb = DatabaseHandler();

      var testCleanDb = await dbClean();
      expect(testCleanDb, "Delete Isar database completed.");
    }, skip: false, tags: "functions");
    test("run dbClean without database files", () async {
      String testCleanDb;

      try {
        var testDb = DatabaseHandler();
      } on DatabaseConnectedError {
        testCleanDb = await dbClean();
      }

      testCleanDb = await dbClean();
      expect(testCleanDb, contains("Isar database not find in"));
    }, skip: false, tags: "functions");
  });
}
