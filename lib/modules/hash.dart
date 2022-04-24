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

/// Object contains hash from password and generated salt and key.
class HashPasswordObject {
  String hash;
  String? salt;
  String? key;

  HashPasswordObject(this.hash, this.salt, this.key);
}

/// Generate hash for password.
///
/// Returns [HashPasswordObject] which contains hash from password salt and key.
///
/// [salt] and [key] optional parameters and can be generated within the function.
Future<HashPasswordObject> hashPassword(String password,
    {String? salt, String? key}) async {
  final algorithm = Blake2b();
  const decoder = Utf8Decoder(allowMalformed: true);
  String input;

  // check if salt or key is null
  // if null, then we generate ascii string
  salt = salt ?? genString(16);
  key = key ?? genString(8);
  input = password + salt + key;

  final hash = await algorithm.hash(input.runes.toList());

  return HashPasswordObject(decoder.convert(hash.bytes), salt, key);
}

/// Generated fixed length string with random ASCII symbol and numbers.
/// [stringLength] length in symbols.
String genString(int stringLength) {
  const _symbols = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz";
  const _numbers = "1234567890";
  const _specSymbols = "!@#%^&*(){}[];:<>,.?`~-+=_";
  const _dictionary = _symbols + _numbers + _specSymbols;
  const maxNumber = _dictionary.length;
  final Random _rnd = Random();

  return String.fromCharCodes(Iterable.generate(stringLength,
      (index) => _dictionary.codeUnitAt(_rnd.nextInt(maxNumber))));
}
