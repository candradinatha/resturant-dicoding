import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/data/model/restaurant_model.dart';
import 'package:restaurant/pages/restaurant/restaurant_review_page.dart';
import 'package:restaurant/widgets/restaurant/dialog_post_a_review.dart';

import '../../widgets/common/custom_dialogs.dart';
import '../api/restaurant/restaurant_service.dart';
import 'package:http/http.dart' as http;

class RestaurantDetailController extends GetxController {
  final Restaurant? restaurant;
  final restaurantService = RestaurantService(client: http.Client());
  final restaurantResponse = RestaurantDetailResponse().obs;
  final formKey = GlobalKey<FormState>();

  RestaurantDetailController({required this.restaurant});

  getRestaurantDetail() async {
    showProgressDialog();
    await restaurantService.getDetailRestaurant(restaurant?.id).then((value) {
      restaurantResponse.value = value;
      hideProgressDialog();
    }, onError: (e) {
      hideProgressDialog();
      showAPIErrorDialog(e);
    });
  }

  postAReview({
    required String reviewer,
    required String review,
  }) async {
    showProgressDialog();
    await restaurantService.postAReview({
      "id": restaurant?.id,
      "name": reviewer,
      "review": review,
    }).then((value) {
      Get.back();
      Get.back();
      showSnackBar("Your review has been saved successfully");
      final updatedRestaurant = restaurantResponse.value;
      updatedRestaurant.restaurant?.customerReviews = value.customerReviews;
      restaurantResponse.value = updatedRestaurant;
      update();
    }, onError: (e) {
      Get.back();
      showAPIErrorDialog(e);
    });
  }

  showPostAReviewForm() {
    Get.dialog(
      DialogPostAReview(),
    );
  }

  navigateToRestaurantReview() {
    Get.toNamed(RestaurantReviewPage.routeName);
  }

  @override
  void onInit() {
    restaurantResponse.value.restaurant = restaurant;
    super.onInit();
  }

  @override
  void onReady() {
    getRestaurantDetail();
    super.onReady();
  }
}
