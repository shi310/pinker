import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MyIcons {
  static Widget get init_1 => SvgPicture.asset(
        'assets/svg/init_1.svg',
        width: Get.width * 0.6,
      );
  static Widget get init_2 => SvgPicture.asset(
        'assets/svg/init_2.svg',
        width: Get.width * 0.6,
      );
  static Widget get init_3 => SvgPicture.asset(
        'assets/svg/init_3.svg',
        width: Get.width * 0.6,
      );

  static Widget get ads_01 => Image.asset(
        'assets/images/ads_01.jpg',
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      );

  static Widget get bottomHome_1 => SvgPicture.asset(
        'assets/svg/bottom_home_1.svg',
      );

  static Widget get bottomHome_2 => SvgPicture.asset(
        'assets/svg/bottom_home_2.svg',
      );

  static Widget get bottomIt_1 => SvgPicture.asset(
        'assets/svg/bottom_it_1.svg',
      );

  static Widget get bottomIt_2 => SvgPicture.asset(
        'assets/svg/bottom_it_2.svg',
      );

  static Widget get bottomSear_1 => SvgPicture.asset(
        'assets/svg/bottom_sear_1.svg',
      );

  static Widget get bottomSear_2 => SvgPicture.asset(
        'assets/svg/bottom_sear_2.svg',
      );

  static Widget get bottomMy_1 => SvgPicture.asset(
        'assets/svg/bottom_my_1.svg',
      );

  static Widget get bottomMy_2 => SvgPicture.asset(
        'assets/svg/bottom_my_2.svg',
      );

  static Widget diamond() => SvgPicture.asset('assets/svg/diamond.svg');

  static Widget right() => SvgPicture.asset('assets/svg/right.svg');

  static Widget back(BuildContext context) => SvgPicture.asset(
        'assets/svg/back.svg',
        width: 18,
        height: 18,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onBackground, // 目标颜色
          BlendMode.modulate, // 混合模式
        ),
      );

  static Widget set() => SvgPicture.asset('assets/svg/set.svg');

  static Widget check_1() => SvgPicture.asset('assets/svg/check_1.svg');

  static Widget check_2() => SvgPicture.asset('assets/svg/check_2.svg');

  static Widget customer() => SvgPicture.asset('assets/svg/my_customer.svg');

  static Widget emial() => SvgPicture.asset('assets/svg/my_email.svg');
  static Widget emialRead() => SvgPicture.asset('assets/svg/my_email_1.svg');

  static Widget bank() => Image.asset('assets/images/my_bank.png', width: 28);

  static Widget phone() => Image.asset('assets/images/my_phone.png', width: 28);

  static Widget exit() => Image.asset('assets/images/my_exit.png', width: 28);

  static Widget like() => SvgPicture.asset('assets/svg/like.svg', width: 28);

  static Widget play({double? size}) {
    return SvgPicture.asset('assets/svg/play.svg', width: size);
  }

  static Widget error() {
    return SvgPicture.asset('assets/svg/error_3.svg', width: 80);
  }

  static Widget retry() {
    return SvgPicture.asset('assets/svg/error_2.svg', width: 80);
  }

  static Widget likePress() {
    return SvgPicture.asset('assets/svg/like_press.svg', width: 28);
  }

  static Widget password() {
    return Image.asset('assets/images/my_password.png', width: 28);
  }

  static Widget broken() {
    return Image.asset('assets/images/my_broken.png', width: 28);
  }

  static Widget logo() {
    return SvgPicture.asset('assets/svg/logo.svg');
  }

  static Widget lottieHolder({BoxFit? fit}) {
    return LottieBuilder.asset(
      'assets/lottie/image_holder.zip',
      fit: fit ?? BoxFit.fitWidth,
    );
  }

  static Widget get search =>
      SvgPicture.asset('assets/svg/search.svg', height: 20, width: 20);

  static Widget history() {
    return Image.asset('assets/images/my_history.png', width: 28);
  }

  static Widget loading(BuildContext context) {
    var loadingBox = CircularProgressIndicator(
      backgroundColor: Theme.of(context).primaryColor,
      color: Theme.of(context).canvasColor,
      strokeWidth: 3,
    );

    var child = SizedBox(width: 24, height: 24, child: loadingBox);

    return Center(child: child);
  }
}
