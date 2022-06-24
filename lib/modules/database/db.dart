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
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

T? matchStringAndEnumNames<T extends Enum>(String str, List<T> enumValues) {
  for (var val in enumValues) {
    if (val.name == str) {
      return val;
    }
  }

  return null;
}

class DatabaseHandler {
  late Isar dbConnect;
  static DatabaseHandler? __instance;

  DatabaseHandler.__newInstance();

  factory DatabaseHandler() {
    __instance ??= DatabaseHandler.__newInstance();
    return __instance!;
  }

  Future<void> connect() async {
    Directory? dir;

    if (!kIsWeb) {
      dir = await getApplicationSupportDirectory();
    }

    try {
      dbConnect = await Isar.open(schemas: [
        UserConfigSchema,
        FlowSchema,
        MessageSchema,
        ApplicationSettingSchema
      ], directory: dir?.path);
    } on IsarError catch (er) {
      if (er.message == 'Instance has already been opened.') {
        throw const DatabaseConnectedError("DB connection is exist");
      } else {
        rethrow;
      }
    }
  }

  Future<List<UserConfig?>> getAllUser() async {
    return await dbConnect.userConfigs.where().sortByUuid().findAll();
  }

  Future<UserConfig?> getUserByUuid(String uuid) async {
    return await dbConnect.userConfigs.filter().uuidEqualTo(uuid).findFirst();
  }

  Future<List<UserConfig?>> getUserByLogin(String login) async {
    return await dbConnect.userConfigs.filter().loginEqualTo(login).findAll();
  }

  Future<List<UserConfig?>> getUserByLoginAndPassword(
      String login, String hashPassword) async {
    return await dbConnect.userConfigs
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
    await dbConnect.writeTxn((conn) async {
      await dbConnect.userConfigs.put(newUser);
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
    final user =
        await dbConnect.userConfigs.where().uuidEqualTo(uuid).findFirst();

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
      await dbConnect.writeTxn((conn) async {
        await dbConnect.userConfigs.put(updateUser);
      });
    } else {
      throw const DatabaseReadError('UUID not found');
    }
  }

  Future<void> deleteOneUser(int id) async {
    await dbConnect.writeTxn((conn) async {
      await dbConnect.userConfigs.delete(id);
    });
  }

  Future<void> deleteManyUser(List<int> ids) async {
    await dbConnect.writeTxn((conn) async {
      await dbConnect.userConfigs.deleteAll(ids);
    });
  }

  Future<List<Message?>> getAllMessages() async {
    return await dbConnect.messages.where().sortByTime().findAll();
  }

  Future<Message?> getMessagesByUuid(String uuid) async {
    return await dbConnect.messages.filter().uuidEqualTo(uuid).findFirst();
  }

  Future<List<Message?>> getMessagesByText(String text) async {
    return await dbConnect.messages
        .where(sort: Sort.asc)
        .filter()
        .textContains(text)
        .sortByTime()
        .findAll();
  }

  Future<List<Message?>> getMessagesByExactTime(int time) async {
    return await dbConnect.messages.filter().timeEqualTo(time).findAll();
  }

  Future<List<Message?>> getMessagesByLessTime(int time) async {
    return await dbConnect.messages
        .filter()
        .timeLessThan(time)
        .sortByTime()
        .findAll();
  }

  Future<List<Message?>> getMessagesByMoreTime(int time) async {
    return await dbConnect.messages
        .filter()
        .timeGreaterThan(time)
        .sortByTime()
        .findAll();
  }

  Future<List<Message?>> getMessagesByMoreTimeAndFlow(
      int time, String flowUuid) async {
    return await dbConnect.messages
        .where(sort: Sort.asc)
        .filter()
        .timeGreaterThan(time)
        .messageLinkedFlow((q) => q.uuidEqualTo(flowUuid))
        .sortByTime()
        .findAll();
  }

  Future<List<Message?>> getMessagesByLessTimeAndFlow(
      int time, String flowUuid) async {
    return await dbConnect.messages
        .where(sort: Sort.asc)
        .filter()
        .timeLessThan(time)
        .messageLinkedFlow((q) => q.uuidEqualTo(flowUuid))
        .sortByTime()
        .findAll();
  }

  Future<List<Message?>> getMessagesByExactTimeAndFlow(
      int time, String flowUuid) async {
    return await dbConnect.messages
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

    await dbConnect.writeTxn((conn) async {
      await dbConnect.messages.put(newMessage);
    });

    await newMessage.messageLinkedFlow.load();
    newMessage.messageLinkedFlow.value = (await getFlowByUuid(flowUuid));
    await dbConnect.writeTxn((conn) async {
      await newMessage.messageLinkedFlow.save();
    });

    await newMessage.messageLinkedUser.load();
    newMessage.messageLinkedUser.value = (await getUserByUuid(userUuid));
    await dbConnect.writeTxn((conn) async {
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
    final message =
        await dbConnect.messages.where().uuidEqualTo(uuid).findFirst();

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
      await dbConnect.writeTxn((conn) async {
        await dbConnect.messages.put(newMessage);
      });
    } else {
      throw const DatabaseReadError("Message UUID not found.");
    }
  }

  Future<void> deleteOneMessage(int id) async {
    await dbConnect.writeTxn((conn) async {
      await dbConnect.messages.delete(id);
    });
  }

  Future<void> deleteManyMessage(List<int> ids) async {
    await dbConnect.writeTxn((conn) async {
      await dbConnect.messages.deleteAll(ids);
    });
  }

  Future<List<Flow?>> getAllFlow() async {
    return await dbConnect.flows.where().sortByTimeCreated().findAll();
  }

  Future<Flow?> getFlowByUuid(String uuid) async {
    return await dbConnect.flows.filter().uuidEqualTo(uuid).findFirst();
  }

  Future<List<Flow?>> getFlowByTitle(String title) async {
    return await dbConnect.flows
        .filter()
        .titleContains(title)
        .sortByTimeCreated()
        .findAll();
  }

  Future<List<Flow?>> getFlowByMoreTime(int timeCreated) async {
    return await dbConnect.flows
        .filter()
        .timeCreatedGreaterThan(timeCreated)
        .sortByTimeCreated()
        .findAll();
  }

  Future<List<Flow?>> getFlowByLessTime(int timeCreated) async {
    return await dbConnect.flows
        .filter()
        .timeCreatedLessThan(timeCreated)
        .sortByTimeCreated()
        .findAll();
  }

  Future<List<Flow?>> getFlowByExactTime(int timeCreated) async {
    return await dbConnect.flows
        .filter()
        .timeCreatedEqualTo(timeCreated)
        .sortByUuid()
        .findAll();
  }

  Future<void> addFlow(String uuid, String owner, List<String> usersUuid,
      {String? title, String? info, String? flowType, int? timeCreated}) async {
    final newFlow = Flow()
      ..uuid = uuid
      ..title = title
      ..info = info
      ..flowType = flowType
      ..timeCreated = timeCreated
      ..owner = owner;

    await dbConnect.writeTxn((conn) async {
      await dbConnect.flows.put(newFlow);
    });
    await newFlow.flowLinkedUsers.load();

    for (var userUuid in usersUuid) {
      newFlow.flowLinkedUsers.add((await getUserByUuid(userUuid))!);
    }

    await dbConnect.writeTxn((conn) async {
      await newFlow.flowLinkedUsers.save();
    });
  }

  Future<void> updateFlow(String uuid,
      {String? title,
      String? info,
      String? flowType,
      int? timeCreated,
      String? owner}) async {
    final flow = await dbConnect.flows.where().uuidEqualTo(uuid).findFirst();

    if (flow?.id != null && flow?.uuid != null) {
      final newFlow = Flow()
        ..id = flow!.id
        ..uuid = flow.uuid
        ..title = title
        ..info = info
        ..flowType = flowType
        ..timeCreated = timeCreated
        ..owner = owner;
      await dbConnect.writeTxn((conn) async {
        await dbConnect.flows.put(newFlow);
      });
    } else {
      throw const DatabaseReadError("Flow UUID not found.");
    }
  }

  Future<void> deleteOneFlow(int id) async {
    await dbConnect.writeTxn((conn) async {
      await dbConnect.flows.delete(id);
    });
  }

  Future<void> deleteManyFlow(List<int> ids) async {
    await dbConnect.writeTxn((conn) async {
      await dbConnect.flows.deleteAll(ids);
    });
  }

  Future<ApplicationSetting> _getSettingByKey(String key) async {
    var dbSetting = await dbConnect.applicationSettings
        .filter()
        .keyEqualTo(key)
        .findFirst();

    if (dbSetting == null) {
      dbSetting = ApplicationSetting()..key = key;

      await dbConnect.writeTxn((conn) async {
        await dbConnect.applicationSettings.put(dbSetting!);
      });
    }

    return dbSetting;
  }

  final themeState = StateNotifierProvider<_DbThemeState, ThemeTypes>(
      (ref) => _DbThemeState());

  Future<void> setTheme(ThemeTypes mode) async {
    var dbData = await _getSettingByKey("Theme")
      ..value = mode.name;

    await dbConnect.writeTxn((conn) async {
      await dbConnect.applicationSettings.put(dbData);
    });
  }

  final appModeState =
      StateNotifierProvider<_DbAppModeState, TypeApplicationMode?>(
          (ref) => _DbAppModeState());

  Future<void> setApplicationMode(TypeApplicationMode mode) async {
    var dbData = await _getSettingByKey("appMode")
      ..value = mode.name;

    await dbConnect.writeTxn((conn) async {
      await dbConnect.applicationSettings.put(dbData);
    });
  }

  Future<void> resetApplicationMode() async {
    var dbData = await _getSettingByKey("appMode")
      ..value = null;

    await dbConnect.writeTxn((conn) async {
      await dbConnect.applicationSettings.put(dbData);
    });
  }
}

class _DbAppModeState extends StateNotifier<TypeApplicationMode?> {
  _DbAppModeState() : super(null) {
    var db = DatabaseHandler();

    db.dbConnect.applicationSettings
        .filter()
        .keyEqualTo("appMode")
        .watch(initialReturn: true)
        .listen((event) async {
      if (event.isNotEmpty) {
        var dbData = event.first;

        if (dbData.value != null) {
          state =
              matchStringAndEnumNames(
                  dbData.value!, TypeApplicationMode.values);
        }
      }
    });
  }
}

class _DbThemeState extends StateNotifier<ThemeTypes> {
  _DbThemeState() : super(ThemeTypes.defaultDark) {
    var db = DatabaseHandler();

    db.dbConnect.applicationSettings
        .filter()
        .keyEqualTo("Theme")
        .watch(initialReturn: true)
        .listen((event) async {
      if (event.isNotEmpty) {
        var dbData = event.first;
        if (dbData.value != null) {
          state = matchStringAndEnumNames(dbData.value!, ThemeTypes.values)!;
          return;
        } else {
          DatabaseHandler().setTheme(ThemeTypes.defaultDark);
        }
      }
    });
  }
}
