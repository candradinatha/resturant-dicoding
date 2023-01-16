import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../styles.dart';

class ShimmerBar extends StatelessWidget {
  final double? height;
  final double? width;
  final double borderRadius;

  const ShimmerBar({
    Key? key,
    this.height,
    this.width,
    this.borderRadius = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: colorDivider,
      highlightColor: Colors.white70,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
        child: Container(
          color: colorDivider,
          width: width ?? double.infinity,
          height: height ?? 14,
        ),
      ),
    );
  }
}
