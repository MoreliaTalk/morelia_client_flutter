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

import './models.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
//import 'dart:async';

class DatabaseHandler {
  late String database;
  late Isar userConfigConnect;
  late Isar flowConnect;
  late Isar messageConnect;
  late Isar adminConnect;
  late dynamic dir;

  DatabaseHandler(String databaseName) {
    database = databaseName;
  }

  void connect(String database) async {
    dir = await getApplicationSupportDirectory();
    userConfigConnect = await Isar.open(
        schemas: [UserConfigSchema],
        directory: dir.path,
        inspector: true);
    flowConnect = await Isar.open(
        schemas: [FlowSchema],
        directory: dir.path,
        inspector: true);
    messageConnect = await Isar.open(
        schemas: [MessageSchema],
        directory: dir.path,
        inspector: true);
    adminConnect = await Isar.open(
        schemas: [AdminSchema],
        directory: dir.path,
        inspector: true);
  }
  void write(int id, String uuid, String login, String hashPassword,
      {String? username, bool isBot = false, String? authId, int? tokenTTL, String? email, String? avatar, String? bio, String? salt, String? key}) async {
    final dbWrite = await userConfigConnect.userConfigs.put(null);
  }
  
  dynamic read(int id) async {
    final post = await userConfigConnect.userConfigs.get(id);
    return post;
  }
}