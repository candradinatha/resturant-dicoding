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




