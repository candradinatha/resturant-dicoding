import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/constants/app_sizes.dart';
import 'package:restaurant/data/model/restaurant_model.dart';
import 'package:restaurant/pages/restaurant/restaurant_review_page.dart';
import 'package:restaurant/styles.dart';
import 'package:restaurant/utils/helper.dart';
import 'package:restaurant/widgets/common/custom_text_field.dart';
import 'package:restaurant/widgets/common/primary_button.dart';

import '../api/restaurant/restaurant_service.dart';

class RestaurantDetailController extends GetxController {
  final Restaurant? restaurant;
  final restaurantService = RestaurantService();
  final restaurantResponse = RestaurantDetailResponse().obs;
  final formKey = GlobalKey<FormState>();

  RestaurantDetailController({required this.restaurant});

  getRestaurantDetail() async {
    showProgressDialog();
    await restaurantService.getDetailRestaurant(restaurant?.id).then((value) {
      restaurantResponse.value = value;
      Get.back();
    }, onError: (e) {
      Get.back();
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
    final reviewerCtrl = TextEditingController();
    final reviewCtrl = TextEditingController();

    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.p24),
            color: colorBgDarkAccent,
          ),
          padding: const EdgeInsets.all(Sizes.p24),
          clipBehavior: Clip.hardEdge,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Create a review",
                  style: Get.theme.textTheme.headline6,
                ),
                AppGaps.h24,
                CustomTextForm(
                  controller: reviewerCtrl,
                  hint: "Reviewer Name",
                  isRequired: true,
                ),
                AppGaps.h16,
                CustomTextForm(
                  controller: reviewCtrl,
                  hint: "Review",
                  isRequired: true,
                  textInputType: TextInputType.multiline,
                ),
                AppGaps.h24,
                PrimaryButton(
                  title: "Submit",
                  onTap: () {
                    if (formKey.currentState?.validate() == true) {
                      postAReview(
                        reviewer: reviewerCtrl.value.text,
                        review: reviewCtrl.value.text,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
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
