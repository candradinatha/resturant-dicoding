import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/pages/favorite/favorite_page.dart';
import 'package:restaurant/pages/home/home_page.dart';
import 'package:restaurant/pages/settings/settings_page.dart';

class MainTabController extends GetxController {
  final currentIndex = 0.obs;
  final List<Widget> pages = [
    const HomePage(),
    const FavoritePage(),
    const SettingsPage(),
  ];

  onItemTapped(int index) {
    currentIndex.value = index;
  }
}