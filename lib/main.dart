import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:restaurant/constants/app_sizes.dart';
import 'package:restaurant/data/model/restaurant_arguments.dart';
import 'package:restaurant/pages/home/home_page.dart';
import 'package:restaurant/pages/main_tab/main_tab_page.dart';
import 'package:restaurant/pages/restaurant/restaurant_detail_page.dart';
import 'package:restaurant/pages/restaurant/restaurant_review_page.dart';
import 'package:restaurant/pages/search/search_page.dart';
import 'package:restaurant/pages/splash/splash_page.dart';
import 'package:restaurant/styles.dart';
import 'package:restaurant/utils/background_service.dart';
import 'package:restaurant/utils/notification_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper notificationHelper = NotificationHelper();
  final BackgroundService service = BackgroundService();
  service.initializeIsolate();
  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Restaurant',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: colorPrimary,
              onPrimary: colorOnPrimary,
              background: colorBgDark,
              onBackground: colorOnBg,
            ),
        inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
              fillColor: colorBGDarkSecondaryAccent,
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: colorBGDarkSecondaryAccent,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: colorBGDarkSecondaryAccent,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: colorPrimary,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: Sizes.p16,
                vertical: Sizes.p8,
              ),
            ),
        textTheme: myTextTheme,
        buttonTheme: ButtonThemeData(
          buttonColor: colorPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.p16),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: colorPrimary,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: colorBgDarkAccent,
          unselectedItemColor: Colors.white60,
        ),
      ),
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        MainTabPage.routeName: (context) => const MainTabPage(),
        HomePage.routeName: (context) => const HomePage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              arguments: ModalRoute.of(context)?.settings.arguments as RestaurantArguments?,
            ),
        SearchPage.routeName: (context) => const SearchPage(),
        RestaurantReviewPage.routeName: (context) =>
            const RestaurantReviewPage(),
      },
    );
  }
}
