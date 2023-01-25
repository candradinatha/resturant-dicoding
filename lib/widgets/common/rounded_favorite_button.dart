import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_sizes.dart';
import '../../styles.dart';

class RoundedFavoriteButton extends StatelessWidget {
  const RoundedFavoriteButton({
    super.key,
    required this.onFavoriteTap,
    required this.isFavorite,
  });

  final Function() onFavoriteTap;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFavoriteTap,
      child: Card(
        margin: const EdgeInsets.all(Sizes.p16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.p20),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p8),
          child: Icon(
            isFavorite == true ? Icons.favorite : Icons.favorite_border,
            color: isFavorite == true ? Colors.red : colorDivider,
          ),
        ),
      ),
    );
  }
}
