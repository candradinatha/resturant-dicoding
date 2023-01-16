import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/constants/app_sizes.dart';
import 'package:restaurant/data/model/restaurant_model.dart';
import 'package:restaurant/styles.dart';

import '../../utils/helper.dart';

class CustomerReviewItem extends StatelessWidget {
  const CustomerReviewItem({
    super.key,
    required this.item,
  });

  final CustomerReview? item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Sizes.p16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: getRandomColor(),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    getShortenedName(item?.name),
                    style: Get.theme.textTheme.headline6,
                  ),
                ),
              ),
              AppGaps.w16,
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        item?.name ?? "",
                      ),
                    ),
                    AppGaps.h8,
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        item?.date ?? "",
                        style: Get.theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          AppGaps.h16,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(Sizes.p16),
            decoration: const BoxDecoration(
              color: colorBgDarkAccent,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Sizes.p16),
                bottomRight: Radius.circular(Sizes.p16),
                bottomLeft: Radius.circular(Sizes.p16),
              ),
            ),
            child: Text(
              item?.review ?? "",
            ),
          ),
        ],
      ),
    );
  }
}
