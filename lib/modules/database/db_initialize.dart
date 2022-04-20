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
