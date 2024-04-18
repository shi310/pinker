import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../index.dart';

class MyImage extends StatelessWidget {
  const MyImage({
    super.key,
    required this.imageUrl,
    this.width = 55.0,
    this.height = 55.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final double width;
  final double height;
  final BorderRadiusGeometry borderRadius;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    // 将错误处理和进度指示器的构建函数直接内联到CachedNetworkImage中，减少了外部函数的定义。
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        shape: BoxShape.rectangle,
      ),
      clipBehavior: Clip.antiAlias,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        errorWidget: (context, url, error) => Container(
          color: Theme.of(context).primaryColor,
        ),
        progressIndicatorBuilder: (context, url, progress) => const MyAssets(
          name: 'loading',
          tyle: AssetsTyle.lottie,
        ),
        fadeInDuration: const Duration(milliseconds: 2000),
      ),
    );
  }
}
