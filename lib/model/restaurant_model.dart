// To parse this JSON data, do
//
//     final restaurantListResponse = restaurantListResponseFromJson(jsonString);

import 'dart:convert';

RestaurantListResponse? restaurantListResponseFromJson(String str) => RestaurantListResponse.fromJson(json.decode(str));

String restaurantListResponseToJson(RestaurantListResponse? data) => json.encode(data!.toJson());

class RestaurantListResponse {
  RestaurantListResponse({
    this.restaurants,
  });

  List<Restaurant?>? restaurants;

  factory RestaurantListResponse.fromJson(Map<String, dynamic> json) => RestaurantListResponse(
    restaurants: json["restaurants"] == null ? [] : json["restaurants"] == null ? [] : List<Restaurant?>.from(json["restaurants"]!.map((x) => Restaurant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "restaurants": restaurants == null ? [] : restaurants == null ? [] : List<dynamic>.from(restaurants!.map((x) => x!.toJson())),
  };
}

class Restaurant {
  Restaurant({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.menus,
  });

  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;
  Menus? menus;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    pictureId: json["pictureId"],
    city: json["city"],
    rating: json["rating"].toDouble(),
    menus: json["menus"] == null ? null : Menus.fromJson(json["menus"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "pictureId": pictureId,
    "city": city,
    "rating": rating,
    "menus": menus?.toJson(),
  };
}

class Menus {
  Menus({
    this.foods,
    this.drinks,
  });

  List<FoodOrDrink?>? foods;
  List<FoodOrDrink?>? drinks;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
    foods: json["foods"] == null ? [] : json["foods"] == null ? [] : List<FoodOrDrink?>.from(json["foods"]!.map((x) => FoodOrDrink.fromJson(x))),
    drinks: json["drinks"] == null ? [] : json["drinks"] == null ? [] : List<FoodOrDrink?>.from(json["drinks"]!.map((x) => FoodOrDrink.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "foods": foods == null ? [] : foods == null ? [] : List<dynamic>.from(foods!.map((x) => x!.toJson())),
    "drinks": drinks == null ? [] : drinks == null ? [] : List<dynamic>.from(drinks!.map((x) => x!.toJson())),
  };
}

class FoodOrDrink {
  FoodOrDrink({
    this.name,
  });

  String? name;

  factory FoodOrDrink.fromJson(Map<String, dynamic> json) => FoodOrDrink(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
