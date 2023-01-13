import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/constants/app_sizes.dart';
import 'package:restaurant/model/restaurant_model.dart';
import 'package:restaurant/styles.dart';
import 'package:restaurant/widgets/restaurant/restaurant_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchCtrl = TextEditingController();
  List<Restaurant?>? restaurants = [];

  _getRestaurantList() async {
    try {
      final jsonString = await DefaultAssetBundle.of(context)
          .loadString('assets/data/local_restaurant.json');
      final response = RestaurantListResponse.fromJson(jsonDecode(jsonString));
      setState(() {
        restaurants = response.restaurants;
      });
    } catch (e) {
      log(e.toString());
    }
  }

  _clearSearchInput() {
    searchCtrl.clear();
    FocusScope.of(context).unfocus();
  }

  List<Restaurant?>? _getFilteredRestaurants() {
    return restaurants?.where((element) {
      return (element?.name?.toLowerCase() ?? "")
              .contains(searchCtrl.text.toLowerCase()) ||
          (element?.city?.toLowerCase() ?? "")
              .contains(searchCtrl.text.toLowerCase());
    }).toList();
  }

  _preloading() {
    searchCtrl.addListener(() {
      setState(() {});
    });
    _getRestaurantList();
  }

  @override
  void initState() {
    _preloading();
    super.initState();
  }

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBgDark,
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.25,
              backgroundColor: colorBgDarkAccent,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/images/img_home_header.jpeg",
                  fit: BoxFit.cover,
                ),
                title: SafeArea(
                  child: TextFormField(
                    controller: searchCtrl,
                    decoration: InputDecoration(
                      hintText: "Search restaurant...",
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      suffixIcon: searchCtrl.value.text.isNotEmpty
                          ? GestureDetector(
                              onTap: _clearSearchInput,
                              child: const Icon(
                                Icons.highlight_remove,
                                color: colorPrimary,
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
                titlePadding: const EdgeInsets.symmetric(
                  horizontal: Sizes.p16,
                  vertical: Sizes.p8,
                ),
                expandedTitleScale: 1,
              ),
            ),
          ];
        },
        body: _getFilteredRestaurants()?.length == 0
            ? Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(
                        "assets/data/gif_empty_data.json",
                        height: 220,
                      ),
                      Text(
                        'No result for "${searchCtrl.value.text}"',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                    ],
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.p16,
                    horizontal: Sizes.p8,
                  ),
                  child: StaggeredGrid.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: Sizes.p8,
                    mainAxisSpacing: Sizes.p8,
                    children: List.generate(
                      _getFilteredRestaurants()?.length ?? 0,
                      (index) {
                        return RestaurantListItem(
                          item: _getFilteredRestaurants()?[index],
                        );
                      },
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
