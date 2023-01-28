import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:get/get.dart';
import 'package:restaurant/utils/background_service.dart';
import 'package:restaurant/utils/date_time_helper.dart';
import 'package:restaurant/utils/preferences_helper.dart';
import 'package:restaurant/widgets/common/custom_dialogs.dart';

class SettingsController extends GetxController {
  final isReminderActive = false.obs;

  setReminder(bool isActive) async {
    if (Platform.isIOS) {
      showComingSoonDialog();
    } else {
      if (isActive) {
        await AndroidAlarmManager.periodic(
          const Duration(hours: 24),
          1,
          BackgroundService.callback,
          startAt: DateTimeHelper.format(),
          exact: true,
          wakeup: true,
        );
      } else {
        await AndroidAlarmManager.cancel(1);
      }
      isReminderActive.value = isActive;
      PreferencesHelper().setBool(PreferencesKey.reminderStatus, isActive);
    }
  }

  getReminder() async {
    final isActive =
        await PreferencesHelper().getBool(PreferencesKey.reminderStatus);
    isReminderActive.value = isActive;
  }

  @override
  void onInit() {
    getReminder();
    super.onInit();
  }
}
