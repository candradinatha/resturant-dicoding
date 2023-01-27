import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/constants/app_sizes.dart';
import 'package:restaurant/data/controller/settings_controller.dart';
import 'package:restaurant/widgets/common/app_bar_center.dart';

import '../../styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SettingsController(),
      builder: (controller) => Scaffold(
        appBar: const AppBarCenter(
          title: "Settings",
        ),
        backgroundColor: colorBgDark,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(Sizes.p16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Reminder at 11 PM",
                  style: Get.theme.textTheme.titleLarge,
                ),
                Obx(
                  () => Switch.adaptive(
                    value: controller.isReminderActive.value,
                    onChanged: controller.setReminder,
                    activeColor: colorPrimary,
                    inactiveTrackColor: colorDivider,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
