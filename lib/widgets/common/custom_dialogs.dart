import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../constants/app_sizes.dart';
import '../../data/model/error_model.dart';
import '../../styles.dart';

showComingSoonDialog() {
  if (Platform.isIOS) {
    Get.dialog(
      CupertinoAlertDialog(
        title: const Text('Coming Soon!'),
        content: const Text('This feature will be coming soon!'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Ok'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      barrierDismissible: true,
    );
  } else {
    Get.dialog(
      AlertDialog(
        title: const Text('Coming Soon!'),
        content: const Text('This feature will be coming soon!'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
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

hideProgressDialog() {
  Get.close(1);
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

showSnackBar(String message) {
  if (Get.isSnackbarOpen) {
    Get.back();
  }
  Get.rawSnackbar(
    margin: const EdgeInsets.symmetric(horizontal: Sizes.p16),
    messageText: Text(
      message,
      style: Get.theme.textTheme.bodyLarge,
    ),
    // duration: const Duration(milliseconds: 1500),
    borderRadius: Sizes.p16,
  );
}
