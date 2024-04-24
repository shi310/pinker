import 'package:get/get.dart';
import 'package:pinker/views/games/index.dart';

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
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    // 视频播放页面
    GetPage(
      name: MyRoutes.videoPlay,
      page: () => const VideoPlayerView(),
      binding: VideoPlayerViewBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    // 搜索页面
    GetPage(
      name: MyRoutes.search,
      page: () => const SearchViewView(),
      binding: SearchViewBinding(),
    ),

    // 俄罗斯方块
    GetPage(
      name: MyRoutes.tetris,
      page: () => const GameTertisView(),
      binding: GameTertisBinding(),
    ),
  ];
}
