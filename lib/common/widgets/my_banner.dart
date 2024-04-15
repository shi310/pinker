import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class MyBanner extends StatelessWidget {
  const MyBanner({
    super.key,
    required this.imageUrl,
    required this.title,
    this.onTap,
  });

  final String imageUrl;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // 直接在Stack中构建MyImage，减少了backImage变量的使用
    // 使用Get.context!.width代替Get.width，以匹配Dart 3.3的语法（如果需要）
    final screenWidth = Get.width; // 更健壮的获取屏幕宽度方式

    // 优化渐变色的定义
    final colors = [
      Theme.of(context).colorScheme.background,
      Colors.transparent,
    ];

    final gradientTop = LinearGradient(
        colors: colors,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);

    final gradientBottom = LinearGradient(
        colors: colors,
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter);

    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        MyImage(
          imageUrl: imageUrl,
          height: 480,
          width: screenWidth,
        ),
        Positioned(
          top: 0,
          left: 0,
          height: 180,
          width: screenWidth,
          child: Container(decoration: BoxDecoration(gradient: gradientTop)),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          height: 120,
          width: screenWidth,
          child: Container(decoration: BoxDecoration(gradient: gradientBottom)),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyIcons.play(), // 假设MyIcons.play()返回一个Widget
              const SizedBox(height: 10),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
