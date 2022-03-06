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

  DatabaseHandler(this.database);

  void connect(String database) async {
    final dir = await getApplicationSupportDirectory();
    final isar = await Isar.open(
        schemas: [UserConfigSchema],
        directory: dir.path,
        inspector: true);
  }

  dynamic getName() async {
    final username = await 
  }
}
