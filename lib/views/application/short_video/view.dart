import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/index.dart';
import 'index.dart';

class ShortVideoView extends StatelessWidget {
  const ShortVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShortVideoController>(
      init: ShortVideoController(),
      builder: (controller) {
        return Obx(() => _buildBody(context, controller));
      },
    );
  }

  Widget _buildBody(BuildContext context, ShortVideoController controller) {
    if (controller.state.isShowLoading) {
      return const MyAssets(
        name: 'loading',
        tyle: AssetsTyle.lottie,
      );
    }

    final shortList = controller.state.shortList;

    return PageView.builder(
      itemBuilder: (context, index) => itemBuilder(context, index, controller),
      itemCount: shortList.value.list.length,
      scrollDirection: Axis.vertical,
      onPageChanged: controller.onPageChanged,
      physics: const BouncingScrollPhysics(),
    );
  }

  Widget itemBuilder(
    BuildContext context,
    int index,
    ShortVideoController controller,
  ) {
    final shortList = controller.state.shortList;
    final title = Text(shortList.value.list[index].name);

    final value = shortList.value.list[index];

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

    final yearChildrenString = MyCharacter.getListToString(yearChildren);

    final playButton = MyButton(
      onTap: () {},
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: const Text('查看完整版'),
    );

    final contentBoxChildren = [
      Row(children: [title, const Spacer(), playButton]),
      const SizedBox(height: 8),
      if (yearChildren.isNotEmpty) Text(yearChildrenString),
      if (value.actors != null) Text('演员: ${value.actors!}'),
      if (value.director != null) Text('导演: ${value.director!}'),
      if (value.introduce != null) Text('剧情: ${value.introduce!}', maxLines: 1),
    ];

    final videoInfoChild = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: contentBoxChildren,
    );

    final videoInfo = Column(
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: videoInfoChild,
        ),
      ],
    );

    return Stack(
      children: [
        Obx(() => _buildVideoPlayer(controller, value, index)),
        videoInfo,
      ],
    );
  }

  Widget _buildVideoPlayer(
    ShortVideoController controller,
    DataResourceModel value,
    int index,
  ) {
    const loading = MyAssets(
      name: 'loading',
      tyle: AssetsTyle.lottie,
    );
    if (controller.state.isShowLoading) return loading;

    final videoPlayer = MyVideoPlayer(
      videoUrl: value.playUrls[0].urls[0],
      imageUrl: value.image,
    );

    return videoPlayer;
  }
}
