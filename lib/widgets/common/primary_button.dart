import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/constants/app_sizes.dart';

import '../../styles.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final double? width;
  final bool isLoading;

  const PrimaryButton({
    super.key,
    required this.title,
    required this.onTap,
    this.width,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: colorPrimary,
      minWidth: width ?? MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.p32,
        vertical: Sizes.p16,
      ),
      child: isLoading == false
          ? Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Get.theme.textTheme.headline6?.copyWith(
                fontSize: Sizes.p16,
              ),
            )
          : const SizedBox(
              height: Sizes.p20,
              width: Sizes.p20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.white,
                ),
              ),
            ),
      onPressed: () {
        if (isLoading == false) {
          onTap();
        }
      },
    );
  }
}
