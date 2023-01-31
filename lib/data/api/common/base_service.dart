import 'package:dio/dio.dart';
import 'package:restaurant/constants/strings.dart';
import 'package:restaurant/data/model/error_model.dart';

class BaseService {
  final String baseUrl;
  final Dio _dio = Dio();

  BaseService({
    this.baseUrl = Config.baseUrl,
  }) {
    _dio.options = BaseOptions(
      baseUrl: Config.baseUrl,
      receiveDataWhenStatusError: true,
    );
    _dio.interceptors.clear();
    _dio.interceptors.addAll([
      LogInterceptor(
        request: true,
        responseBody: true,
        requestHeader: true,
      )
    ]);
  }

  Future<dynamic> post<T>(
    String path,
    dynamic body,
  ) async {
    final response = await _dio.post(
      path,
      data: body,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return response.data;
  }

  Future<dynamic> get<T>(
    String path, {
    dynamic query,
  }) async {
    final response = await _dio.get(
      path,
      queryParameters: query ?? {},
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return response.data;
  }

  ErrorResponse handleError(DioError e) {
    if (e.type == DioErrorType.response) {
      try {
        return errorResponseFromJson(e.response.toString());
      } catch (_) {
        try {
          return errorResponseFromJson(e.response.toString());
        } catch (_) {
          return errorResponseFromJson(e.response.toString());
        }
      }
    } else if (e.type == DioErrorType.connectTimeout) {
      return ErrorResponse(
        message: "Please check your internet connection",
      );
    } else if (e.type == DioErrorType.receiveTimeout) {
      return ErrorResponse(
        message: "Server error, please try again",
      );
    } else {
      try {
        return errorResponseFromJson(e.response.toString());
      } catch (_) {
        return ErrorResponse(
          message: "An error occurred",
        );
      }
    }
  }
}
