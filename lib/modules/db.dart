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

import 'dart:typed_data';
import 'package:isar/isar.dart';

part 'userconfig.q.dart';

@Collection()
class UserConfig{
  @Id()
  int? uuid;


  late String login;
  late String hashPassword;
  late String username;
  late bool isBot;
  late String authId;
  late int tokenTTL;
  late String email;
  late ByteBuffer avatar;
  late String bio;
  late ByteBuffer salt;
  late ByteBuffer key;
}