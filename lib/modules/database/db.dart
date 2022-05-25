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

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:morelia_client_flutter/modules/application_mode.dart';
import 'package:morelia_client_flutter/modules/theme_manager.dart';
import 'package:path_provider/path_provider.dart';

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

  DatabaseHandler.connect() {
    dbConnect = _connect();
  }

  Future<Isar> _connect() async {
    Directory? dir;

    if (!kIsWeb) {
      dir = await getApplicationSupportDirectory();
    }

    try {
      return await Isar.open(schemas: [
        UserConfigSchema,
        FlowSchema,
        MessageSchema,
        ApplicationSettingSchema
      ], directory: dir?.path);
    } on IsarError {
      return Isar.getInstance()!;
    }
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

  Future<List<Message?>> getAllMessages() async {
    final conn = await dbConnect;
    return await conn.messages.where().sortByTime().findAll();
  }

  Future<Message?> getMessagesByUuid(String uuid) async {
    final conn = await dbConnect;
    return await conn.messages.filter().uuidEqualTo(uuid).findFirst();
  }

  Future<List<Message?>> getMessagesByText(String text) async {
    final conn = await dbConnect;
    return await conn.messages
        .where(sort: Sort.asc)
        .filter()
        .textContains(text)
        .sortByTime()
        .findAll();
  }

  Future<List<Message?>> getMessagesByExactTime(int time) async {
    final conn = await dbConnect;
    return await conn.messages.filter().timeEqualTo(time).findAll();
  }

  Future<List<Message?>> getMessagesByLessTime(int time) async {
    final conn = await dbConnect;
    return await conn.messages
        .filter()
        .timeLessThan(time)
        .sortByTime()
        .findAll();
  }

  Future<List<Message?>> getMessagesByMoreTime(int time) async {
    final conn = await dbConnect;
    return await conn.messages
        .filter()
        .timeGreaterThan(time)
        .sortByTime()
        .findAll();
  }

  Future<List<Message?>> getMessagesByMoreTimeAndFlow(
      int time, String flowUuid) async {
    final conn = await dbConnect;

    return await conn.messages
        .where(sort: Sort.asc)
        .filter()
        .timeGreaterThan(time)
        .messageLinkedFlow((q) => q.uuidEqualTo(flowUuid))
        .sortByTime()
        .findAll();
  }

  Future<List<Message?>> getMessagesByLessTimeAndFlow(
      int time, String flowUuid) async {
    final conn = await dbConnect;
    return await conn.messages
        .where(sort: Sort.asc)
        .filter()
        .timeLessThan(time)
        .messageLinkedFlow((q) => q.uuidEqualTo(flowUuid))
        .sortByTime()
        .findAll();
  }

  Future<List<Message?>> getMessagesByExactTimeAndFlow(
      int time, String flowUuid) async {
    final conn = await dbConnect;

    return await conn.messages
        .where(sort: Sort.asc)
        .filter()
        .timeEqualTo(time)
        .messageLinkedFlow((q) => q.uuidEqualTo(flowUuid))
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
    newMessage.messageLinkedFlow.value = (await getFlowByUuid(flowUuid));
    await conn.writeTxn((conn) async {
      await newMessage.messageLinkedFlow.save();
    });

    await newMessage.messageLinkedUser.load();
    newMessage.messageLinkedUser.value = (await getUserByUuid(userUuid));
    await conn.writeTxn((conn) async {
      await newMessage.messageLinkedUser.save();
    });
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

  Future<void> addFlow(String uuid, String owner, List<String> usersUuid,
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

    for (var userUuid in usersUuid) {
      newFlow.flowLinkedUsers.add((await getUserByUuid(userUuid))!);
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

  Future<ApplicationSetting> _getSettingByKey(String key) async {
    final conn = await dbConnect;
    var dbSetting = await conn.applicationSettings.filter().keyEqualTo(key).findFirst();

    if (dbSetting == null) {
      dbSetting = ApplicationSetting()..key=key;

      await conn.writeTxn((conn) async {
        await conn.applicationSettings.put(dbSetting!);
      });
    }

    return dbSetting;
  }

  Future<T?> matchStringAndEnumNames<T extends Enum>(String str, List<T> enumValues) async {
    for (var val in enumValues) {
      if (val.name == str) {
        return val;
      }
    }

    return null;
  }

  Future<ThemeTypes?> getTheme() async {
    final dbData = await _getSettingByKey("theme");

    if (dbData.value != null) {
    }

    return null;
  }


  Future<TypeApplicationMode?> getApplicationMode() async {
    final dbData = await _getSettingByKey("appMode");

    if (dbData.value != null) {
      return matchStringAndEnumNames(dbData.value!, TypeApplicationMode.values);
    }

    return null;
  }

  Future<void> setApplicationMode(TypeApplicationMode mode) async {
    final conn = await dbConnect;

    var dbData = await _getSettingByKey("appMode")..value = mode.name;

    await conn.writeTxn((conn) async {
      await conn.applicationSettings.put(dbData);
    });
  }
}
