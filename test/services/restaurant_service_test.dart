import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant/data/api/restaurant/restaurant_service.dart';
import 'package:restaurant/data/model/restaurant_model.dart';

void main() {
  test(
    "Should be able to convert json from restaurant service fetch",
    () async {
      var restaurantService = RestaurantService();
      var restaurantList = await restaurantService.getRestaurants();
      var restaurant = restaurantList.restaurants?[Random().nextInt(
        restaurantList.restaurants?.length ?? 0,
      )];
      var restaurantDetail = await restaurantService.getDetailRestaurant(
        restaurant?.id,
      );
      var postAReview = await restaurantService.postAReview({
        "id": restaurant?.id,
        "name": "automate test",
        "review": "tester review",
      });

      // restaurant list
      expect(restaurantList, isInstanceOf<RestaurantListResponse>());
      // restaurant detail
      expect(restaurantDetail, isInstanceOf<RestaurantDetailResponse>());
      // restaurant - post a review
      expect(postAReview, isInstanceOf<PostAReviewResponse>());
    },
  );
}
