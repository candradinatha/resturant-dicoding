import 'package:get/get.dart';
import 'package:restaurant/data/database/database_helper.dart';
import 'package:restaurant/data/model/restaurant_model.dart';
import 'package:restaurant/utils/helper.dart';

class DatabaseController extends GetxController {
  final DatabaseHelper databaseHelper;

  DatabaseController({
    required this.databaseHelper,
  });

  final restaurantFavorites = <Restaurant>[].obs;

  getFavorites() async {
    restaurantFavorites.value = await databaseHelper.getFavorites();
  }

  addOrRemoveFavorite(Restaurant? restaurant) async {
    final favoriteData = await getFavoriteById(restaurant?.id);
    if (favoriteData == null) {
      addToFavorites(restaurant);
    } else {
      removeFromFavorites(restaurant);
    }
  }

  addToFavorites(Restaurant? restaurant) async {
    if (restaurant != null) {
      try {
        await databaseHelper.addToFavorite(restaurant);
        showSnackBar("Added to favorite");
        getFavorites();
      } catch (e) {
        showSnackBar(e.toString());
      }
    }
  }

  removeFromFavorites(Restaurant? restaurant) async {
    if (restaurant != null) {
      try {
        await databaseHelper.removeFromFavorite(restaurant);
        showSnackBar("Removed from favorite");
        getFavorites();
      } catch(e) {
        showSnackBar(e.toString());
      }
    }
  }

  Future<Restaurant?> getFavoriteById(String? id) async {
    return await databaseHelper.getFavoriteById(id);
  }

  @override
  void onInit() {
    getFavorites();
    super.onInit();
  }
}
