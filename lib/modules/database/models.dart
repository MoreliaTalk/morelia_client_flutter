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
import 'package:morelia_client_flutter/modules/application_mode.dart';

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
  String? username;

  String? authId;

  @Index(type: IndexType.hash)
  String? email;

  @Index(type: IndexType.hash)
  String? bio;

  late String hashPassword;
  late bool isBot;
  int? tokenTTL;
  String? avatar;
  String? salt;
  String? key;

  @Backlink(to: 'messageLinkedUser')
  final userLinkedMessages = IsarLinks<Message>();

  @Backlink(to: 'flowLinkedUsers')
  final userLinkedFlows = IsarLinks<Flow>();
}

@Collection()
class Flow {
  @Id()
  int id = Isar.autoIncrement;

  @Index(unique: true)
  late String uuid;

  @Index(type: IndexType.hash)
  String? title;

  @Index(type: IndexType.hash)
  String? info;

  String? flowType;
  int? timeCreated;
  String? owner;

  @Backlink(to: 'messageLinkedFlow')
  final flowLinkedMessages = IsarLinks<Message>();

  final flowLinkedUsers = IsarLinks<UserConfig>();
}

@Collection()
class Message {
  @Id()
  int id = Isar.autoIncrement;

  @Index(unique: true)
  late String uuid;

  @Index(type: IndexType.hash)
  String? text;

  int? time;
  String? filePicture;
  String? fileVideo;
  String? fileAudio;
  String? fileDocument;
  String? emoji;
  int? editedTime;
  late bool editedStatus;

  final messageLinkedUser = IsarLink<UserConfig>();
  final messageLinkedFlow = IsarLink<Flow>();
}

@Collection()
class ApplicationSetting {
  @Id()
  int id = Isar.autoIncrement;

  @Index(unique: true)
  late String key;
  String? value;
}
