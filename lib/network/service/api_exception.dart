import 'package:ananta/core/app_export.dart';
import 'package:dio/dio.dart';
import 'http_wrapper.dart';

class ApiException implements Exception {
  ApiException.fromDioError(DioException dioError, ApiType apiType) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        switch (apiType) {
          case ApiType.ASTRO:
            message = dioError.response?.data.join(" ").toString() ?? "";
            break;
          case ApiType.LOCATION:
            message = dioError.response?.data;
            break;
          case ApiType.WP:
            message = dioError.response?.data['msg'];
            break;
          default:
            message = dioError.response?.data;
            break;
        }
        //Managed InValid Token
        if (dioError.response?.statusCode == 401) {
          PrefUtils.clear();
        }
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.unknown:
        if (dioError.message!.contains("SocketException")) {
          message = 'No Internet';
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  late String message;

  @override
  String toString() => message;
}
