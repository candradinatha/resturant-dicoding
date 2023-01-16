import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:restaurant/constants/app_sizes.dart';
import 'package:restaurant/data/controller/home_controller.dart';
import 'package:restaurant/styles.dart';
import 'package:restaurant/widgets/restaurant/restaurant_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: colorBgDark,
          body: NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: MediaQuery.of(context).size.height * 0.25,
                  backgroundColor: colorBgDarkAccent,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      "assets/images/img_home_header.jpeg",
                      fit: BoxFit.cover,
                    ),
                    title: SafeArea(
                      child: GestureDetector(
                        onTap: controller.navigateToSearchPage,
                        child: Hero(
                          tag: "homeSearch",
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.p8,
                              horizontal: Sizes.p16,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Sizes.p16),
                              color: colorBGDarkSecondaryAccent,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                AppGaps.w8,
                                Text(
                                  "Search restaurant...",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Colors.grey,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    titlePadding: const EdgeInsets.symmetric(
                      horizontal: Sizes.p16,
                      vertical: Sizes.p8,
                    ),
                    expandedTitleScale: 1.1,
                  ),
                ),
              ];
            },
            body: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: () => controller.getRestaurants(),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.p16,
                    horizontal: Sizes.p8,
                  ),
                  child: Obx(
                    () => StaggeredGrid.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: Sizes.p8,
                      mainAxisSpacing: Sizes.p8,
                      children: List.generate(
                        controller.isShimmering.isTrue
                            ? controller.restaurantResponse.value.restaurants
                                    ?.length ??
                                4
                            : controller.restaurantResponse.value.restaurants
                                    ?.length ??
                                0,
                        (index) {
                          if (controller.isShimmering.isTrue) {
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
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
