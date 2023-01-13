import 'dart:io';

import 'package:flutter/material.dart';

import '../../constants/app_sizes.dart';
import '../../styles.dart';

class RoundedBackButton extends StatelessWidget {
  const RoundedBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    getBack() {
      Navigator.pop(context);
    }

    return SafeArea(
      child: GestureDetector(
        onTap: getBack,
        child: Card(
          margin: const EdgeInsets.all(Sizes.p16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.p20),
          ),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(Sizes.p8),
            child: Icon(
              Platform.isIOS
                  ? Icons.arrow_back_ios_new_rounded
                  : Icons.arrow_back_rounded,
              color: colorPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
