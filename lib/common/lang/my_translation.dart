import 'dart:ui';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

part 'lang_keys.dart';
part "key_en.dart";
part 'key_zh.dart';

class MyTranslation extends Translations {
  static const defaultLocale = Locale('en', 'US');
  static const fallbackLocale = Locale('en', 'US');

  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static const supportedLocales = [
    Locale('zh', 'Hans_CN'), // 中文简体
    Locale('en', 'US'), // 美国英语
  ];

  final _keys = {
    'zh_Hans_CN': zh,
    'en_US': en,
  };
  @override
  Map<String, Map<String, String>> get keys => _keys;
}
