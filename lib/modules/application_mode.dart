import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morelia_client_flutter/modules/database/db.dart';
import 'package:morelia_client_flutter/modules/database/models.dart';

enum TypeApplicationMode { mobile, desktop }

get realPlatformMode {
  TypeApplicationMode platform;
  if (!kIsWeb) {
    if (Platform.isIOS || Platform.isAndroid || Platform.isFuchsia) {
      platform = TypeApplicationMode.mobile;
    } else if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      platform = TypeApplicationMode.desktop;
    } else {
      platform = TypeApplicationMode.desktop;
    }
  } else {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        platform = TypeApplicationMode.mobile;
        break;
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        platform = TypeApplicationMode.desktop;
        break;
    }
  }
  return platform;
}

class ApplicationMode extends StateNotifier<TypeApplicationMode> {
  ApplicationMode() : super(realPlatformMode) {
    Future.delayed(Duration.zero, () async {
      _getFromDbAndUpdate();

      var conn = await DatabaseHandler.connect().dbConnect;
      conn.applicationSettings.watchLazy().listen((event) async {
        await _getFromDbAndUpdate();
      });
    });
  }

  _getFromDbAndUpdate() async {
    var db = DatabaseHandler.connect();

    var modeInDb = await db.getApplicationMode();

    if (modeInDb == null) {
      state = realPlatformMode;
    } else {
      state = modeInDb;
    }
  }
}

final applicationMode =
    StateNotifierProvider<ApplicationMode, TypeApplicationMode>(
        (ref) => ApplicationMode());
