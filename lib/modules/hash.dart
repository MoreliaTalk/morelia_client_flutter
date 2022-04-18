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

import 'dart:convert';
import 'dart:math';

import 'package:cryptography/cryptography.dart';

Future<Map<String, String>> hashPassword(String password) async {
  final algorithm = Blake2b();
  const decoder = Utf8Decoder(allowMalformed: true);
  String input;
  final salt = genString(16);
  final key = genString(8);

  input = password + salt + key;

  final hash = await algorithm.hash(input.runes.toList());
  final Map<String, String> result;

  result = {
    "hashPassword": decoder.convert(hash.bytes),
    "salt": salt,
    "key": key
  };

  return result;
}

String genString(int stringLength) {
  const _dictionary =
      "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890";
  const maxNumber = _dictionary.length;
  Random _rnd = Random();
  var result;

  result = String.fromCharCodes(Iterable.generate(stringLength,
      (index) => _dictionary.codeUnitAt(_rnd.nextInt(maxNumber))));
  return result;
}
