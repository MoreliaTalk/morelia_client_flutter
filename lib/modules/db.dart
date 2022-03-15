// Copyright (c) 2022 - present NekrodNIK, Stepan Skriabin, rus-ai.
// Look at the file AUTHORS.md (located at the root of the project) to get the
// full list.
// This file is part of Morelia Flutter.
// Morelia Flutter is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// Morelia Flutter is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// You should have received a copy of the GNU General Public License
// along with Morelia Flutter. If not, see <https://www.gnu.org/licenses/>.

import 'dart:core';
import 'dart:io';
import './models.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import './platform_const.dart';

// Class
class DataReadError implements Exception {
  final String message;

  const DataReadError([this.message = ""]);

  @override
  String toString() => "DataReadError: $message";
}

class DatabaseHandler {
  late Future<Isar> dbConnect;
  late Future<Directory> dir;
  late String _check;
  static DatabaseHandler _singleConnect = DatabaseHandler.connect('blank');

  DatabaseHandler.connect(this._check) {
    dbConnect = _connect(UserConfigSchema);
  }

  factory DatabaseHandler({bool testing = false}) {
    if (testing == true && currentPlatform == TypePlatformDevices.desktop) {
      final dartToolDir = path.join(Directory.current.path, '.dart_tool');
      try {
        Isar.initializeLibraries(libraries: {
          'windows': path.join(dartToolDir, 'libisar_windows_x64.dll'),
          'macos': path.join(dartToolDir, 'libisar_macos_x64.dylib'),
          'linux': path.join(dartToolDir, 'libisar_linux_x64.so')
        });
      } catch (e) {
        throw 'InitializeLibraries error';
      }
    }
    if (_singleConnect._check == 'blank') {
      _singleConnect = DatabaseHandler.connect('dbConnected');
    } else {
      throw 'Class already created';
    }
    return _singleConnect;
  }

  Future<Isar> _connect(CollectionSchema<UserConfig> schema) async {
    final dir = await getApplicationSupportDirectory();
    return await Isar.open(schemas: [schema], directory: dir.path);
  }

  Future<dynamic>? getAllUser() async {
    Isar conn = await dbConnect;
    return conn.userConfigs.filter();
  }

  Future<dynamic>? getUserByUuid(String uuid) async {
    Isar conn = await dbConnect;
    return conn.userConfigs.filter().uuidEqualTo(uuid).findAll();
  }

  Map<String, dynamic>? getUserByLogin() => null;

  Map<String, dynamic>? getUserByLoginAndPassword() => null;

  Future<void> addUser(String uuid, String login, String hashPassword,
      {String? username,
      bool isBot = false,
      String? authId,
      int? tokenTTL,
      String? email,
      String? avatar,
      String? bio,
      String? salt,
      String? key}) async {
    final conn = await dbConnect;
    final user = UserConfig()
      ..uuid = uuid
      ..login = login
      ..hashPassword = hashPassword
      ..username = username
      ..isBot = isBot
      ..authId = authId
      ..tokenTTL = tokenTTL
      ..email = email
      ..avatar = avatar
      ..bio = bio
      ..salt = salt
      ..key = key;
    await conn.writeTxn((conn) async {
      conn.userConfigs.put(user);
    });
  }

  Future<void> updateUser(String uuid,
      {String? login,
      String? hashPassword,
      String? username,
      bool isBot = false,
      String? authId,
      int? tokenTTL,
      String? email,
      String? avatar,
      String? bio,
      String? salt,
      String? key}) async {
    final conn = await dbConnect;
    final dbQuery = conn.userConfigs.filter().uuidEqualTo(uuid).findFirst();

    if (await dbQuery == null) {
      throw const DataReadError('UUID not found');
    } else {
      final user = UserConfig()
        ..username = username
        ..isBot = isBot
        ..authId = authId
        ..tokenTTL = tokenTTL
        ..email = email
        ..avatar = avatar
        ..bio = bio
        ..salt = salt
        ..key = key;
      await conn.writeTxn((conn) async {
        await conn.userConfigs.put(user);
      });
    }
  }

  Map<String, dynamic>? getAllMessage() => null;

  Map<String, dynamic>? getMessageByUuid() => null;

  Map<String, dynamic>? getMessageByText() => null;

  Map<String, dynamic>? getMessageByExactTime() => null;

  Map<String, dynamic>? getMessageByLessTime() => null;

  Map<String, dynamic>? getMessageByMoreTime() => null;

  Map<String, dynamic>? getMessageByMoreTimeAndFlow() => null;

  Map<String, dynamic>? getMessageByLessTimeAndFlow() => null;

  Map<String, dynamic>? getMessageByExactTimeAndFlow() => null;

  void addMessage() {}

  void updateMessage() {}

  Map<String, dynamic>? getAllFlow() => null;

  Map<String, dynamic>? getFlowByUuid() => null;

  Map<String, dynamic>? getFlowByTitle() => null;

  Map<String, dynamic>? getFlowByMoreTime() => null;

  Map<String, dynamic>? getFlowByLessTime() => null;

  Map<String, dynamic>? getFlowByExactTime() => null;

  void addFlow() {}

  void updateFlow() {}

  Map<String, dynamic>? getTableCount() => null;

  Map<String, dynamic>? getAllAdmin() => null;

  Map<String, dynamic>? getAdminByName() => null;

  void addAdmin() {}

  Map<String, dynamic>? getSettings() => null;

  void addSettings() {}

  void updateSettings() {}
}

// Function
void _initDatabase(bool testing) {
  if (testing == true && currentPlatform == TypePlatformDevices.desktop) {
    final dartToolDir = path.join(Directory.current.path, '.dart_tool');
    try {
      Isar.initializeLibraries(libraries: {
        'windows': path.join(dartToolDir, 'libisar_windows_x64.dll'),
        'macos': path.join(dartToolDir, 'libisar_macos_x64.dylib'),
        'linux': path.join(dartToolDir, 'libisar_linux_x64.so')
      });
    } catch (e) {
      throw 'InitializeLibraries error';
    }
  }
}

void writeUserConfig(
    {required String uuid,
    required String login,
    required String hashPassword,
    String? username,
    bool? isBot,
    String? authId,
    int? tokenTTL,
    String? email,
    String? avatar,
    String? bio,
    String? salt,
    String? key}) async {
  _initDatabase(true);

  var dir = await getApplicationSupportDirectory();

  final dbConnect =
      await Isar.open(schemas: [UserConfigSchema], directory: dir.path);

  final user = UserConfig()
    ..uuid = uuid
    ..login = login
    ..hashPassword = hashPassword;

  await dbConnect.writeTxn((dbConnect) async {
    dbConnect.userConfigs.put(user);
  });
}

Future<List<dynamic>> readByUuid(String uuid) async {
  _initDatabase(true);

  var dir = await getApplicationSupportDirectory();

  final dbConnect =
      await Isar.open(schemas: [UserConfigSchema], directory: dir.path);

  var user = await dbConnect.userConfigs.filter().uuidEqualTo(uuid).findFirst();

  dbConnect.close();

  return [
    user?.id,
    user?.uuid,
    user?.login,
    user?.hashPassword,
    user?.username,
    user?.isBot,
    user?.authId,
    user?.tokenTTL,
    user?.email,
    user?.avatar,
    user?.bio,
    user?.salt,
    user?.key
  ];
}
