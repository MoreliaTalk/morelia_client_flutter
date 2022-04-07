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

import 'package:flutter/material.dart';
import 'package:morelia_client_flutter/modules/database/db.dart';
import 'package:morelia_client_flutter/modules/database/models.dart';
import 'package:morelia_client_flutter/modules/hash.dart';

class UserHandler {
  late DatabaseHandler database;
  late Map<String, dynamic> result = {"status": false, "uuid": null, "detail": null};

  UserHandler(this.database);

  Future<Map<String, dynamic>> _checkUser(String login, String password) async {
    final UserConfig? checkUser = await database.getUserByLoginAndPassword(login, password);
    if (checkUser != null) {
      result['status'] = true;
      result['uuid'] = checkUser.uuid;
      return result;
    } else {
      return result;
    }
  }

  Future<Map<String, dynamic>> logIn(String login, String password) async {
    final Map<String, dynamic> user = await _checkUser(login, password);

    if (user["status"] == true) {
      await database.updateUser(user["uuid"], login, password, isAuth: true);
      result["detail"] = "LogIn completed";
      return result;
    } else {
      result["detail"] = "Wrong login or password";
      return result;
    }
  }

  Future<Map<String, dynamic>> registerUser(String login, String password, {String? username}) async {
    final List<int> codeUuid = [1,2,3];
    final Map<String, dynamic> user = await _checkUser(login, password);
    // Temporary Solution
    final List<int> uuid = await hashBlake2b(codeUuid);

    if (user["status"] == false) {
      await database.addUser(uuid.toString(), login, password);
      result["status"] = true;
      result["detail"] = "User registered complete";
      return result;
    } else {
      result["detail"] = "Wrong login or password, maybe this user already registered";
      return result;
    }
  }
}
