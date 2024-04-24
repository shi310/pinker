import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/index.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({
    super.key,
    required this.tabs,
    required this.onTap,
    this.selectColor,
    this.seclectTextStyle,
    this.textStyle,
  });

  final List<String> tabs;
  final void Function(BuildContext context, int) onTap;
  final Color? selectColor;
  final TextStyle? textStyle;
  final TextStyle? seclectTextStyle;

  @override
  Widget build(BuildContext context) {
    final RxInt indexRx = 0.obs; // 明确使用RxInt

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ListView.separated(
        // 使用ListView.separated来处理间隔
        itemCount: tabs.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: 8), // 间隔处理
        itemBuilder: (BuildContext context, int index) {
          return Obx(
            () => Center(
              child: SizedBox(
                height: 30,
                child: MyButton(
                  onTap: indexRx.value == index
                      ? null
                      : () {
                          indexRx.value = index;
                          onTap(context, index);
                        },
                  onTapDownColor: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.05),
                  color: indexRx.value == index ? selectColor : null,
                  child: Text(
                    textAlign: TextAlign.center,
                    tabs[index],
                    style: indexRx.value == index
                        ? seclectTextStyle ??
                            Theme.of(context).textTheme.titleSmall
                        : textStyle ?? Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
