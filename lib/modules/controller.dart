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
import 'package:morelia_client_flutter/modules/database/models.dart';
import 'package:morelia_client_flutter/modules/hash.dart';
import 'package:morelia_client_flutter/modules/server_connection/api.dart';
import 'package:morelia_client_flutter/modules/server_connection/server_ws.dart';

/// Object contains information about user response.
class UserHandlerResponse {
  bool inDatabase;
  String? uuid;
  String? detail;

  UserHandlerResponse({this.inDatabase = false, this.uuid, this.detail});
}

/// Register or login user.
///
/// [checkUser] returned object contains status and uuid.
/// [logIn] returned object with status, uuid and detail.
/// [registerUser] returned object with status, uuid and detail.
class UserHandler {
  // Connected to Isar database
  late DatabaseHandler database;

  late ServerConnection connection;

  UserHandler(this.database, this.connection);

  /// Returned object with status and uuid.
  ///
  /// If user contains in local database, [checkUser] response [UserHandlerResponse]
  /// with ```status=true``` and ```user``` contains UUID.
  /// If user not available in local database, ```status=false```,
  /// rest fields is null.
  Future<UserHandlerResponse> checkUser(String login, String password) async {
    final UserConfig? _checkUser =
        await database.getUserByLoginAndPassword(login, password);
    if (_checkUser != null) {
      return UserHandlerResponse(inDatabase: true, uuid: _checkUser.uuid);
    } else {
      return UserHandlerResponse();
    }
  }

  /// Checks user with [login] and [password].
  /// If user already contains id database switch isAuth to true
  /// and return [UserHandlerResponse].
  Future<UserHandlerResponse> logIn(String login, String password) async {
    final user = await checkUser(login, password);

    if (user.inDatabase == true) {
      // if user contains database, isAuth change to true (default isAuth is false).
      await database.updateUser(user.uuid!, login, password, isAuth: true);
      user.detail = "LogIn completed";
    } else {
      user.detail = "Wrong login or password";
    }
    return user;
  }

  /// Registration new user.
  /// Check user in local database with [login], [password], added new user,
  /// if not contains in local database. [username] is optional.
  /// Return [UserHandlerResponse].
  Future<UserHandlerResponse> registerUser(String login, String password,
      {String? username}) async {
    final Validator response;

    // Connect to the server
    connection.connect();

    final user = await checkUser(login, password);

    final _password = await hashPassword(password);

    if (user.inDatabase == false) {
      try {
        response = await connection.register_user(
            login: login, password: password, username: username);
      } on Exception catch (e) {
        // send shutting down code
        connection.disconnect(code: 1001);
        throw "Server not response, with error=$e";
      }
      // send normal closure code
      connection.disconnect(code: 1000);
      await database.addUser(
          response.data!.user![0].uuid!, login, _password.hash,
          isBot: false,
          isAuth: true,
          authId: response.data!.user![0].auth_id,
          tokenTTL: response.data!.user![0].token_ttl,
          salt: _password.salt,
          key: _password.key);
      user.inDatabase = true;
      user.detail = "User registered complete";
    } else {
      user.detail =
          "Wrong login or password, maybe this user already registered";
    }
    return user;
  }
}
