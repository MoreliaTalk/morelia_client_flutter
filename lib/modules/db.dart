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
class DatabaseReadError implements Exception {
  final String message;

  const DatabaseReadError([this.message = ""]);

  @override
  String toString() => "DatabaseReadError: $message";
}

class DatabaseConnectedError implements Exception {
  final String message;

  const DatabaseConnectedError([this.message = ""]);

  @override
  String toString() => "DatabaseConnectedError: $message";
}

class DatabaseHandler {
  late Future<Isar> dbConnect;
  late Future<Directory> dir;
  late String _check;

  static DatabaseHandler _singleConnect = DatabaseHandler.connect('blank');

  DatabaseHandler.connect(this._check) {
    dbConnect = _connect();
  }

  factory DatabaseHandler({bool testing = false}) {
    const String libWin = 'libisar_windows_x64.dll';
    const String libMac = 'libisar_macos_x64.dylib';
    const String libLinux = 'libisar_linux_x64.so';

    if (testing == true && currentPlatform == TypePlatformDevices.desktop) {
      final dartToolDir = path.join(Directory.current.path, '.dart_tool');
      try {
        Isar.initializeLibraries(libraries: {
          'windows': path.join(dartToolDir, libWin),
          'macos': path.join(dartToolDir, libMac),
          'linux': path.join(dartToolDir, libLinux)
        });
      } catch (e) {
        throw 'InitializeLibraries error';
      }
    }
    if (_singleConnect._check == 'blank') {
      _singleConnect = DatabaseHandler.connect('dbConnected');
    } else {
      throw const DatabaseConnectedError('Class already created');
    }
    return _singleConnect;
  }

  Future<Isar> _connect() async {
    final dir = await getApplicationSupportDirectory();
    return await Isar.open(schemas: [
      UserConfigSchema,
      FlowSchema,
      MessageSchema,
      ApplicationSettingSchema
    ], directory: dir.path);
  }

  Future<List<dynamic>> getAllUser() async {
    Isar conn = await dbConnect;
    return conn.userConfigs.where().findAll();
  }

  Future<List<dynamic>> getUserByUuid(String uuid) async {
    Isar conn = await dbConnect;
    return conn.userConfigs.where().uuidEqualTo(uuid).findAll();
  }

  Future<List<dynamic>> getUserByLogin(String login) async {
    final conn = await dbConnect;
    return conn.userConfigs.where().loginEqualTo(login).findAll();
  }

  Future<List<dynamic>> getUserByLoginAndPassword(
      String login, String hashPassword) async {
    final conn = await dbConnect;
    return conn.userConfigs
        .where()
        .loginEqualTo(login)
        .filter()
        .hashPasswordEqualTo(hashPassword)
        .findAll();
  }

  Future<void> addUser(String uuid, String login, String hashPassword,
      [String? username,
      String? authId,
      int? tokenTTL,
      String? email,
      String? avatar,
      String? bio,
      String? salt,
      String? key,
      bool isBot = false]) async {
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

  Future<void> updateUser(String uuid, String login, String hashPassword,
      [String? username,
      bool isBot = false,
      String? authId,
      int? tokenTTL,
      String? email,
      String? avatar,
      String? bio,
      String? salt,
      String? key]) async {
    final conn = await dbConnect;
    final dbQuery = await conn.userConfigs.where().uuidEqualTo(uuid).findAll();

    if (dbQuery[0].id <= 0) {
      throw const DatabaseReadError('UUID not found');
    } else {
      final user = UserConfig()
        ..id = dbQuery[0].id
        ..uuid = dbQuery[0].uuid
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
        await conn.userConfigs.put(user);
      });
    }
  }

  Future<List<dynamic>> getAllMessage() async {
    final conn = await dbConnect;
    return conn.messages.where().findAll();
  }

  Future<List<dynamic>> getMessageByUuid(String uuid) async {
    final conn = await dbConnect;
    return conn.messages.where().uuidEqualTo(uuid).findAll();
  }

  Future<List<dynamic>> getMessageByText(String text) async {
    final conn = await dbConnect;
    return conn.messages.where().filter().textContains(text).findAll();
  }

  Future<List<dynamic>> getMessageByExactTime(int time) async {
    final conn = await dbConnect;
    return conn.messages.filter().timeEqualTo(time).findAll();
  }

  Future<List<dynamic>> getMessageByLessTime(int time) async {
    final conn = await dbConnect;
    return conn.messages.filter().timeLessThan(time).findAll();
  }

  Future<List<dynamic>> getMessageByMoreTime(int time) async {
    final conn = await dbConnect;
    return conn.messages.filter().timeGreaterThan(time).findAll();
  }

  Future<List<dynamic>> getMessageByMoreTimeAndFlow(
      int time, String flowUuid) async {
    final conn = await dbConnect;
    return conn.messages
        .filter()
        .timeGreaterThan(time)
        .and()
        .flow((q) => q.uuidEqualTo(flowUuid))
        .findAll();
  }

  Future<List<dynamic>> getMessageByLessTimeAndFlow(
      int time, String flowUuid) async {
    final conn = await dbConnect;
    return conn.messages
        .filter()
        .timeLessThan(time)
        .and()
        .flow((q) => q.uuidEqualTo(flowUuid))
        .findAll();
  }

  Future<List<dynamic>> getMessageByExactTimeAndFlow(
      int time, String flowUuid) async {
    final conn = await dbConnect;
    return conn.messages
        .filter()
        .timeEqualTo(time)
        .and()
        .flow((q) => q.uuidEqualTo(flowUuid))
        .findAll();
  }

  Future<void> addMessage(String uuid, int time,
      [String? text,
      String? filePicture,
      String? fileVideo,
      String? fileAudio,
      String? fileDocument,
      String? emoji,
      int? editedTime,
      bool editedStatus = false]) async {
    final conn = await dbConnect;
    final message = Message()
      ..uuid = uuid
      ..text = text
      ..time = time
      ..filePicture = filePicture
      ..fileVideo = fileVideo
      ..fileAudio = fileAudio
      ..fileDocument = fileDocument
      ..emoji = emoji
      ..editedTime = editedTime
      ..editedStatus = editedStatus;
    await conn.writeTxn((conn) async {
      conn.messages.put(message);
    });
  }

  Future<void> updateMessage(String uuid,
      [int? time,
      String? text,
      String? filePicture,
      String? fileVideo,
      String? fileAudio,
      String? fileDocument,
      String? emoji,
      int? editedTime,
      bool editedStatus = false]) async {
    final conn = await dbConnect;
    final dbQuery = await conn.messages.where().uuidEqualTo(uuid).findAll();

    if (dbQuery[0].id <= 0) {
      throw const DatabaseReadError("Message UUID not found.");
    } else {
      final message = Message()
        ..id = dbQuery[0].id
        ..uuid = dbQuery[0].uuid
        ..time = time
        ..text = text
        ..filePicture = filePicture
        ..fileVideo = fileVideo
        ..fileAudio = fileAudio
        ..fileDocument = fileDocument
        ..emoji = emoji
        ..editedTime = editedTime
        ..editedStatus = editedStatus;
      await conn.writeTxn((conn) async {
        conn.messages.put(message);
      });
    }
  }

  Future<dynamic>? getAllFlow() async {
    final conn = await dbConnect;
    return conn.flows.where().findAll();
  }

  Future<dynamic>? getFlowByUuid(String uuid) async {
    final conn = await dbConnect;
    return conn.flows.where().uuidEqualTo(uuid).findFirst();
  }

  Future<dynamic>? getFlowByTitle(String title) async {
    final conn = await dbConnect;
    return conn.flows.where().filter().titleContains(title).findAll();
  }

  Future<dynamic>? getFlowByMoreTime(int timeCreated) async {
    final conn = await dbConnect;
    return conn.flows.filter().timeCreatedGreaterThan(timeCreated).findAll();
  }

  Future<dynamic>? getFlowByLessTime(int timeCreated) async {
    final conn = await dbConnect;
    return conn.flows.filter().timeCreatedLessThan(timeCreated).findAll();
  }

  Future<dynamic>? getFlowByExactTime(int timeCreated) async {
    final conn = await dbConnect;
    return conn.flows.filter().timeCreatedEqualTo(timeCreated).findAll();
  }

  void addFlow(String uuid,
      [String? title,
      String? info,
      String? flowType,
      int? timeCreated,
      String? owner]) async {
    final conn = await dbConnect;
    final flow = Flow()
      ..uuid = uuid
      ..title = title
      ..info = info
      ..flowType = flowType!
      ..timeCreated = timeCreated!
      ..owner = owner!;
    await conn.writeTxn((conn) async {
      conn.flows.put(flow);
    });
  }

  void updateFlow(String uuid,
      [String? title,
      String? info,
      String? flowType,
      int? timeCreated,
      String? owner]) async {
    final conn = await dbConnect;
    final dbQuery = conn.flows.where().uuidEqualTo(uuid).findFirst();

    if (await dbQuery == null) {
      throw const DatabaseReadError("Flow UUID not found.");
    } else {
      final flow = Flow()
        ..uuid = uuid
        ..info = info
        ..flowType = flowType!
        ..timeCreated = timeCreated!
        ..owner = owner!;
      await conn.writeTxn((conn) async {
        conn.flows.put(flow);
      });
    }
  }

  Future<dynamic>? getSettings() async {
    final conn = await dbConnect;
    return conn.applicationSettings.where().findAll();
  }

  Future<void> addSettings(String server, String port) async {
    final conn = await dbConnect;
    final setting = ApplicationSetting()
      ..server = server
      ..port = port;
    await conn.writeTxn((conn) async {
      conn.applicationSettings.put(setting);
    });
  }

  Future<void> deleteIndexInDb(int id) async {
    final conn = await dbConnect;
    await conn.writeTxn((conn) async {
      conn.userConfigs.delete(id);
    });
  }

  Future<void> deleteAllIndexInDb(List<int> ids) async {
    final conn = await dbConnect;
    await conn.writeTxn((conn) async {
      conn.userConfigs.deleteAll(ids);
    });
  }
}
