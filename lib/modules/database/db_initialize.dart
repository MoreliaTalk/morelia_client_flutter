// Copyright (c) 2022 - present Stepan Skriabin.
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

import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

/// Initialize Isar libraries, only for testing
String? dbInitialize() {
  final dartToolDir = path.join(Directory.current.path, 'test/fixtures');
  const String libWin = 'isar_windows_x64.dll';
  const String libMac = 'libisar_macos_x64.dylib';
  const String libLinux = 'libisar_linux_x64.so';
  const String libAndroid = 'libisar_android_arm64.so';

  try {
    Isar.initializeLibraries(libraries: {
      'windows': path.join(dartToolDir, libWin),
      'macos': path.join(dartToolDir, libMac),
      'linux': path.join(dartToolDir, libLinux),
      'android': path.join(dartToolDir, libAndroid)
    });
    return 'initialize completed';
  } catch (e) {
    throw 'libisar* auxiliary libraries are not in "test/fixtures" directory, $e';
  }
}

/// Delete tested database files
Future<String> dbClean() async {
  final isarFolder = await getApplicationSupportDirectory();
  final allDir = Directory(isarFolder.path);
  await for (final FileSystemEntity f in allDir.list()) {
    if (f is Directory && f.path.contains('isar')) {
      f.delete(recursive: true);
      return "Delete Isar database completed.";
    }
  }
  return "Isar database not find in $allDir";
}
