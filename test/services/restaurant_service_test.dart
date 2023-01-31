import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant/constants/strings.dart';
import 'package:restaurant/data/api/restaurant/restaurant_service.dart';
import 'package:restaurant/data/model/restaurant_model.dart';

import 'restaurant_service_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
@GenerateNiceMocks([MockSpec<RestaurantService>()])
void main() {
  group(
    "Restaurant Service Test",
    () {
      final mockDio = MockDio();
      final restaurantService = MockRestaurantService();

      test(
        "Test fetch restaurants",
        () async {
          when(mockDio.get(
            "${Config.baseUrl}${RestaurantService.listPath}",
            queryParameters: {},
            options: Options(
              headers: {
                "Content-Type": "application/json",
              },
            ),
            cancelToken: null,
            onReceiveProgress: null,
          )).thenAnswer(
            (_) {
              return Future.value(
                Response(
                  statusCode: 200,
                  requestOptions: RequestOptions(
                    data: {
                      "error": false,
                      "message": "success",
                      "count": 20,
                      "restaurants": [
                        {
                          "id": "rqdv5juczeskfw1e867",
                          "name": "Melting Pot",
                          "description": "Lorem ipsum dolor sit amet.",
                          "pictureId": "14",
                          "city": "Medan",
                          "rating": 4.2
                        }
                      ]
                    },
                    path: "${Config.baseUrl}${RestaurantService.listPath}",
                  ),
                ),
              );
            },
          );

          // restaurant list
          expect(
            await restaurantService.getRestaurants(),
            isInstanceOf<RestaurantListResponse>(),
          );
        },
      );

      test(
        "Test fetch restaurants on error",
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
