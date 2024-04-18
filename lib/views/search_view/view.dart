import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../common/index.dart';
import 'index.dart';

class SearchViewView extends GetView<SearchViewViewController> {
  const SearchViewView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = controller.state;
    final hot = state.hotList;

    return Scaffold(
      appBar: AppBar(
        leading: MyButton(
          onTap: () => Get.back(),
          child: MyAssets(
            name: 'back',
            tyle: AssetsTyle.svg,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        title: MyInput(
          controller: controller.inputController,
          focusNode: controller.inputFocusNode,
          prefixIcon: const SizedBox(
            width: 36,
            height: 36,
            child: Center(
              child: MyAssets(name: 'search', tyle: AssetsTyle.svg),
            ),
          ),
          textInputAction: TextInputAction.search,
          hintText: Lang.search.tr,
          onSubmitted: controller.searchView,
        ),
      ),
      body: Obx(() {
        if (state.isShowLoading) {
          return ListView(
            controller: controller.scrollController,
            padding: const EdgeInsets.all(16),
            children: [
              for (int i = 0; i < 10; i++)
                _buildSearchListLoading(context: context),
            ],
          );
        }

        if (state.isShowResault) {
          if (state.isRetryResault) {
            return MyButton(
              onTap: () =>
                  controller.searchView(controller.inputController.text),
              width: 200,
              height: 40,
              child: Text(Lang.retry.tr),
            );
          }

          if (state.resault.value.list.isEmpty) {
            _buildHotListLoading(context: context);
          }

          return ListView(
            controller: controller.scrollController,
            padding: const EdgeInsets.all(16),
            children: state.resault.value.list
                .map((e) => _buildSearchList(context, e))
                .toList(),
          );
        }

        return ListView(
          controller: controller.scrollController,
          padding: const EdgeInsets.all(16),
          children: [
            if (state.history.isNotEmpty) ...[
              Row(
                children: [
                  const Opacity(opacity: 0.5, child: Text('最近搜索')),
                  const Spacer(),
                  MyButton(
                    onTap: controller.clear,
                    child: const Icon(
                      Icons.close,
                      size: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 34,
                child: ListView.separated(
                  itemBuilder: (context, index) => MyButton(
                    onTap: () => controller.history(index),
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.1),
                    child: Text(
                      state.history[index],
                      style: Theme.of(context).textTheme.labelMedium,
                      maxLines: 1,
                    ),
                  ),
                  itemCount: state.history.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(height: 20),
            ],
            const Opacity(opacity: 0.5, child: Text('热门搜索')),
            const SizedBox(height: 16),
            if (hot.value.list.isNotEmpty) ...[
              ...hot.value.list
                  .map((e) => _buildHotList(context: context, resourceData: e)),
            ],
            if (!state.isRetryHot && hot.value.list.isEmpty) ...[
              for (int i = 0; i < 10; i++)
                _buildHotListLoading(context: context),
            ]
          ],
        );
      }),
    );
  }

  Widget _buildSearchList(
    BuildContext context,
    DataResourceModel resourceData,
  ) {
    return Column(
      children: [
        Hero(
          tag: resourceData.id,
          child: MyButton(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.05),
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.circular(8),
            onTap: () =>
                Get.toNamed(MyRoutes.videoPlay, arguments: resourceData),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyImage(
                  imageUrl: resourceData.image,
                  width: (Get.width - 40) / 3,
                  height: ((Get.width - 40) / 3) * 36 / 26,
                  borderRadius: BorderRadius.zero,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      Text(
                        resourceData.name,
                        style: Theme.of(context).textTheme.labelLarge,
                        maxLines: 1,
                      ),
                      if (resourceData.score != null)
                        Text(
                          '★ ${resourceData.score!}',
                          style: Theme.of(context).textTheme.titleSmall,
                          maxLines: 1,
                        ),
                      if (resourceData.year != null ||
                          resourceData.country != null ||
                          resourceData.mediaType != null)
                        Text(
                          '${resourceData.year ?? ''} | ${resourceData.country ?? ''} | ${resourceData.mediaType ?? ''}',
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                        ),
                      if (resourceData.actors != null)
                        Text(
                          '演员: ${resourceData.actors!}',
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                        ),
                      if (resourceData.director != null)
                        Text(
                          '导演: ${resourceData.director!}',
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                        ),
                      if (resourceData.introduce != null)
                        Text('剧情: ${resourceData.introduce!}',
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 2),
                      if (resourceData.ranking != null)
                        Text(
                          '排名: ${resourceData.ranking!}',
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildHotListLoading({
    required BuildContext context,
  }) {
    const lottie = MyAssets(
      name: 'loading',
      tyle: AssetsTyle.lottie,
    );
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.05),
          ),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                width: 150,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: lottie,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: 120,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: lottie,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: 200,
                    height: 14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Opacity(
                      opacity: 0.5,
                      child: lottie,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: 200,
                    height: 14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Opacity(
                      opacity: 0.5,
                      child: lottie,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildHotList({
    required BuildContext context,
    required DataResourceModel resourceData,
  }) {
    return Column(
      children: [
        Hero(
          tag: resourceData.id,
          child: MyButton(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.05),
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.circular(8),
            onTap: () =>
                Get.toNamed(MyRoutes.videoPlay, arguments: resourceData),
            child: Row(
              children: [
                MyImage(
                  imageUrl: resourceData.image,
                  width: 150,
                  height: 120,
                  borderRadius: BorderRadius.zero,
                ),
                const SizedBox(width: 20),
                SizedBox(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        resourceData.name,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      if (resourceData.introduction != null)
                        Text(
                          resourceData.introduction!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      const Spacer(),
                      if (resourceData.year != null ||
                          resourceData.country != null ||
                          resourceData.mediaType != null)
                        Text(
                          '${resourceData.year ?? ''} | ${resourceData.country ?? ''} | ${resourceData.mediaType ?? ''}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSearchListLoading({
    required BuildContext context,
  }) {
    const lottie = MyAssets(
      name: 'loading',
      tyle: AssetsTyle.lottie,
    );

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: ((Get.width - 40) / 3) * 36 / 26,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.05),
          ),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              SizedBox(
                width: (Get.width - 40) / 3,
                height: ((Get.width - 40) / 3) * 36 / 26,
                child: lottie,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: 100,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: lottie,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: 30,
                    height: 14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: lottie,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: 130,
                    height: 14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Opacity(
                      opacity: 0.5,
                      child: lottie,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: 200,
                    height: 14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Opacity(
                      opacity: 0.5,
                      child: lottie,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: 60,
                    height: 14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Opacity(
                      opacity: 0.5,
                      child: lottie,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: 200,
                    height: 14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Opacity(
                      opacity: 0.5,
                      child: lottie,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: 200,
                    height: 14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Opacity(
                      opacity: 0.5,
                      child: lottie,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: 60,
                    height: 14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Opacity(
                      opacity: 0.5,
                      child: lottie,
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
