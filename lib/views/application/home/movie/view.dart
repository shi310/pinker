import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/index.dart';

import 'index.dart';

class MovieViewView extends GetView<MovieViewController> {
  const MovieViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieViewController>(
      init: MovieViewController(),
      builder: (controller) {
        /// 背景部分
        /// 背景是该页面的下层，也就是主要的内容展示区
        /// 因此背景的排版就是页面的排版
        /// 下方是背景部分的banner顶层的播放按钮和文字
        /// 下方是背景部分：banner的组合

        Widget itemBuilder(context, index) {
          var banner = MyBanner(
            imageUrl: controller.state.banners.value.list[index].image,
            title: controller.state.banners.value.list[index].title,
          );

          return banner;
        }

        Widget bodyBuilder() {
          const lottie = MyAssets(name: 'loading', tyle: AssetsTyle.lottie);

          var bannerPage = PageView.builder(
            itemBuilder: itemBuilder,
            itemCount: controller.state.banners.value.list.length,
            onPageChanged: controller.onPageChanged,
            controller: controller.pageController,
            scrollDirection: Axis.horizontal,
          );

          var bannersPageBox = SizedBox(
            width: double.infinity,
            height: 480,
            child: controller.state.banners.value.list.isEmpty
                ? lottie
                : bannerPage,
          );

          var noChance = Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
              borderRadius: BorderRadius.circular(4),
            ),
          );

          var chance = Container(
            width: 16,
            height: 8,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.circular(4),
            ),
          );

          Widget toElement(int index) {
            var children = [
              Obx(() => index == controller.state.index ? chance : noChance),
              if (index < controller.state.banners.value.list.length - 1)
                const SizedBox(width: 10),
              if (index == controller.state.banners.value.list.length - 1)
                const SizedBox(width: 20),
            ];
            return Row(children: children);
          }

          var indexBox = Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: controller.state.banners.value.list
                .asMap()
                .keys
                .map(toElement)
                .toList(),
          );

          var bannersBox = Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              bannersPageBox,
              Positioned(bottom: 28, child: indexBox),
            ],
          );

          return Column(
            children: [
              bannersBox,
              if (controller.state.medias.value.list.isEmpty)
                MyMediaBox.loading()
              else
                for (var media in controller.state.medias.value.list)
                  MyMediaBox(
                    mediaDataList: media.list,
                    title: media.title,
                    isHero: true,
                  ),
              const SizedBox(height: 20),
            ],
          );
        }

        return Obx(bodyBuilder);
      },
    );
  }
}
