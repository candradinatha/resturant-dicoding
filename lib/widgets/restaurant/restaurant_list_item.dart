import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/constants/app_sizes.dart';
import 'package:restaurant/constants/strings.dart';
import 'package:restaurant/pages/restaurant/restaurant_detail_page.dart';
import 'package:restaurant/styles.dart';
import 'package:restaurant/utils/helper.dart';
import 'package:restaurant/widgets/common/shimmer_bar.dart';

import '../../data/model/restaurant_model.dart';

class RestaurantListItem extends StatelessWidget {
  const RestaurantListItem({
    super.key,
    required this.item,
    this.isShimmering = false,
  });

  final Restaurant? item;
  final bool isShimmering;

  @override
  Widget build(BuildContext context) {
    navigateToDetailPage() {
      if (isShimmering == false) {
        Get.toNamed(
          RestaurantDetailPage.routeName,
          arguments: item,
        );
      }
    }

    return GestureDetector(
      onTap: navigateToDetailPage,
      child: Card(
        color: colorBgDarkAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.p16),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(Sizes.p16),
              ),
              child: isShimmering
                  ? const ShimmerBar(
                      borderRadius: 0,
                      height: 150,
                    )
                  : Hero(
                      tag: item?.id ?? "",
                      child: Image.network(
                        getImageUrl(
                          pictureId: item?.pictureId,
                          imageSize: ImageSize.medium,
                        ),
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            Container(
              margin: const EdgeInsets.all(Sizes.p12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isShimmering) ...[
                    const ShimmerBar(
                      width: 120,
                    ),
                    AppGaps.h8,
                    const ShimmerBar(),
                    AppGaps.h8,
                    const ShimmerBar(
                      width: 100,
                    ),
                  ] else ...[
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        item?.name ?? "",
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: colorPrimary,
                            ),
                      ),
                    ),
                    AppGaps.h8,
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        item?.city ?? "",
                        style: Theme.of(context).textTheme.headline6,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    AppGaps.h8,
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        item?.description ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    AppGaps.h8,
                    SizedBox(
                      width: double.infinity,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const WidgetSpan(
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: Sizes.p16,
                              ),
                            ),
                            TextSpan(
                              text: " ${item?.rating}",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
