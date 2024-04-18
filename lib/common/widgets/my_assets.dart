import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

enum AssetsTyle {
  svg,
  png,
  jpg,
  lottie,
}

class MyAssets extends StatelessWidget {
  const MyAssets({
    super.key,
    required this.name,
    required this.tyle,
    this.width,
    this.height,
    this.color,
    this.fit,
  });

  final String name;
  final AssetsTyle tyle;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    switch (tyle) {
      case AssetsTyle.png:
        return Image.asset(
          'assets/images/$name.png',
          fit: fit,
          width: width,
          height: height,
          color: color,
        );

      case AssetsTyle.jpg:
        return Image.asset(
          'assets/images/$name.jpg',
          fit: fit,
          width: width,
          height: height,
          color: color,
        );

      case AssetsTyle.svg:
        return SvgPicture.asset(
          'assets/svg/$name.svg',
          width: width,
          height: height,
          colorFilter: color == null
              ? null
              : ColorFilter.mode(
                  color!,
                  BlendMode.modulate,
                ),
        );

      default:
        return LottieBuilder.asset(
          'assets/lottie/$name.zip',
          fit: fit ?? BoxFit.fill,
          width: width ?? double.infinity,
          height: height ?? double.infinity,
        );
    }
  }
}
