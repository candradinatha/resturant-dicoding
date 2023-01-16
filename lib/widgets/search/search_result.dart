import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../constants/app_sizes.dart';
import '../../data/controller/search_controller.dart';
import '../restaurant/restaurant_list_item.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    super.key,
    required this.controller,
  });

  final SearchController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isSearching.isFalse &&
            controller.restaurantResponse.value.founded == 0 &&
            controller.searchCtrl.value.text.isNotEmpty) {
          return Center(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset(
                      "assets/data/gif_empty_data.json",
                      height: 200,
                    ),
                    Text(
                      'No result for "${controller.searchCtrl.value.text}"',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(Sizes.p16),
            child: StaggeredGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: Sizes.p8,
              mainAxisSpacing: Sizes.p8,
              children: List.generate(
                controller.isSearching.isTrue
                    ? 2
                    : controller.restaurantResponse.value.restaurants?.length ??
                        0,
                (index) {
                  if (controller.isSearching.isTrue) {
                    return const RestaurantListItem(
                      item: null,
                      isShimmering: true,
                    );
                  } else {
                    return RestaurantListItem(
                      item: controller
                          .restaurantResponse.value.restaurants?[index],
                    );
                  }
                },
              ),
            ),
          );
        }
      },
    );
  }
}
