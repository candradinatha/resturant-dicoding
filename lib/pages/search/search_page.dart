import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/data/controller/search_controller.dart';
import 'package:restaurant/widgets/search/search_result.dart';
import 'package:restaurant/styles.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static const routeName = "/search_restaurant";

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SearchController(),
      builder: (controller) => Scaffold(
        backgroundColor: colorBgDark,
        appBar: AppBar(
          backgroundColor: colorBgDarkAccent,
          centerTitle: true,
          title: Hero(
            tag: "homeSearch",
            child: SizedBox(
              height: 40,
              child: Material(
                color: Colors.transparent,
                child: Obx(
                  () => TextFormField(
                    controller: controller.searchCtrl,
                    onChanged: (value) => controller.searchRestaurants(value),
                    autocorrect: false,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Search restaurant...",
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      suffixIcon: controller.isSearching.isTrue
                          ? const CupertinoActivityIndicator(
                              color: colorPrimary,
                            )
                          : controller.searchCtrl.value.text.isNotEmpty
                              ? GestureDetector(
                                  onTap: () =>
                                      controller.clearSearchInput(context),
                                  child: const Icon(
                                    Icons.highlight_remove,
                                    color: colorPrimary,
                                  ),
                                )
                              : null,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SearchResult(
          controller: controller,
        ),
      ),
    );
  }
}
