import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/data/controller/main_tab_controller.dart';

class MainTabPage extends StatelessWidget {
  const MainTabPage({super.key});

  static const routeName = "/main_tab";

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MainTabController(),
      builder: (controller) {
        return Obx(
          () => Scaffold(
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.pages,
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: controller.onItemTapped,
              currentIndex: controller.currentIndex.value,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.restaurant_menu,
                  ),
                  label: "Restaurants",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  label: "Favorites",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: "Settings",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
