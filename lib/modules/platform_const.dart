import 'dart:io';
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

enum TypePlatformDevices { mobile, desktop, notSupported }

TypePlatformDevices _getPlatform() {
  TypePlatformDevices _platform;
  if (!kIsWeb) {
    if (Platform.isIOS || Platform.isAndroid) {
      _platform = TypePlatformDevices.mobile;
    } else if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      _platform = TypePlatformDevices.desktop;
    } else {
      _platform = TypePlatformDevices.notSupported;
    }
  } else {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
        _platform = TypePlatformDevices.mobile;
        break;
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        _platform = TypePlatformDevices.desktop;
        break;
      default:
        _platform = TypePlatformDevices.notSupported;
        break;
    }
  }
  return _platform;
}

TypePlatformDevices get currentPlatform => TypePlatformDevices.mobile;
//TypePlatformDevices get currentPlatform => _getPlatform();
