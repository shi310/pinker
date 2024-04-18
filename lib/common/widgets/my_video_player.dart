import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import '../index.dart';

class MyVideoPlayer extends StatefulWidget {
  const MyVideoPlayer({
    super.key,
    required this.videoUrl,
    required this.imageUrl,
    // required this.valueKey,
  });

  final String videoUrl;
  final String imageUrl;
  // final int valueKey;

  @override
  State<MyVideoPlayer> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  bool isShowLoading = true;

  final customControls = CupertinoControls(
    backgroundColor: MyColors.geryTranslucent.withOpacity(0.3),
    iconColor: MyColors.white,
  );

  Future<void> initPlayer(String url) async {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      customControls: customControls,
    );

    try {
      await videoPlayerController.initialize();
      setState(() {
        isShowLoading = false;
      });

      MyLogger.w('视频初始化成功: ${widget.videoUrl}');
    } catch (e) {
      MyLogger.w(e.toString());
    }
  }

  @override
  void initState() {
    initPlayer(widget.videoUrl);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant MyVideoPlayer oldWidget) {
    // 页面刷新的时候
    // 先暂停旧的视频，然后重新初始化
    videoPlayerController.pause();
    initPlayer(widget.videoUrl);

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 加载动画
    const lottie = MyAssets(name: 'loading', tyle: AssetsTyle.lottie);

    // 视频的封面
    final imageBox = MyImage(
      imageUrl: widget.imageUrl,
      borderRadius: BorderRadius.zero,
      width: double.infinity,
      height: double.infinity,
    );

    // 视频区的遮罩，主要是遮住封面图
    final mark = Container(
      color: Colors.black.withOpacity(0.7),
      width: double.infinity,
      height: double.infinity,
    );

    // 视频加载动画只需要 0.5 的透明度，这里是处理透明度的
    const lottieOpcaty = Opacity(
      opacity: 0.5,
      child: lottie,
    );

    // 加载中：精彩即将开始。。。
    final loadingContent = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const MyAssets(name: 'play', tyle: AssetsTyle.svg),
        const SizedBox(height: 30, width: double.infinity),
        Text(
          '精彩即将开始...',
          style: Theme.of(context).myTextStyleLight,
        ),
      ],
    );

    final loadingBox = Stack(children: [
      imageBox,
      mark,
      lottieOpcaty,
      loadingContent,
    ]);

    // 加载中的组成方式：
    // 封面图放最底下
    // 遮罩罩住封面图
    // 加载动画
    // 最后把加载中放到顶层
    return isShowLoading
        ? loadingBox
        : Chewie(
            // key: ValueKey(widget.valueKey),
            controller: chewieController,
          );
  }
}
