import 'package:get/get.dart';

import '../../views/index.dart';
import '../index.dart';

class MyPages {
  // 未知页面
  static final unknownRoute = GetPage(
    name: MyRoutes.unknownRoute,
    page: () => const UnknownView(),
    binding: UnknownBinding(),
  );

  static final List<GetPage> getPages = [
    // 初始页面
    GetPage(
      name: MyRoutes.index,
      page: () => const IndexView(),
      binding: IndexBinding(),
    ),

    // 欢迎页面
    GetPage(
      name: MyRoutes.welcome,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),

    // 主页面
    GetPage(
      name: MyRoutes.application,
      page: () => const ApplicationView(),
      binding: ApplicationBinding(),
      middlewares: [MiddlewareApplocationView()],
    ),

    // 主页面
    GetPage(
      name: MyRoutes.videoPlay,
      page: () => const VideoPlayerView(),
      binding: VideoPlayerViewBinding(),
    ),
  ];
}