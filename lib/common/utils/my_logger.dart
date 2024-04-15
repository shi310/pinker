import 'dart:developer';

/// 日志格式化
class MyLogger {
  static void w(String text) {
    Future.microtask(
      () => log(
        '=> $text',
        time: DateTime.now(),
      ),
    );
  }
}
