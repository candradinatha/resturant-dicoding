import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant/data/api/restaurant/restaurant_service.dart';
import 'package:restaurant/data/model/restaurant_model.dart';

import 'restaurant_service_test.mocks.dart';

@GenerateNiceMocks([MockSpec<RestaurantService>()])
void main() {
  group(
    "Restaurant Service Test",
    () {
      late MockRestaurantService restaurantService;
      setUpAll(() {
        restaurantService = MockRestaurantService();
      });
      test(
        "test fetch restaurants",
        () async {
          final model = RestaurantListResponse();

          when(restaurantService.getRestaurants()).thenAnswer((_) async {
            return model;
          });

          final response = await restaurantService.getRestaurants();

          // restaurant list
          expect(response, isInstanceOf<RestaurantListResponse>());
          expect(response, model);
        },
      );

      test(
        "test fetch restaurants on Error",
        () async {
          when(restaurantService.getRestaurants()).thenAnswer((_) async {
            throw Exception();
          });
          final response = restaurantService.getRestaurants();
          expect(response, throwsException);
        },
      );
    },
  );
}
