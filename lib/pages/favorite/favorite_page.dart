import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:restaurant/widgets/common/app_bar_center.dart';
import 'package:restaurant/widgets/common/empty_data_widget.dart';

import '../../constants/app_sizes.dart';
import '../../data/controller/database_controller.dart';
import '../../styles.dart';
import '../../widgets/restaurant/restaurant_list_item.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final DatabaseController controller = Get.find();
    return Scaffold(
      backgroundColor: colorBgDark,
      appBar: const AppBarCenter(
        title: 'Favorites',
      ),
      body: Obx(
        () {
          if (controller.restaurantFavorites.isEmpty) {
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: Sizes.p24,
              ),
              child: const EmptyDataWidget(
                message: "You haven't added any restaurant to favorites",
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
                  controller.restaurantFavorites.length,
                  (index) {
                    return RestaurantListItem(
                      item: controller.restaurantFavorites[index],
                      databaseController: controller,
                      isFromFavoritePage: true,
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
