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

import 'package:isar/isar.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../platform_const.dart';
import 'models.dart';

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

  Future<Isar> _connect() async {
    final dir = await getApplicationSupportDirectory();

    try {
      return await Isar.open(schemas: [
        UserConfigSchema,
        FlowSchema,
        MessageSchema,
        ApplicationSettingSchema
      ], directory: dir.path);
    } on IsarError {
      return Isar.getInstance()!;
    }
}

  factory DatabaseHandler({bool testing = false}) {
    const String libWin = 'libisar_windows_x64.dll';
    const String libMac = 'libisar_macos_x64.dylib';
    const String libLinux = 'libisar_linux_x64.so';

    if (testing == true && currentPlatform == TypePlatformDevices.desktop) {
      final dartToolDir = path.join(Directory.current.path, '.dart_tool');
      try {
        Isar.initializeLibraries(libraries: {
          IsarAbi.windowsX64: path.join(dartToolDir, libWin),
          IsarAbi.macosX64: path.join(dartToolDir, libMac),
          IsarAbi.macosArm64: path.join(dartToolDir, libMac),
          IsarAbi.linuxX64: path.join(dartToolDir, libLinux),
          IsarAbi.linuxArm: path.join(dartToolDir, libLinux),
          IsarAbi.linuxArm64: path.join(dartToolDir, libLinux)
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

  Future<List<UserConfig?>> getAllUser() async {
    final conn = await dbConnect;
    return await conn.userConfigs.where().sortByUuid().findAll();
  }

  Future<UserConfig?> getUserByUuid(String uuid) async {
    final conn = await dbConnect;
    return await conn.userConfigs.filter().uuidEqualTo(uuid).findFirst();
  }

  Future<List<UserConfig?>> getUserByLogin(String login) async {
    final conn = await dbConnect;
    return await conn.userConfigs.filter().loginEqualTo(login).findAll();
  }

  Future<List<UserConfig?>> getUserByLoginAndPassword(
      String login, String hashPassword) async {
    final conn = await dbConnect;
    return await conn.userConfigs
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
    final newUser = UserConfig()
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
      await conn.userConfigs.put(newUser);
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
    final user = await conn.userConfigs.where().uuidEqualTo(uuid).findFirst();

    if (user?.id != null && user?.uuid != null) {
      final updateUser = UserConfig()
        ..id = user!.id
        ..uuid = user.uuid
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
        await conn.userConfigs.put(updateUser);
      });
    } else {
      throw const DatabaseReadError('UUID not found');
    }
  }

  Future<void> deleteOneUser(int id) async {
    final conn = await dbConnect;
    await conn.writeTxn((conn) async {
      await conn.userConfigs.delete(id);
    });
  }

  Future<void> deleteManyUser(List<int> ids) async {
    final conn = await dbConnect;
    await conn.writeTxn((conn) async {
      await conn.userConfigs.deleteAll(ids);
    });
  }

  Future<List<Message?>> getAllMessage() async {
    final conn = await dbConnect;
    return await conn.messages.where().sortByTime().findAll();
  }

  Future<Message?> getMessageByUuid(String uuid) async {
    final conn = await dbConnect;
    return await conn.messages.filter().uuidEqualTo(uuid).findFirst();
  }

  Future<List<Message?>> getMessageByText(String text) async {
    final conn = await dbConnect;
    return await conn.messages
        .where(sort: Sort.asc)
        .filter()
        .textContains(text)
        .sortByTime()
        .findAll();
  }

  Future<List<Message?>> getMessageByExactTime(int time) async {
    final conn = await dbConnect;
    return await conn.messages.filter().timeEqualTo(time).findAll();
  }

  Future<List<Message?>> getMessageByLessTime(int time) async {
    final conn = await dbConnect;
    return await conn.messages
        .filter()
        .timeLessThan(time)
        .sortByTime()
        .findAll();
  }

  Future<List<Message?>> getMessageByMoreTime(int time) async {
    final conn = await dbConnect;
    return await conn.messages
        .filter()
        .timeGreaterThan(time)
        .sortByTime()
        .findAll();
  }

  Future<List<Message?>> getMessageByMoreTimeAndFlow(
      int time, String flowUuid) async {
    final conn = await dbConnect;
    return await conn.messages
        .where(sort: Sort.asc)
        .filter()
        .timeGreaterThan(time)
        .and()
        .messageLinkedFlow((q) => q.uuidEqualTo(flowUuid))
        .sortByTime()
        .findAll();
  }

  Future<List<Message?>> getMessageByLessTimeAndFlow(
      int time, String flowUuid) async {
    final conn = await dbConnect;
    return await conn.messages
        .where(sort: Sort.asc)
        .filter()
        .timeLessThan(time)
        .and()
        .messageLinkedFlow((q) => q.uuidEqualTo(flowUuid))
        .sortByTime()
        .findAll();
  }

  Future<List<Message?>> getMessageByExactTimeAndFlow(
      int time, String flowUuid) async {
    final conn = await dbConnect;
    return await conn.messages
        .where(sort: Sort.asc)
        .filter()
        .timeEqualTo(time)
        .and()
        .messageLinkedFlow((q) => q.uuidEqualTo(flowUuid))
        .sortById()
        .findAll();
  }

  Future<void> addMessage(
      String flowUuid, String userUuid, String messageUuid, int time,
      {String? text,
      String? filePicture,
      String? fileVideo,
      String? fileAudio,
      String? fileDocument,
      String? emoji,
      int? editedTime,
      bool editedStatus = false}) async {
    final conn = await dbConnect;
    Message newMessage = Message()
      ..uuid = messageUuid
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
      await conn.messages.put(newMessage);
    });

    await newMessage.messageLinkedFlow.load();
    newMessage.messageLinkedFlow.value = (await getFlowByUuid(flowUuid))!;
    await conn.writeTxn((conn) async {
      await newMessage.messageLinkedFlow.save();
    });

    await newMessage.messageLinkedUser.load();
    newMessage.messageLinkedUser.value = (await getUserByUuid(userUuid))!;
    await conn.writeTxn((conn) async {
      await newMessage.messageLinkedUser.save();
    });

    newMessage.messageLinkedFlow.load();
  }

  Future<void> updateMessage(String uuid,
      {int? time,
      String? text,
      String? filePicture,
      String? fileVideo,
      String? fileAudio,
      String? fileDocument,
      String? emoji,
      int? editedTime,
      bool editedStatus = false}) async {
    final conn = await dbConnect;
    final message = await conn.messages.where().uuidEqualTo(uuid).findFirst();

    if (message?.id != null && message?.uuid != null) {
      final newMessage = Message()
        ..id = message!.id
        ..uuid = message.uuid
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
        await conn.messages.put(newMessage);
      });
    } else {
      throw const DatabaseReadError("Message UUID not found.");
    }
  }

  Future<void> deleteOneMessage(int id) async {
    final conn = await dbConnect;
    await conn.writeTxn((conn) async {
      await conn.messages.delete(id);
    });
  }

  Future<void> deleteManyMessage(List<int> ids) async {
    final conn = await dbConnect;
    await conn.writeTxn((conn) async {
      await conn.messages.deleteAll(ids);
    });
  }

  Future<List<Flow?>> getAllFlow() async {
    final conn = await dbConnect;
    return await conn.flows.where().sortByTimeCreated().findAll();
  }

  Future<Flow?> getFlowByUuid(String uuid) async {
    final conn = await dbConnect;
    return await conn.flows.filter().uuidEqualTo(uuid).findFirst();
  }

  Future<List<Flow?>> getFlowByTitle(String title) async {
    final conn = await dbConnect;
    return await conn.flows
        .filter()
        .titleContains(title)
        .sortByTimeCreated()
        .findAll();
  }

  Future<List<Flow?>> getFlowByMoreTime(int timeCreated) async {
    final conn = await dbConnect;
    return await conn.flows
        .filter()
        .timeCreatedGreaterThan(timeCreated)
        .sortByTimeCreated()
        .findAll();
  }

  Future<List<Flow?>> getFlowByLessTime(int timeCreated) async {
    final conn = await dbConnect;
    return await conn.flows
        .filter()
        .timeCreatedLessThan(timeCreated)
        .sortByTimeCreated()
        .findAll();
  }

  Future<List<Flow?>> getFlowByExactTime(int timeCreated) async {
    final conn = await dbConnect;
    return await conn.flows
        .filter()
        .timeCreatedEqualTo(timeCreated)
        .sortByUuid()
        .findAll();
  }

  Future<void> addFlow(String uuid, String owner, List<String>? usersUuid,
      {String? title, String? info, String? flowType, int? timeCreated}) async {
    final conn = await dbConnect;
    final newFlow = Flow()
      ..uuid = uuid
      ..title = title
      ..info = info
      ..flowType = flowType
      ..timeCreated = timeCreated
      ..owner = owner;

    await conn.writeTxn((conn) async {
      await conn.flows.put(newFlow);
    });
    await newFlow.flowLinkedUsers.load();

    newFlow.flowLinkedUsers.add((await getUserByUuid(owner))!);

    if (usersUuid != null) {
      for (var userUuid in usersUuid) {
        newFlow.flowLinkedUsers.add((await getUserByUuid(userUuid))!);
      }
    }

    await conn.writeTxn((conn) async {
      await newFlow.flowLinkedUsers.save();
    });
  }

  Future<void> updateFlow(String uuid,
      {String? title,
      String? info,
      String? flowType,
      int? timeCreated,
      String? owner}) async {
    final conn = await dbConnect;
    final flow = await conn.flows.where().uuidEqualTo(uuid).findFirst();

    if (flow?.id != null && flow?.uuid != null) {
      final newFlow = Flow()
        ..id = flow!.id
        ..uuid = flow.uuid
        ..title = title
        ..info = info
        ..flowType = flowType
        ..timeCreated = timeCreated
        ..owner = owner;
      await conn.writeTxn((conn) async {
        await conn.flows.put(newFlow);
      });
    } else {
      throw const DatabaseReadError("Flow UUID not found.");
    }
  }

  Future<void> deleteOneFlow(int id) async {
    final conn = await dbConnect;
    await conn.writeTxn((conn) async {
      await conn.flows.delete(id);
    });
  }

  Future<void> deleteManyFlow(List<int> ids) async {
    final conn = await dbConnect;
    await conn.writeTxn((conn) async {
      await conn.flows.deleteAll(ids);
    });
  }

  Future<ApplicationSetting?> getSettings() async {
    final conn = await dbConnect;
    return await conn.applicationSettings.where(sort: Sort.asc).findFirst();
  }

  Future<void> addSettings(String server, String port) async {
    final conn = await dbConnect;
    final newSetting = ApplicationSetting()
      ..server = server
      ..port = port;
    await conn.writeTxn((conn) async {
      await conn.applicationSettings.put(newSetting);
    });
  }

  Future<void> deleteOneApplicationSetting(int id) async {
    final conn = await dbConnect;
    await conn.writeTxn((conn) async {
      await conn.applicationSettings.delete(id);
    });
  }
}
