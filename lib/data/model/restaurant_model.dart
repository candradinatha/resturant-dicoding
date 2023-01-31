// To parse this JSON data, do
//
//     final restaurantListResponse = restaurantListResponseFromJson(jsonString);

import 'dart:convert';

RestaurantListResponse? restaurantListResponseFromJson(String str) =>
    RestaurantListResponse.fromJson(json.decode(str));

String restaurantListResponseToJson(RestaurantListResponse? data) =>
    json.encode(data!.toJson());

class RestaurantListResponse {
  RestaurantListResponse({
    this.error,
    this.message,
    this.count,
    this.founded,
    this.restaurants,
  });

  bool? error;
  String? message;
  int? count;
  int? founded;
  List<Restaurant?>? restaurants;

  factory RestaurantListResponse.fromJson(Map<String, dynamic> json) =>
      RestaurantListResponse(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        founded: json["founded"],
        restaurants: json["restaurants"] == null
            ? []
            : json["restaurants"] == null
                ? []
                : List<Restaurant?>.from(
                    json["restaurants"]!.map(
                      (x) => Restaurant.fromJson(x),
                    ),
                  ),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "count": count,
        "founded": founded,
        "restaurants": restaurants == null
            ? []
            : restaurants == null
                ? []
                : List<dynamic>.from(
                    restaurants!.map(
                      (x) => x!.toJson(),
                    ),
                  ),
      };
}

RestaurantDetailResponse? restaurantDetailResponseFromJson(String str) =>
    RestaurantDetailResponse.fromJson(json.decode(str));

String restaurantDetailResponseToJson(RestaurantDetailResponse? data) =>
    json.encode(data!.toJson());

class RestaurantDetailResponse {
  RestaurantDetailResponse({
    this.error,
    this.message,
    this.restaurant,
  });

  bool? error;
  String? message;
  Restaurant? restaurant;

  factory RestaurantDetailResponse.fromJson(Map<String, dynamic> json) =>
      RestaurantDetailResponse(
        error: json["error"],
        message: json["message"],
        restaurant: json["restaurant"] == null
            ? null
            : Restaurant.fromJson(json["restaurant"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "restaurant": restaurant?.toJson(),
      };
}

class Restaurant {
  Restaurant({
    this.id,
    this.name,
    this.description,
    this.city,
    this.address,
    this.pictureId,
    this.rating,
    this.categories,
    this.menus,
    this.customerReviews,
  });

  String? id;
  String? name;
  String? description;
  String? city;
  String? address;
  String? pictureId;
  double? rating;
  List<Category?>? categories;
  Menus? menus;
  List<CustomerReview?>? customerReviews;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        rating: json["rating"].toDouble(),
        categories: json["categories"] == null
            ? []
            : json["categories"] == null
                ? []
                : List<Category?>.from(
                    json["categories"]!.map(
                      (x) => Category.fromJson(x),
                    ),
                  ),
        menus: json["menus"] == null ? null : Menus.fromJson(json["menus"]),
        customerReviews: json["customerReviews"] == null
            ? []
            : json["customerReviews"] == null
                ? []
                : List<CustomerReview?>.from(
                    json["customerReviews"]!.map(
                      (x) => CustomerReview.fromJson(x),
                    ),
                  ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "city": city,
        "address": address,
        "pictureId": pictureId,
        "rating": rating,
        "categories": categories == null
            ? []
            : categories == null
                ? []
                : List<dynamic>.from(
                    categories!.map(
                      (x) => x!.toJson(),
                    ),
                  ),
        "menus": menus?.toJson(),
        "customerReviews": customerReviews == null
            ? []
            : customerReviews == null
                ? []
                : List<dynamic>.from(
                    customerReviews!.map(
                      (x) => x!.toJson(),
                    ),
                  ),
      };
}

class Category {
  Category({
    this.name,
  });

  String? name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class CustomerReview {
  CustomerReview({
    this.name,
    this.review,
    this.date,
  });

  String? name;
  String? review;
  String? date;

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
        name: json["name"],
        review: json["review"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "review": review,
        "date": date,
      };
}

class Menus {
  Menus({
    this.foods,
    this.drinks,
  });

  List<Category?>? foods;
  List<Category?>? drinks;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: json["foods"] == null
            ? []
            : json["foods"] == null
                ? []
                : List<Category?>.from(
                    json["foods"]!.map(
                      (x) => Category.fromJson(x),
                    ),
                  ),
        drinks: json["drinks"] == null
            ? []
            : json["drinks"] == null
                ? []
                : List<Category?>.from(
                    json["drinks"]!.map(
                      (x) => Category.fromJson(x),
                    ),
                  ),
      );

  Map<String, dynamic> toJson() => {
        "foods": foods == null
            ? []
            : foods == null
                ? []
                : List<dynamic>.from(
                    foods!.map(
                      (x) => x!.toJson(),
                    ),
                  ),
        "drinks": drinks == null
            ? []
            : drinks == null
                ? []
                : List<dynamic>.from(
                    drinks!.map(
                      (x) => x!.toJson(),
                    ),
                  ),
      };
}

PostAReviewResponse? postAReviewResponseFromJson(String str) =>
    PostAReviewResponse.fromJson(json.decode(str));

String postAReviewResponseToJson(PostAReviewResponse? data) =>
    json.encode(data!.toJson());

class PostAReviewResponse {
  PostAReviewResponse({
    this.error,
    this.message,
    this.customerReviews,
  });

  bool? error;
  String? message;
  List<CustomerReview?>? customerReviews;

  factory PostAReviewResponse.fromJson(Map<String, dynamic> json) =>
      PostAReviewResponse(
        error: json["error"],
        message: json["message"],
        customerReviews: json["customerReviews"] == null
            ? []
            : json["customerReviews"] == null
                ? []
                : List<CustomerReview?>.from(
                    json["customerReviews"]!.map(
                      (x) => CustomerReview.fromJson(x),
                    ),
                  ),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "customerReviews": customerReviews == null
            ? []
            : customerReviews == null
                ? []
                : List<dynamic>.from(
                    customerReviews!.map(
                      (x) => x!.toJson(),
                    ),
                  ),
      };
}



final restaurantListMock = {
  "error": false,
  "message": "success",
  "count": 20,
  "restaurants": [
    {
      "id": "rqdv5juczeskfw1e867",
      "name": "Melting Pot",
      "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.",
      "pictureId": "14",
      "city": "Medan",
      "rating": 4.2
    }
  ]
};
