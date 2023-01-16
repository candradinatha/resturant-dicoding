import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:restaurant/data/api/restaurant/restaurant_service.dart';
import 'package:restaurant/data/model/restaurant_model.dart';
import 'package:restaurant/pages/search/search_page.dart';
import 'package:restaurant/utils/helper.dart';

class HomeController extends GetxController {
  final restaurantService = RestaurantService();
  final refreshController = RefreshController();
  final isShimmering = false.obs;
  final restaurantResponse = RestaurantListResponse().obs;

  getRestaurants() async {
    if (restaurantResponse.value.restaurants == null) {
      isShimmering.value = true;
    }
    await restaurantService.getRestaurants().then((value) {
      restaurantResponse.value = value;
    }, onError: (e) {
      showAPIErrorDialog(e);
    }).whenComplete(() {
      refreshController.refreshCompleted();
      isShimmering.value = false;
    });
  }

  navigateToSearchPage() {
    Get.to(
      () => const SearchPage(),
      transition: Transition.downToUp,
    );
  }

  @override
  void onInit() {
    getRestaurants();
    super.onInit();
  }
}
