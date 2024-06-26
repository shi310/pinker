import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../index.dart';

class ConfigController extends GetxController {
  static ConfigController get to => Get.find();

  // 是否曾经使用过APP，
  bool isUsedApp = SharedService.to.getBool(sharedIsUsedAppKey);

  // 主题模式：系统，亮色，暗色
  // 0:跟随系统
  // 1:暗色模式
  // 2:亮色模式
  int themeMode = SharedService.to.getInt(sharedThemeModeKey);

  // 读取主题设置
  // bool isDarkMode = Get.isPlatformDarkMode;

  // 系统类型
  String platform = '';

  // 手机系统版本
  String osversion = '';

  // APP版本
  String version = '';

  // 机型
  String model = '';

  // 包信息
  PackageInfo packageInfo = PackageInfo(
    appName: '',
    packageName: '',
    version: '',
    buildNumber: '',
  );

  // 语言设置
  final locale = const Locale('en', 'US').obs;

  // 区号列表数据
  // areaCodeList: 区号列表数据
  // areaCode：区号的状态，改变时会对应的改变页面的文字
  // areaShortName：区号的短名称
  final areaCodeList = AreaCodeListModel.fromJson(AreaCodeListModel.child);
  final areaCode = SharedService.to.getString(sharedAreaCodeKey).obs;
  final areaName = SharedService.to.getString(sharedAreaNameKey).obs;
  String areaShortName = 'CN';

  @override
  void onReady() async {
    // 读取设备信息
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (GetPlatform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      platform = 'android';
      osversion = 'Android ${androidInfo.version.sdkInt}';
      model = androidInfo.model;
    } else if (GetPlatform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      platform = 'ios';
      osversion = 'IOS ${iosInfo.systemVersion}';
      model = iosInfo.model;
    }

    // 读取储存的语言设置
    var localeString = SharedService.to.getString(sharedLocalKey);

    // 设置语言，不保存语言信息，因为是读取并设置的
    SharedService.to.getString(sharedLocalKey).isEmpty
        ? await Get.updateLocale(Get.deviceLocale ?? locale.value)
        : await updateLocale(localeString: localeString, isSave: false);

    // 设置主题
    await changeThemeMode(themeMode);

    // 包信息
    packageInfo = await PackageInfo.fromPlatform();

    // 设置安卓状态栏
    await setTransparentStatusBar();

    // 设置竖屏
    await setPreferredOrientations();

    super.onReady();
  }

  /// 更改语言
  Future<void> updateLocale({
    required String localeString,
    required bool isSave,
  }) async {
    switch (localeString) {
      case 'zh_Hans_CN':
        locale.value = const Locale('zh', 'Hans_CN');
        break;
      case 'en_US':
        locale.value = const Locale('en', 'US');
        break;
      case 've_Na':
        locale.value = const Locale('ve', 'NA');
        break;
      default:
        locale.value = MyTranslation.defaultLocale;
        break;
    }

    locale.update((val) {});
    await Get.updateLocale(locale.value);

    if (isSave) {
      SharedService.to.setString(sharedLocalKey, localeString);
    }
  }

  /// - 改变主题
  Future<void> changeThemeMode(int mode) async {
    switch (mode) {
      case 1:
        Get.changeThemeMode(ThemeMode.dark);
        break;
      case 2:
        Get.changeThemeMode(ThemeMode.light);
        break;
      default:
        Get.changeThemeMode(ThemeMode.system);
        break;
    }

    themeMode = mode;
    await SharedService.to.setInt(sharedThemeModeKey, themeMode);
  }

  /// - 将顶部状态栏和底部状态栏设置成透明
  Future<void> setTransparentStatusBar() async {
    // 显示顶部栏(隐藏底部栏，没有这个的话底部状态栏的透明度无法实现)
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    // 状态栏和导航栏的颜色样式
    final style = SystemUiOverlayStyle(
      // 状态栏的背景颜色，这里设为透明
      statusBarColor: Colors.transparent,
      // 导航栏的背景颜色，这里设为透明
      systemNavigationBarColor: Colors.transparent,
      // 导航栏与内容之间的分割线颜色，这里设为透明
      systemNavigationBarDividerColor: Colors.transparent,
      // 导航栏图标的亮度，这里设为亮色
      systemNavigationBarIconBrightness:
          Get.isPlatformDarkMode ? Brightness.dark : Brightness.dark,
      // 状态栏图标的亮度，这里设为亮色
      statusBarIconBrightness:
          Get.isPlatformDarkMode ? Brightness.dark : Brightness.dark,
      // 状态栏的亮度，这里设为暗色
      statusBarBrightness: Theme.of(Get.context!).colorScheme.brightness,
    );

    SystemChrome.setSystemUIOverlayStyle(style);
  }

  /// - 强制竖屏：用到了SystemChrome服务，所以需要初始化
  Future<void> setPreferredOrientations() async {
    // 强制竖屏：用到了SystemChrome服务，所以需要初始化
    // 如：WidgetsFlutterBinding.ensureInitialized();
    var option = [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown];
    await SystemChrome.setPreferredOrientations(option);
  }
}
