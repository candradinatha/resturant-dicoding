import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/constants/app_sizes.dart';
import 'package:restaurant/constants/strings.dart';
import 'package:restaurant/data/model/error_model.dart';
import 'dart:math' as math;


import '../styles.dart';

getImageUrl({
  required String? pictureId,
  required String imageSize,
}) {
  return "${Config.baseUrl}/images/$imageSize/$pictureId";
}

showErrorBottomSheet(String? message) {
  Get.bottomSheet(
    Material(
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
          color: colorBgDarkAccent,
        ),
        child: SafeArea(
          top: false,
          child: Container(
            padding: EdgeInsets.only(
              top: Sizes.p16,
              left: Sizes.p16,
              right: Sizes.p16,
              bottom: window.viewPadding.bottom > 0.0 ? 0.0 : Sizes.p16,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              color: colorBgDarkAccent,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Lottie.asset(
                  "assets/data/gif_warning_primary.json",
                  width: 120,
                  height: 120,
                  fit: BoxFit.fill,
                ),
                Text(
                  message ?? "Oops, something went wrong",
                  textAlign: TextAlign.center,
                  style: Get.theme.textTheme.headline5,
                ),
                AppGaps.h16,
              ],
            ),
          ),
        ),
      ),
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25),
      ),
    ),
    isScrollControlled: true,
  );
}

showAPIErrorDialog(dynamic e) {
  if (e is ErrorResponse) {
    showErrorBottomSheet(e.message ?? '');
  } else {
    showErrorBottomSheet("Oops, something went wrong");
  }
}

showProgressDialog() {
  Get.dialog(
    Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          "assets/data/gif_loading.json",
          width: 180,
          height: 180,
          // fit: BoxFit.fill,
        ),
      ],
    ),
    barrierDismissible: false,
  );
}

Color getRandomColor() {
  return Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}

String getShortenedName(String? name) {
  if (name!=null && name != "") {
    return name[0];
  }
  return "";
}

class Debouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

showSnackBar(String message) {
  Get.rawSnackbar(
    margin: const EdgeInsets.symmetric(horizontal: Sizes.p16),
    messageText: Text(
      message,
      style: Get.theme.textTheme.bodyLarge,
    ),
    borderRadius: Sizes.p16,
  );
}


