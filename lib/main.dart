import 'package:flutter/material.dart';
import 'package:restaurant/constants/app_sizes.dart';
import 'package:restaurant/model/restaurant_model.dart';
import 'package:restaurant/pages/home/home_page.dart';
import 'package:restaurant/pages/restaurant/restaurant_detail_page.dart';
import 'package:restaurant/pages/splash/splash_page.dart';
import 'package:restaurant/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      ),
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        HomePage.routeName: (context) => const HomePage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              item: ModalRoute.of(context)?.settings.arguments as Restaurant?,
            ),
      },
    );
  }
}