import 'package:flutter/foundation.dart';

class AppLogger {
  static void log(String message, {String? tag}) {
    if (kDebugMode) {
      print('🔍 ${tag ?? 'APP'}: $message');
    }
  }
}