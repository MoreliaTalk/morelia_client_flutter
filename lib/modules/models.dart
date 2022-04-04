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

import 'package:isar/isar.dart';

part 'models.g.dart';

@Collection()
class UserConfig {
  @Id()
  int id = Isar.autoIncrement;

  @Index(unique: true)
  late String uuid;

  @Index(type: IndexType.hash)
  late String login;

  @Index(type: IndexType.hash)
  late String? username;

  late String? authId;

  @Index(type: IndexType.hash)
  late String? email;

  @Index(type: IndexType.hash)
  late String? bio;

  late String hashPassword;
  late bool isBot;
  late int? tokenTTL;
  late String? avatar;
  late String? salt;
  late String? key;
  late bool? isAuth;

  final toMessages = IsarLinks<Message>();
  final toFlows = IsarLinks<Flow>();
}

@Collection()
class Flow {
  @Id()
  int id = Isar.autoIncrement;

  @Index(unique: true)
  late String uuid;

  @Index(type: IndexType.hash)
  late String? title;

  @Index(type: IndexType.hash)
  late String? info;

  late String? flowType;
  late int? timeCreated;
  late String? owner;

  final toMessages = IsarLinks<Message>();
  final toUsers = IsarLinks<UserConfig>();
}

@Collection()
class Message {
  @Id()
  int id = Isar.autoIncrement;

  @Index(unique: true)
  late String uuid;

  @Index(type: IndexType.hash)
  late String? text;

  late int? time;
  late String? filePicture;
  late String? fileVideo;
  late String? fileAudio;
  late String? fileDocument;
  late String? emoji;
  late int? editedTime;
  late bool editedStatus;

  @Backlink(to: 'toMessages')
  final toUser = IsarLink<UserConfig>();

  @Backlink(to: 'toMessages')
  final toFlow = IsarLink<Flow>();
}

@Collection()
class ApplicationSetting {
  @Id()
  int id = Isar.autoIncrement;

  late String server;
  late String port;
}