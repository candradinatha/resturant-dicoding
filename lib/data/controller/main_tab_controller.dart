import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/pages/favorite/favorite_page.dart';
import 'package:restaurant/pages/home/home_page.dart';
import 'package:restaurant/pages/settings/settings_page.dart';

import '../../pages/restaurant/restaurant_detail_page.dart';
import '../../utils/notification_helper.dart';

class MainTabController extends GetxController {
  final currentIndex = 0.obs;
  final NotificationHelper _notificationHelper = NotificationHelper();
  final List<Widget> pages = [
    const HomePage(),
    const FavoritePage(),
    const SettingsPage(),
  ];

  onItemTapped(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    _notificationHelper.configureSelectNotificationSubject(
        RestaurantDetailPage.routeName);
    super.onInit();
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }
}