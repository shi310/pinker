import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class MyMediaBox extends StatelessWidget {
  const MyMediaBox({
    super.key,
    this.title,
    required this.mediaDataList,
    this.onTap,
    this.isHero = false,
  });

  final String? title;
  final List<DataResourceModel> mediaDataList;
  final void Function(DataResourceModel resourceData)? onTap;
  final bool isHero;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // 使用MediaQuery获取屏幕宽度

    Widget mediaColumn(DataResourceModel resourceData) {
      final movieImage = MyImage(
        imageUrl: resourceData.image,
        width: double.infinity,
        height: (screenWidth - 40) / 3 * 36 / 26,
      );

      final mediaButton = MyButton(
        width: (screenWidth - 20 - 32) / 3,
        onTap: () {
          if (onTap != null) {
            onTap!.call(resourceData);
          } else {
            Get.toNamed(MyRoutes.videoPlay, arguments: resourceData);
          }
        },
        borderRadius: BorderRadius.circular(8),
        padding: EdgeInsets.zero, // 加上 const
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            movieImage,
            const SizedBox(height: 10), // 加上 const
            Text(
              resourceData.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            if (resourceData.introduction != null)
              Text(
                resourceData.introduction!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall,
              ),
          ],
        ),
      );

      return isHero
          ? Hero(tag: resourceData.id, child: mediaButton)
          : mediaButton;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16), // 加上 const
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            const SizedBox(height: 20), // 加上 const
            Text(
              title!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20), // 加上 const
          ],
          Wrap(
            spacing: 10,
            runSpacing: 20,
            children: mediaDataList.map(mediaColumn).toList(),
          ),
        ],
      ),
    );
  }

  static Widget loading({
    bool isHaveTitle = true,
  }) {
    const lottie = MyAssets(name: 'loading', tyle: AssetsTyle.lottie);

    final lottieMoiveBox = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            width: double.infinity,
            height: ((Get.width - 40) / 3) * 36 / 26,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: lottie,
          ),
          const SizedBox(height: 10),
          Container(
            clipBehavior: Clip.antiAlias,
            width: 120,
            height: 14,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
            child: lottie,
          ),
          const SizedBox(height: 4),
          Container(
            clipBehavior: Clip.antiAlias,
            width: 80,
            height: 14,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
            child: const Opacity(opacity: 0.5, child: lottie),
          ),
        ],
      ),
    );

    final lottieRow = Row(
      children: [
        lottieMoiveBox,
        const SizedBox(width: 10),
        lottieMoiveBox,
        const SizedBox(width: 10),
        lottieMoiveBox,
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isHaveTitle) const SizedBox(height: 20),
          if (isHaveTitle)
            Container(
              clipBehavior: Clip.antiAlias,
              width: 160,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: lottie,
            ),
          if (isHaveTitle) const SizedBox(height: 20),
          lottieRow,
          const SizedBox(height: 20),
          lottieRow,
          const SizedBox(height: 20),
          lottieRow,
          const SizedBox(height: 20),
          lottieRow,
        ],
      ),
    );
  }
}
