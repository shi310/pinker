import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinker/common/index.dart';
import 'package:pinker/common/widgets/index.dart';

import 'index.dart';

class ResourceMovieView extends StatelessWidget {
  const ResourceMovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResourceMovieController>(
        init: ResourceMovieController(),
        builder: (controller) {
          final tabBarBox = Obx(() => Column(
                children: [
                  for (int i = 0;
                      i < controller.state.movieTypeList.value.list.length;
                      i++)
                    SizedBox(
                      height: 36,
                      child: MyTabBar(
                        selectColor:
                            Theme.of(context).primaryColor.withOpacity(0.1),
                        tabs: controller
                            .state.movieTypeList.value.list[i].typelist,
                        onTap: (context, index) => controller.typesClick(
                          i,
                          controller
                              .state.movieTypeList.value.list[i].mediaTypeName,
                          index,
                        ),
                      ),
                    ),
                ],
              ));

          final searchBody = Obx(() => controller.state.isLoading
              ? MyMediaBox.loading(isHaveTitle: false)
              : MyMediaBox(
                  mediaDataList: controller.state.medias.value.list,
                  isHero: true,
                ));

          return ListView(
            padding: EdgeInsets.zero,
            controller: controller.scrollController,
            children: [
              const SizedBox(height: 8),
              tabBarBox,
              const SizedBox(height: 16),
              searchBody,
            ],
          );
        });
  }
}
