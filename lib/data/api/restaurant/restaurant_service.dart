import 'package:restaurant/data/api/common/base_service.dart';
import 'package:restaurant/data/model/restaurant_model.dart';

class RestaurantService extends BaseService {
  static const listPath = "/list";
  static const searchPath = "/search";
  static const detailPath = "/detail";
  static const reviewPath = "/review";

  RestaurantService({required super.client});

  Future<RestaurantListResponse> getRestaurants({
    bool isSearching = false,
    String? searchKeyword,
  }) async {
    try {
      final response = await get(
        isSearching ? searchPath : listPath,
        query: isSearching
            ? {
                "q": searchKeyword,
              }
            : null,
      );
      return RestaurantListResponse.fromJson(response);
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<RestaurantDetailResponse> getDetailRestaurant(String? id) async {
    try {
      final response = await get("$detailPath/$id");
      return RestaurantDetailResponse.fromJson(response);
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<PostAReviewResponse> postAReview(dynamic body) async {
    try {
      final response = await post(reviewPath, body);
      return PostAReviewResponse.fromJson(response);
    } catch (e) {
      throw handleError(e);
    }
  }
}
