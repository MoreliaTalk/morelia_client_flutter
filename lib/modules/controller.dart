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

import 'package:morelia_client_flutter/modules/database/db.dart';

class LogInHandler {
  late DatabaseHandler database;
  late String login;
  late String password;

  LogInHandler(this.database, this.login, this.password);

  Future<String> result() async {
    final List db = await database.getUserByLoginAndPassword(login, password);
    if (db.isNotEmpty) {
      await database.updateUser(db[0].uuid, login, password, isAuth: true);
      return "Completed";
    } else {
      await database.updateUser(db[0].uuid, login, password, isAuth: false);
      return "Wrong login or password";
    }
  }
}
