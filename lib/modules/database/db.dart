// Copyright (c) 2022 - present Stepan Skriabin.
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
import 'package:path_provider/path_provider.dart';

import 'models.dart';

/// Occurs during data extraction, for example because there is no table
class DatabaseReadError implements Exception {
  final String message;

  const DatabaseReadError([this.message = ""]);

  @override
  String toString() => "DatabaseReadError: $message";
}

/// Occurs during a failed connection to the database,
/// e.g. due to lack of privileges to read the file
class DatabaseConnectedError implements Exception {
  final String message;

  const DatabaseConnectedError([this.message = ""]);

  @override
  String toString() => "DatabaseConnectedError: $message";
}

enum IsConnect { yes, no }

/// Interaction with the local database.
///
/// Only ONE connection to the database is possible,
/// other connections will be dropped (will cause an [DatabaseConnectedError]).
/// The directory where an instance of the database can be stored is defined
/// using the getApplicationSupportDirectory() method.
class DatabaseHandler {
  late Future<Isar> dbConnect;
  late Future<Directory> dir;
  late IsConnect _check;

  static DatabaseHandler _singleConnect = DatabaseHandler.connect(IsConnect.no);

  DatabaseHandler.connect(this._check) {
    dbConnect = _connect();
  }

  factory DatabaseHandler() {
    if (_singleConnect._check == IsConnect.no) {
      _singleConnect = DatabaseHandler.connect(IsConnect.yes);
    } else {
      throw const DatabaseConnectedError('Class already created');
    }
    return _singleConnect;
  }

  /// Opens a connection to a database located locally.
  Future<Isar> _connect() async {
    final dir = await getApplicationSupportDirectory();
    return await Isar.open(schemas: [
      UserConfigSchema,
      FlowSchema,
      MessageSchema,
      ApplicationSettingSchema
    ], directory: dir.path);
  }

  /// Returns a [Null] or [List] containing [UserConfig] object with users,
  /// sorted by UUID.
  Future<List<UserConfig?>> getAllUser() async {
    final conn = await dbConnect;
    return await conn.userConfigs.where().sortByUuid().findAll();
  }

  /// Returned [UserConfig] object contains user or [Null].
  Future<UserConfig?> getUserByUuid(String uuid) async {
    final conn = await dbConnect;
    return await conn.userConfigs.filter().uuidEqualTo(uuid).findFirst();
  }

  /// Returns a [Null] or [List] containing [UserConfig] object with users,
  /// sorted by login.
  Future<List<UserConfig?>> getUserByLogin(String login) async {
    final conn = await dbConnect;
    return await conn.userConfigs.filter().loginEqualTo(login).findAll();
  }

  /// Returns a [List] containing [UserConfig] object with users, sorted by login
  /// and hash password or [Null].
  Future<UserConfig?> getUserByLoginAndPassword(
      String login, String hashPassword) async {
    final conn = await dbConnect;
    return await conn.userConfigs
        .where()
        .loginEqualTo(login)
        .filter()
        .hashPasswordEqualTo(hashPassword)
        .findFirst();
  }

  /// Adds a user in database without checking if he is in the database.
  /// Returns [Void].
  Future<void> addUser(String uuid, String login, String hashPassword,
      {String? username,
      bool isBot = false,
      bool isAuth = true,
      String? authId,
      int? tokenTTL,
      String? email,
      String? avatar,
      String? bio,
      String? salt,
      String? key}) async {
    final conn = await dbConnect;

    final newUser = UserConfig()
      ..uuid = uuid
      ..login = login
      ..hashPassword = hashPassword
      ..username = username
      ..isBot = isBot
      ..isAuth = isAuth
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

  /// Updates user parameters in database, with a preliminary check for
  /// the existence of the user.
  ///
  /// Check is carried out by the user UUID.
  ///
  /// Returns [Void].
  ///
  /// If there is no user in the database, an error is generated [DatabaseReadError].
  Future<void> updateUser(String uuid, String login, String hashPassword,
      {String? username,
      bool isBot = false,
      bool isAuth = true,
      String? authId,
      int? tokenTTL,
      String? email,
      String? avatar,
      String? bio,
      String? salt,
      String? key}) async {
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
        ..isAuth = isAuth
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

  /// Deletes single user by his [int] ID contains in the database.
  /// Returns [Void].
  Future<void> deleteOneUser(int id) async {
    final conn = await dbConnect;
    await conn.writeTxn((conn) async {
      await conn.userConfigs.delete(id);
    });
  }

  /// Deletes many user by his [List] of [int] ID contains in the database.
  /// Returns [Void].
  Future<void> deleteManyUser(List<int> ids) async {
    final conn = await dbConnect;
    await conn.writeTxn((conn) async {
      await conn.userConfigs.deleteAll(ids);
    });
  }

  /// Returns a [Null] or [List] containing [Message] with message sorted by time.
  Future<List<Message?>> getAllMessage() async {
    final conn = await dbConnect;
    return await conn.messages.where().sortByTime().findAll();
  }

  /// Returns a [Null] or single [Message].
  Future<Message?> getMessageByUuid(String uuid) async {
    final conn = await dbConnect;
    return await conn.messages.filter().uuidEqualTo(uuid).findFirst();
  }

  /// Returns a [Null] or [List] contains [Message] contains searched text,
  /// sorted by time of creation.
  Future<List<Message?>> getMessageByText(String text) async {
    final conn = await dbConnect;
    return await conn.messages
        .where(sort: Sort.asc)
        .filter()
        .textContains(text)
        .sortByTime()
        .findAll();
  }

  /// Returns a [Null] or [List] contains [Message] whose date matches in request.
  Future<List<Message?>> getMessageByExactTime(int time) async {
    final conn = await dbConnect;
    return await conn.messages.filter().timeEqualTo(time).findAll();
  }

  /// Returns a [Null] or [List] contains [Message] whose date is earlier than
  /// in query, sorted by time of creation.
  Future<List<Message?>> getMessageByLessTime(int time) async {
    final conn = await dbConnect;
    return await conn.messages
        .filter()
        .timeLessThan(time)
        .sortByTime()
        .findAll();
  }

  /// Returns a [Null] or [List] contains [Message] whose date is later than
  /// in request, sorted by time of creation.
  Future<List<Message?>> getMessageByMoreTime(int time) async {
    final conn = await dbConnect;
    return await conn.messages
        .filter()
        .timeGreaterThan(time)
        .sortByTime()
        .findAll();
  }

  /// Returns a [Null] or [List] contains [Message] whose date is later than in
  /// request, filtered by Flow UUID, sorted by time of creation.
  Future<List<Message?>> getMessageByMoreTimeAndFlow(
      int time, String flowUuid) async {
    final conn = await dbConnect;
    return await conn.messages
        .where(sort: Sort.asc)
        .filter()
        .timeGreaterThan(time)
        .and()
        .toFlow((q) => q.uuidEqualTo(flowUuid))
        .sortByTime()
        .findAll();
  }

  /// Returns a [Null] or [List] contains [Message] whose date is earlier than in
  /// request, filtered by Flow UUID, sorted by time of creation.
  Future<List<Message?>> getMessageByLessTimeAndFlow(
      int time, String flowUuid) async {
    final conn = await dbConnect;
    return await conn.messages
        .where(sort: Sort.asc)
        .filter()
        .timeLessThan(time)
        .and()
        .toFlow((q) => q.uuidEqualTo(flowUuid))
        .sortByTime()
        .findAll();
  }

  /// Returns a [Null] or [List] contains [Message] whose date is matches in
  /// request, filtered by Flow UUID, sorted by time of creation.
  Future<List<Message?>> getMessageByExactTimeAndFlow(
      int time, String flowUuid) async {
    final conn = await dbConnect;
    return await conn.messages
        .where(sort: Sort.asc)
        .filter()
        .timeEqualTo(time)
        .and()
        .toFlow((q) => q.uuidEqualTo(flowUuid))
        .sortById()
        .findAll();
  }

  /// Adds a message in database without checking if he is in the database.
  /// Returns [Void].
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
    final newMessage = Message()
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
  }

  /// Updates message parameters in database, with a preliminary check for
  /// the existence of the message.
  ///
  /// Check is carried out by the message UUID.
  ///
  /// Returns [Void].
  ///
  /// If there is no message in the database, an error is generated [DatabaseReadError].
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

  /// Deletes single message by his [int] ID contains in the database.
  /// Returns [Void].
  Future<void> deleteOneMessage(int id) async {
    final conn = await dbConnect;
    await conn.writeTxn((conn) async {
      await conn.messages.delete(id);
    });
  }

  /// Deletes many message by his [List] of [int] ID contains in the database.
  /// Returns [Void].
  Future<void> deleteManyMessage(List<int> ids) async {
    final conn = await dbConnect;
    await conn.writeTxn((conn) async {
      await conn.messages.deleteAll(ids);
    });
  }

  /// Returns a [Null] or [List] contains [Flow] sorted by flow UUID.
  Future<List<Flow?>> getAllFlow() async {
    final conn = await dbConnect;
    return await conn.flows.where().sortByUuid().findAll();
  }

  /// Returns a [Null] or single [Flow].
  Future<Flow?> getFlowByUuid(String uuid) async {
    final conn = await dbConnect;
    return await conn.flows.filter().uuidEqualTo(uuid).findFirst();
  }

  /// Returns a [Null] or [List] contains [Flow] by title, sorted by time of
  /// creation.
  Future<List<Flow?>> getFlowByTitle(String title) async {
    final conn = await dbConnect;
    return await conn.flows
        .filter()
        .titleContains(title)
        .sortByTimeCreated()
        .findAll();
  }

  /// Returns a [Null] or [List] contains [Flow] whose date is later than
  /// in request, sorted by time of creation.
  Future<List<Flow?>> getFlowByMoreTime(int timeCreated) async {
    final conn = await dbConnect;
    return await conn.flows
        .filter()
        .timeCreatedGreaterThan(timeCreated)
        .sortByTimeCreated()
        .findAll();
  }

  /// Returns a [Null] or [List] contains [Flow] whose date is earlier than
  /// in query, sorted by time of creation.
  Future<List<Flow?>> getFlowByLessTime(int timeCreated) async {
    final conn = await dbConnect;
    return await conn.flows
        .filter()
        .timeCreatedLessThan(timeCreated)
        .sortByTimeCreated()
        .findAll();
  }

  /// Returns a [Null] or [List] contains [Flow] whose date matches in request,
  /// sorted by flow UUID.
  Future<List<Flow?>> getFlowByExactTime(int timeCreated) async {
    final conn = await dbConnect;
    return await conn.flows
        .filter()
        .timeCreatedEqualTo(timeCreated)
        .sortByUuid()
        .findAll();
  }

  /// Adds a flow in database without checking if he is in the database.
  /// Returns [Void].
  Future<void> addFlow(String uuid, List<String> usersUuid,
      {String? title,
      String? info,
      String? flowType,
      int? timeCreated,
      String? owner}) async {
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
  }

  /// Updates flow parameters in database, with a preliminary check for
  /// the existence of the flow.
  ///
  /// Check is carried out by the flow UUID.
  ///
  /// Returns [Void].
  ///
  /// If there is no flow in the database, an error is generated [DatabaseReadError].
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

  /// Deletes single flow by his [int] ID contains in the database.
  /// Returns [Void].
  Future<void> deleteOneFlow(int id) async {
    final conn = await dbConnect;
    await conn.writeTxn((conn) async {
      await conn.flows.delete(id);
    });
  }

  /// Deletes many flows by his [List] of [int] ID contains in the database.
  /// Returns [Void].
  Future<void> deleteManyFlow(List<int> ids) async {
    final conn = await dbConnect;
    await conn.writeTxn((conn) async {
      await conn.flows.deleteAll(ids);
    });
  }

  /// Returns [Null] or [ApplicationSetting] contains all client settings,
  /// sorted by ascending
  Future<ApplicationSetting?> getSettings() async {
    final conn = await dbConnect;
    return await conn.applicationSettings.where(sort: Sort.asc).findFirst();
  }

  /// Added setting in database.
  /// Returns [Void].
  Future<void> addSettings(String server, String port) async {
    final conn = await dbConnect;
    final newSetting = ApplicationSetting()
      ..server = server
      ..port = port;
    await conn.writeTxn((conn) async {
      await conn.applicationSettings.put(newSetting);
    });
  }

  /// Deletes single application settings by his [int] ID contains in the database.
  /// Returns [Void].
  Future<void> deleteOneApplicationSetting(int id) async {
    final conn = await dbConnect;
    await conn.writeTxn((conn) async {
      await conn.applicationSettings.delete(id);
    });
  }
}
