import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/index.dart';

import 'index.dart';

class GameTertisView extends GetView<GameTertisController> {
  const GameTertisView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = controller.state;
    // 方块之间的间距
    const paddingOutline = EdgeInsets.all(1);

    // 方块内部的间距
    const paddingInline = EdgeInsets.all(3);

    // 方块的大小
    const size = 12.0;

    // 默认的方块样式
    var defaultBox = Container(
      padding: paddingInline,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).tetrisDefaultPrimaryColor,
          width: 1,
        ),
        color: Theme.of(context).tetrisDefaultSecondColor,
      ),
      child: Container(
        color: Theme.of(context).tetrisDefaultPrimaryColor,
        width: size,
        height: size,
      ),
    );

    // 移动和着陆的样式
    var selectBox = Container(
      padding: paddingInline,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).tetrisMovePrimaryColor,
          width: 1,
        ),
        color: Theme.of(context).tetrisMoveSecondColor,
      ),
      child: Container(
        color: Theme.of(context).tetrisMovePrimaryColor,
        width: size,
        height: size,
      ),
    );

    Widget buildGameBox() {
      List<Widget> children = state.gameData.value.data
          .map((e) => Row(
              children: e
                  .map((e) => Container(
                        padding: paddingOutline,
                        child: e == 0 ? defaultBox : selectBox,
                      ))
                  .toList()))
          .toList();
      return Column(children: children);
    }

    Widget buildNextBox() {
      return Column(
        children: [
          ...state.gameData.value.next.data[state.gameData.value.next.angle]
              .map((e) => Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:
                      e.map((i) => i == 0 ? defaultBox : selectBox).toList()))
        ],
      );
    }

    var topLeft = Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).tetrisOutline,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(6),
      child: Obx(buildGameBox),
    );

    var topRight = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '游戏时间',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 6),
        Obx(() => Text(
              MyTimer.getDuration(state.gameTime),
              style: Theme.of(context).textTheme.titleLarge,
            )),
        const SizedBox(height: 12),
        Text(
          '游戏等级',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 6),
        Obx(() => Text(
              '${state.grade}',
              style: Theme.of(context).textTheme.titleLarge,
            )),
        const SizedBox(height: 12),
        Text(
          '得分',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 6),
        Obx(() => Text(
              '${state.score}',
              style: Theme.of(context).textTheme.titleLarge,
            )),
        const SizedBox(height: 12),
        Text(
          '最高分',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 12),
        Obx(() => Text(
              '${state.scoreHistory}',
              style: Theme.of(context).textTheme.titleLarge,
            )),
        const SizedBox(height: 12),
        Text(
          '下一个',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 6),
        Obx(buildNextBox),
        const SizedBox(height: 16),
        MyButton(
          width: 100,
          height: 30,
          color: Theme.of(context).primaryColor,
          onTap: controller.onPauseGame,
          child: const Text('暂停'),
        ),
      ],
    );

    var topBox = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [topLeft, topRight],
    );

    var buttonLeft = MyButton(
      isDebouncing: false,
      height: 75,
      color: Theme.of(context).primaryColor,
      onTap: state.isDisable ? null : controller.onLeft,
      child: const Icon(Icons.chevron_left),
    );

    var buttonRight = MyButton(
        isDebouncing: false,
        height: 75,
        color: Theme.of(context).primaryColor,
        onTap: state.isDisable ? null : controller.onRight,
        child: const Icon(Icons.chevron_right));

    var bottomLeftTop = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: buttonLeft),
        const SizedBox(width: 10),
        Expanded(child: buttonRight),
      ],
    );

    var bottomDown = MyButton(
        isDebouncing: false,
        height: 75,
        color: Theme.of(context).primaryColor,
        onTap: state.isDisable ? null : controller.onDownFast,
        child: const Icon(Icons.expand_more));

    var bottomLeft = Column(children: [
      bottomLeftTop,
      const SizedBox(height: 10),
      bottomDown,
    ]);

    var bottomRotate = MyButton(
      isDebouncing: false,
      height: 160,
      color: Theme.of(context).primaryColor,
      onTap: state.isDisable ? null : controller.onRotate,
      child: const Center(
        child: Icon(Icons.refresh),
      ),
    );

    var bottomBox = SafeArea(
      top: false,
      left: false,
      right: false,
      child: Row(children: [
        Expanded(child: bottomLeft),
        const SizedBox(width: 20),
        Expanded(child: bottomRotate),
      ]),
    );

    var gameBody = Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [topBox, const Spacer(), bottomBox]),
    );

    var startBody = Container(
      width: Get.width,
      height: Get.height,
      color: MyColors.black.withOpacity(0.6),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text('经典游戏 - 80后的回忆'),
          const SizedBox(height: 20),
          MyButton(
            width: 160,
            height: 40,
            color: Theme.of(context).primaryColor,
            onTap: controller.onStartGame,
            child: const Text('开始游戏'),
          ),
        ],
      ),
    );

    var paushBody = Container(
      width: Get.width,
      height: Get.height,
      color: MyColors.black.withOpacity(0.8),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text('游戏暂停中'),
          const SizedBox(height: 20),
          Obx(() => Text(
                MyTimer.getDuration(controller.state.paushTime),
                style: Theme.of(context).textTheme.headlineLarge,
              )),
          const SizedBox(height: 20),
          MyButton(
            width: 160,
            height: 40,
            color: Theme.of(context).primaryColor,
            onTap: controller.onStartGame,
            child: const Text('继续游戏'),
          ),
        ],
      ),
    );

    var gameOverBody = Container(
      width: Get.width,
      height: Get.height,
      color: MyColors.black.withOpacity(0.8),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            '游戏结束',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          Text(
            '你的得分',
            style: Theme.of(context).myTextStyleLight,
          ),
          const SizedBox(height: 10),
          Obx(() => Text(
                '${controller.state.score}',
                style: Theme.of(context).textTheme.headlineLarge,
              )),
          const SizedBox(height: 20),
          Text(
            '最高分',
            style: Theme.of(context).myTextStyleLight,
          ),
          const SizedBox(height: 10),
          Obx(() => Text(
                '${controller.state.score}',
                style: Theme.of(context).textTheme.headlineLarge,
              )),
          const SizedBox(height: 20),
          Text(
            '你的等级',
            style: Theme.of(context).myTextStyleLight,
          ),
          const SizedBox(height: 10),
          Obx(() => Text(
                '${controller.state.grade}',
                style: Theme.of(context).textTheme.headlineLarge,
              )),
          const SizedBox(height: 20),
          Text(
            '游戏时长',
            style: Theme.of(context).myTextStyleLight,
          ),
          const SizedBox(height: 10),
          Obx(() => Text(
                MyTimer.getDuration(controller.state.gameTime),
                style: Theme.of(context).textTheme.headlineLarge,
              )),
          const SizedBox(height: 20),
          MyButton(
            width: 160,
            height: 40,
            color: Theme.of(context).primaryColor,
            onTap: controller.onReset,
            child: Text(
              '重新开始',
              style: Theme.of(context).myTextStyleLight,
            ),
          ),
        ],
      ),
    );

    var body = Stack(
      children: [
        gameBody,
        Obx(() => controller.state.isStart
            ? startBody
            : controller.state.isPause
                ? paushBody
                : controller.state.isGameOver
                    ? gameOverBody
                    : gameBody)
      ],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Tertis')),
      body: body,
    );
  }
}
