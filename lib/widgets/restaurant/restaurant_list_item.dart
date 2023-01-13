import 'package:flutter/material.dart';
import 'package:restaurant/constants/app_sizes.dart';
import 'package:restaurant/model/restaurant_model.dart';
import 'package:restaurant/pages/restaurant/restaurant_detail_page.dart';
import 'package:restaurant/styles.dart';

class RestaurantListItem extends StatelessWidget {
  const RestaurantListItem({
    super.key,
    required this.item,
  });

  final Restaurant? item;

  @override
  Widget build(BuildContext context) {
    navigateToDetailPage() {
      Navigator.pushNamed(
        context,
        RestaurantDetailPage.routeName,
        arguments: item,
      );
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
              child: Hero(
                tag: item?.id ?? "",
                child: Image.network(
                  item?.pictureId ?? "",
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(Sizes.p12),
              child: Column(
                children: [
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
