import 'dart:io';

bool get isMobileDevice => Platform.isIOS || Platform.isAndroid;
bool get isDesktopDevice =>
    Platform.isMacOS || Platform.isWindows || Platform.isLinux;
