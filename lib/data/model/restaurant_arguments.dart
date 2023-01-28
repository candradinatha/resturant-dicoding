import 'package:restaurant/data/model/restaurant_model.dart';

class RestaurantArguments {
  final String heroAdditionalText;
  final Restaurant? restaurant;

  RestaurantArguments({
    required this.heroAdditionalText,
    required this.restaurant,
  });
}
