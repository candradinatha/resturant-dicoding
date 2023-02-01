import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant/constants/strings.dart';
import 'package:restaurant/data/api/restaurant/restaurant_service.dart';
import 'package:restaurant/data/model/error_model.dart';
import 'package:restaurant/data/model/restaurant_model.dart';

import 'restaurant_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final client = MockClient();
  final restaurantService = RestaurantService(client: client);
  group(
    "Restaurant service test",
    () {
      test(
        "Fetch restaurant",
        () async {
          // Use Mockito to return a successful response when it calls the
          // provided http.Client.
          when(
            client.get(
              Uri.parse(
                Config.baseUrl + RestaurantService.listPath,
              ),
              headers: {"Content-Type": "application/json"},
            ),
          ).thenAnswer(
            (_) async => http.Response(
              '{ "error": false, "message": "success", "count": 20, "restaurants": [ { "id": "rqdv5juczeskfw1e867", "name": "Melting Pot", "description": "Lorem ipsum dolor sit amet.", "pictureId": "14", "city": "Medan", "rating": 4.2, "categories": [ { "name": "Bali" } ], "menus": { "foods": [ { "name": "Ikan teri dan roti" }, { "name": "Bebek crepes" } ], "drinks": [ { "name": "Jus jeruk" }, { "name": "Es kopi" } ] }, "customerReviews": [ { "name": "Buchori", "review": "Saya sangat suka menu malamnya!", "date": "13 Juli 2019" } ] } ] }',
              200,
            ),
          );

          expect(
            await restaurantService.getRestaurants(),
            isInstanceOf<RestaurantListResponse>(),
          );
        },
      );

      test(
        "Throws an ErrorResponse if the http call completes with an error",
        () {
          // Use Mockito to return an unsuccessful response when it calls the
          // provided http.Client.
          when(
            client.get(
              Uri.parse(
                Config.baseUrl + RestaurantService.listPath,
              ),
              headers: {"Content-Type": "application/json"},
            ),
          ).thenAnswer(
            (_) async => throw ErrorResponse(),
          );

          expect(
            restaurantService.getRestaurants(),
            throwsA(isInstanceOf<ErrorResponse>()),
          );
        },
      );
    },
  );
}
