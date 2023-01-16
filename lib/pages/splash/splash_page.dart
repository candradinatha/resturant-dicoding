import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/constants/app_sizes.dart';
import 'package:restaurant/pages/home/home_page.dart';
import 'package:restaurant/styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const routeName = "/";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _logoWidth = 0;
  double _logoHeight = 0;
  bool _isFontVisible = false;
  bool _isSplashLogoVisible = true;

  _navigateToHomePage() {
    Get.offAllNamed(
      HomePage.routeName,
    );
  }

  _updateLogoSize() {
    setState(() {
      _logoHeight = 150;
      _logoWidth = 150;
    });
  }

  _hideSplashLogo() {
    setState(() {
      _isSplashLogoVisible = false;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _updateLogoSize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBgDark,
      body: SizedBox(
        width: double.infinity,
        child: AnimatedOpacity(
          opacity: _isSplashLogoVisible ? 1.0 : 0.0,
          duration: const Duration(
            milliseconds: 1500,
          ),
          onEnd: () {
            _navigateToHomePage();
          },
          curve: Curves.easeInExpo,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                width: _logoWidth,
                height: _logoHeight,
                duration: const Duration(
                  milliseconds: 1500,
                ),
                curve: Curves.fastOutSlowIn,
                child: Image.asset(
                  "assets/images/img_app.png",
                  fit: BoxFit.fitWidth,
                ),
                onEnd: () {
                  setState(() {
                    _isFontVisible = true;
                  });
                },
              ),
              AppGaps.h8,
              AnimatedOpacity(
                opacity: _isFontVisible ? 1.0 : 0.0,
                duration: const Duration(
                  milliseconds: 500,
                ),
                child: AnimatedContainer(
                  width: 160,
                  duration: const Duration(
                    milliseconds: 1500,
                  ),
                  curve: Curves.fastOutSlowIn,
                  child: Image.asset(
                    "assets/images/img_app_font.png",
                  ),
                ),
                onEnd: () {
                  _hideSplashLogo();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
