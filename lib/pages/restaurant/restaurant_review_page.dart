import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/styles.dart';
import 'package:restaurant/widgets/common/app_bar_center.dart';
import 'package:restaurant/widgets/common/dash_separator.dart';
import 'package:restaurant/widgets/restaurant/customer_review_item.dart';

import '../../data/controller/restaurant_detail_controller.dart';

class RestaurantReviewPage extends StatelessWidget {
  const RestaurantReviewPage({super.key});

  static const routeName = "/restaurant_review";

  @override
  Widget build(BuildContext context) {
    final RestaurantDetailController controller = Get.find();

    return GetBuilder(
      init: controller,
      builder: (_) => Scaffold(
        backgroundColor: colorBgDark,
        appBar: const AppBarCenter(
          title: "Customer Review",
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.showPostAReviewForm,
          child: const Icon(
            Icons.speaker_notes_rounded,
            size: 24,
          ),
        ),
        body: Obx(
          () => ListView.separated(
            itemBuilder: (context, index) {
              return CustomerReviewItem(
                item: controller.restaurantResponse.value.restaurant
                    ?.customerReviews?[index],
              );
            },
            separatorBuilder: (context, index) {
              return const DashSeparator(
                height: 0.5,
              );
            },
            itemCount: controller.restaurantResponse.value.restaurant
                    ?.customerReviews?.length ??
                0,
          ),
        ),
      ),
    );
  }
}
