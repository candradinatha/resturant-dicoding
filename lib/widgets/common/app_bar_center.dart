import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/styles.dart';

class AppBarCenter extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCenter({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: colorBGDarkSecondaryAccent,
      title: Text(
        title,
        style: Get.theme.textTheme.headline6,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
