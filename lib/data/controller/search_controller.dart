import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant/data/api/restaurant/restaurant_service.dart';
import 'package:restaurant/data/model/restaurant_model.dart';

import '../../utils/helper.dart';

class SearchController extends GetxController {
  final restaurantService = RestaurantService();
  final searchCtrl = TextEditingController();
  final restaurantResponse = RestaurantListResponse().obs;
  final isSearching = false.obs;
  final searchDebouncer = Debouncer(milliseconds: 500);

  getRestaurants(String searchKeyword) async {
    isSearching.value = true;
    await restaurantService
        .getRestaurants(
      isSearching: true,
      searchKeyword: searchKeyword,
    )
        .then((value) {
      restaurantResponse.value = value;
    }, onError: (e) {
      showAPIErrorDialog(e);
    }).whenComplete(() {
      isSearching.value = false;
    });
  }

  searchRestaurants(String searchKeyword) {
    searchDebouncer.run(() {
      if (searchKeyword.isEmpty) {
        restaurantResponse.value = RestaurantListResponse();
      } else {
        getRestaurants(searchKeyword);
      }
    });
  }

  clearSearchInput(BuildContext context) {
    searchCtrl.clear();
    restaurantResponse.value = RestaurantListResponse();
    FocusScope.of(context).unfocus();
  }

  @override
  void onInit() {
    searchCtrl.addListener(() {
      update();
    });
    super.onInit();
  }

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }
}
