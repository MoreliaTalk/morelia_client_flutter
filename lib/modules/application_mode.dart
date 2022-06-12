import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morelia_client_flutter/modules/database/db.dart';
import 'package:morelia_client_flutter/modules/database/models.dart';

enum TypeApplicationMode { mobile, desktop }

TypeApplicationMode get realPlatformMode {
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

final applicationMode = Provider<TypeApplicationMode>((ref) {
  var modeInDb = ref.watch(DatabaseHandler().appModeState);
  if (modeInDb == null) {
    return realPlatformMode;
  } else {
    return modeInDb;
  }
});
