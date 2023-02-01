import 'dart:convert';
import 'dart:io';

import 'package:restaurant/constants/strings.dart';
import 'package:http/http.dart' as http;

import '../../model/error_model.dart';

class BaseService {
  final String baseUrl;
  final http.Client client;

  BaseService({
    required this.client,
    this.baseUrl = Config.baseUrl,
  });

  Future<dynamic> post(
    String path,
    dynamic body,
  ) async {
    try {
      final response = await client.post(
        Uri.parse(baseUrl + path),
        body: jsonEncode(body),
        headers: {
          "Content-Type": "application/json",
        },
      );
      return _returnResponseOrThrow(response);
    } on SocketException {
      throw ErrorResponse(message: 'No Internet connection');
    }
  }

  Future<dynamic> get(
    String path, {
    dynamic query,
  }) async {
    try {
      final response = await client.get(
        Uri.parse(baseUrl + path).replace(queryParameters: query),
        headers: {
          "Content-Type": "application/json",
        },
      );
      return _returnResponseOrThrow(response);
    } on SocketException {
      throw ErrorResponse(message: 'No Internet connection');
    }
  }

  dynamic _returnResponseOrThrow(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body.toString());
    } else if (response.statusCode == 400 ||
        response.statusCode == 401 ||
        response.statusCode == 403) {
      throw errorResponseFromJson(response.body.toString());
    } else if (response.statusCode == 500) {
      throw ErrorResponse(
        message: "Server Error",
      );
    } else {
      throw ErrorResponse(
        message: "Error occurred with status code ${response.statusCode}",
      );
    }
  }

  ErrorResponse handleError(Object response) {
    if (response is ErrorResponse) {
      return response;
    } else {
      return ErrorResponse(message: response.toString());
    }
  }
}
