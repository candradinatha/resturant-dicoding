import 'package:flutter/material.dart';
import 'package:restaurant/constants/strings.dart';
import 'package:restaurant/model/restaurant_model.dart';
import 'package:restaurant/styles.dart';
import 'package:restaurant/widgets/common/rounded_back_button.dart';
import 'package:restaurant/widgets/restaurant/food_drink_widget.dart';

import '../../constants/app_sizes.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({super.key, this.item});

  static const routeName = "/restaurant_detail";

  final Restaurant? item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBgDark,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Hero(
                  tag: item?.id ?? "",
                  child: Image.network(
                    item?.pictureId ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
                if (Navigator.canPop(context)) ...[
                  const RoundedBackButton(),
                ],
              ],
            ),
            Container(
              margin: const EdgeInsets.all(Sizes.p16),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      item?.name ?? '',
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
                            text: " ${item?.city}",
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
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
                            text: " ${item?.rating}",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppGaps.h16,
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      item?.description ?? "",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ),
                  if (item?.menus?.foods != null) ...[
                    FoodDrinkWidget(
                      menuList: item?.menus?.foods,
                      type: MenuTypes.food,
                    ),
                  ],
                  if (item?.menus?.drinks != null) ...[
                    FoodDrinkWidget(
                      menuList: item?.menus?.drinks,
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
    );
  }
}
