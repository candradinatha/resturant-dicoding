import 'package:flutter/material.dart';
import 'package:restaurant/constants/strings.dart';
import 'package:restaurant/model/restaurant_model.dart';
import 'package:restaurant/styles.dart';

import '../../constants/app_sizes.dart';

class FoodDrinkWidget extends StatelessWidget {
  const FoodDrinkWidget({
    super.key,
    required this.menuList,
    required this.type,
  });

  final List<FoodOrDrink?>? menuList;
  final String type;

  String _getTitle() {
    return type == MenuTypes.food
        ? "Foods"
        : type == MenuTypes.drink
            ? "Drinks"
            : "";
  }

  Color _getBackgroundColor() {
    return type == MenuTypes.food ? colorPrimary : Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppGaps.h20,
        SizedBox(
          width: double.infinity,
          child: Text(
            _getTitle(),
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        AppGaps.h12,
        Align(
          alignment: Alignment.topLeft,
          child: Wrap(
            spacing: Sizes.p8,
            children: List.generate(
              menuList?.length ?? 0,
              (index) {
                final food = menuList?[index];
                return Chip(
                  label: Text(
                    food?.name ?? '',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  backgroundColor: _getBackgroundColor(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
