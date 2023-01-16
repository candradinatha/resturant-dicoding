// To parse this JSON data, do
//
//     final errorResponse = errorResponseFromJson(jsonString);

import 'dart:convert';

ErrorResponse errorResponseFromJson(String str) => ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse? data) => json.encode(data!.toJson());

class ErrorResponse {
  ErrorResponse({
    this.error,
    this.message,
  });

  bool? error;
  String? message;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
    error: json["error"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
  };
}
