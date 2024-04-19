import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

import '../../common/index.dart';
import 'index.dart';

class VideoPlayerView extends GetView<VideoPlayerViewController> {
  const VideoPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    // 状态控制器
    final state = controller.state;

    // 资源的信息
    final resourceData = state.resourceData;

    // 资源列表
    final resourceList = state.resourceList;

    // AppBar: 标题是动态的
    final appBar = AppBar(
      // surfaceTintColor: Colors.transparent,
      centerTitle: true,
      leading: MyButton(
        onTap: () => Get.back(),
        child: MyAssets(
          name: 'back',
          tyle: AssetsTyle.svg,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      title: Obx(() => Text(resourceData.value.name)),
    );

    // 播放器的容器
    final videBox = Container(
      width: Get.width,
      height: Get.width * 720 / 1280,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: MyColors.black,
      ),
      clipBehavior: Clip.hardEdge,
      child: Obx(
        () => MyVideoPlayer(
          videoUrl: state.videoUrl,
          imageUrl: state.imagetUrl,
        ),
      ),
    );

    Widget buildContentBox() {
      final value = resourceData.value;

      // 下方开始是影片的信息部分
      // 影片的标题，采用24dp的大小
      final title = Text(
        resourceData.value.name,
        style: Theme.of(context).textTheme.headlineSmall,
      );

      // 收藏部分组件：喜欢构建
      Widget likeBuilder(bool _) => _
          ? const MyAssets(name: 'like_press', tyle: AssetsTyle.svg)
          : const MyAssets(name: 'like', tyle: AssetsTyle.svg);

      // 收藏控件组件：内容组件
      Widget countBuilder(int? count, bool isLiked, String text) {
        return Text(
          controller.isFavorites ? '已收藏' : '收藏',
        );
      }

      // 收藏控件
      final favorites = LikeButton(
        onTap: controller.onFavorites,
        size: 20,
        isLiked: controller.isFavorites,
        likeCountPadding: const EdgeInsets.only(left: 8),
        likeCount: 0,
        likeBuilder: likeBuilder,
        mainAxisAlignment: MainAxisAlignment.start,
        countBuilder: countBuilder,
        likeCountAnimationType: LikeCountAnimationType.part,
      );

      // 第一部分：影片的标题和收藏按钮
      final titleBox = Row(children: [title, const Spacer(), favorites]);

      // 影片的年份 ｜ 地区 ｜ 子类型
      final yearChildren = [
        if (value.score != null) '★ ${value.score!}',
        if (value.score != null) ' | ',
        if (value.year != null) value.year,
        if (value.year != null) ' | ',
        if (value.country != null) value.country,
        if (value.country != null) ' | ',
        if (value.mediaType != null) value.mediaType,
        if (value.mediaType != null) ' | ',
        if (value.ranking != null) '排名: ${value.ranking!}'
      ];

      // 年份那一排文字转成字符串
      final yearChildrenString = MyCharacter.getListToString(yearChildren);

      // 这是播放地址的标题
      final playUrlsTitle = MyTabBar(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        tabs: resourceData.value.playUrls.map((e) => e.title).toList(),
        onTap: controller.onTabBar,
      );

      // 这里是 listView 的构建方法
      // 不同分组的按钮点击同一个位置，都是不同处理
      Widget listViewBuild(int buttonIndex) {
        return Obx(() {
          // 颜色定义

          // 集数的点击事件，更换播放链接
          void onTap() async {
            state.chooise = [state.pageIndex, buttonIndex];

            state.videoUrl =
                resourceData.value.playUrls[state.pageIndex].urls[buttonIndex];
          }

          // 是否被选中
          final isChooise = state.pageIndex == state.chooise[0] &&
              buttonIndex == state.chooise[1];

          // 播放按钮的文件间距
          final buttonChild = Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              '${buttonIndex + 1}',
              style: Theme.of(context).myTextStyleLight,
            ),
          );

          // 播放按钮
          return MyButton(
            height: 32,
            color: isChooise
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
            onTap: isChooise ? null : onTap,
            child: buttonChild,
          );
        });
      }

      // 页面 pageView 的构建方法
      // 选用构建方式是因为需要index判断
      Widget pageViewBuild(BuildContext context, int pageIndex) {
        return Obx(() => ListView.separated(
              itemBuilder: (context, index) => listViewBuild(index),
              itemCount: resourceData.value.playUrls[pageIndex].urls.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              scrollDirection: Axis.horizontal,
            ));
      }

      // 下方是播放地址的组件
      // 播放地址可能不是一个，所以播放地址用的是滑动组件
      // 播放地址这里是动态的，所以需要obx包裹
      final partsBox = SizedBox(
        height: 32,
        child: PageView.builder(
          itemBuilder: pageViewBuild,
          itemCount: resourceData.value.playUrls.length,
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
        ),
      );

      // 影片介绍部分的综合组成
      // 标题 和 收藏
      // 影片介绍
      // 播放地址
      final contentBoxChildren = [
        // 第一部分：影片的标题和收藏按钮
        titleBox,

        // 间距
        const SizedBox(height: 8),

        // 年份信息，包含评分，年份等信息
        if (yearChildren.isNotEmpty)
          Text(
            yearChildrenString,
            style: Theme.of(context).textTheme.labelSmall,
          ),

        // 影片的演员表
        if (resourceData.value.actors != null)
          Text(
            '演员: ${resourceData.value.actors!}',
            style: Theme.of(context).textTheme.labelSmall,
          ),

        // 影片的导演
        if (resourceData.value.director != null)
          Text(
            '导演: ${resourceData.value.director!}',
            style: Theme.of(context).textTheme.labelSmall,
          ),

        // 影片的详细介绍，只展示三行
        if (resourceData.value.introduce != null)
          Text(
            '剧情: ${resourceData.value.introduce!}',
            maxLines: 3,
            style: Theme.of(context).textTheme.labelSmall,
          ),

        // 间距
        const SizedBox(height: 8),

        // 播放地址的标题，可能会被用来区分语言
        playUrlsTitle,

        // 间距
        const SizedBox(height: 16),

        // 播放地址
        partsBox,
      ];

      // 影片介绍部分：竖版排列
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: contentBoxChildren,
      );
    }

    // 给影片介绍的内容增加边距
    final contentBox = Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Obx(buildContentBox),
    );

    // 猜你喜欢部分：这部分也是动态的
    // 分成没有内容或者有内容两种情况
    final guessBox = Obx(() {
      // 有内容
      final data = MyMediaBox(
        mediaDataList: resourceList.value.list,
        title: resourceList.value.list.isEmpty ? null : '猜你喜欢',
        onTap: controller.guessPlay,
      );

      // 如果在加载中，或者是重新加载中，就显示加载的样式
      // 如果拿到了数据，就展示数据
      return !state.isRetry && resourceList.value.list.isEmpty
          ? MyMediaBox.loading()
          : data;
    });

    // 页面组成：不包含播放器的部分
    final content = SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(children: [
        contentBox,
        guessBox,
        const SafeArea(top: false, child: SizedBox()),
      ]),
    );

    // 页面组成
    final body = Column(children: [
      // const SizedBox(height: 10),
      videBox,
      const SizedBox(height: 10),
      Expanded(child: content),
    ]);

    return Hero(
      tag: controller.state.resourceData.value.id,
      child: Scaffold(
        appBar: appBar,
        body: body,
      ),
    );
  }
}
