import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/constants/strings.dart';
import 'package:restaurant/data/controller/database_controller.dart';
import 'package:restaurant/data/controller/restaurant_detail_controller.dart';
import 'package:restaurant/data/model/restaurant_arguments.dart';
import 'package:restaurant/styles.dart';
import 'package:restaurant/utils/helper.dart';
import 'package:restaurant/widgets/common/rounded_back_button.dart';
import 'package:restaurant/widgets/common/rounded_favorite_button.dart';
import 'package:restaurant/widgets/restaurant/food_drink_widget.dart';

import '../../constants/app_sizes.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({
    super.key,
    this.arguments,
  });

  static const routeName = "/restaurant_detail";

  final RestaurantArguments? arguments;

  @override
  Widget build(BuildContext context) {
    final DatabaseController databaseController = Get.find();

    return GetBuilder(
      init: RestaurantDetailController(
        restaurant: arguments?.restaurant,
      ),
      builder: (controller) => Scaffold(
        backgroundColor: colorBgDark,
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: "${controller.restaurantResponse.value.restaurant?.id}${arguments?.heroAdditionalText}",
                      child: Image.network(
                        getImageUrl(
                          pictureId: controller
                              .restaurantResponse.value.restaurant?.pictureId,
                          imageSize: ImageSize.large,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (Navigator.canPop(context)) ...[
                      const RoundedBackButton(),
                    ],
                    Positioned(
                      right: 0,
                      child: SafeArea(
                        child: RoundedFavoriteButton(
                          isFavorite: databaseController.restaurantFavorites
                                      .firstWhereOrNull(
                                          (e) => e.id == arguments?.restaurant?.id) ==
                                  null
                              ? false
                              : true,
                          onFavoriteTap: () {
                            databaseController.addOrRemoveFavorite(arguments?.restaurant);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(Sizes.p16),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          controller
                                  .restaurantResponse.value.restaurant?.name ??
                              '',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      AppGaps.h8,
                      SizedBox(
                        width: double.infinity,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const WidgetSpan(
                                child: Icon(
                                  Icons.location_on_rounded,
                                  color: colorPrimary,
                                  size: Sizes.p20,
                                ),
                              ),
                              TextSpan(
                                text:
                                    " ${controller.restaurantResponse.value.restaurant?.city}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                      color: colorPrimary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AppGaps.h8,
                      SizedBox(
                        width: double.infinity,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const WidgetSpan(
                                child: Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: Sizes.p20,
                                ),
                              ),
                              TextSpan(
                                text:
                                    " ${controller.restaurantResponse.value.restaurant?.rating}",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const WidgetSpan(
                                child: AppGaps.w16,
                              ),
                              WidgetSpan(
                                child: GestureDetector(
                                  onTap: controller.navigateToRestaurantReview,
                                  child: Text(
                                    "See All Reviews",
                                    style:
                                        Get.theme.textTheme.subtitle1?.copyWith(
                                      color: Colors.yellow,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AppGaps.h16,
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          controller.restaurantResponse.value.restaurant
                                  ?.description ??
                              "",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                      ),
                      if (controller.restaurantResponse.value.restaurant?.menus
                              ?.foods !=
                          null) ...[
                        FoodDrinkWidget(
                          menuList: controller.restaurantResponse.value
                              .restaurant?.menus?.foods,
                          type: MenuTypes.food,
                        ),
                      ],
                      if (controller.restaurantResponse.value.restaurant?.menus
                              ?.drinks !=
                          null) ...[
                        FoodDrinkWidget(
                          menuList: controller.restaurantResponse.value
                              .restaurant?.menus?.drinks,
                          type: MenuTypes.drink,
                        ),
                      ],
                      AppGaps.h20,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
