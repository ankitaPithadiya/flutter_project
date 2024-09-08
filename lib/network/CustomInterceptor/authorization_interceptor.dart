import 'dart:convert';
import 'package:ananta/AppConfig/StringConstant.dart';
import 'package:dio/dio.dart';

import '../../ApiServices/api_endpoints.dart';
import '../../core/utils/pref_utils.dart';
import '../service/http_wrapper.dart';

class AuthInterceptor extends Interceptor {
  final _prefsLocator =
      "Bearer ${PrefUtils.getString(StringConstant.access_token)}";
  final ApiType apiType;

  AuthInterceptor(this.apiType);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // if (apiType == ApiType.WP) {
    //   options.headers['Authorization'] = _prefsLocator;
    // } else if (apiType == ApiType.LOCATION) {
    //   options.headers['x-api-key'] = ApiEndPoints.XAPI_KEY;
    // } else if (apiType == ApiType.ASTRO) {
    //   options.headers['x-api-key'] = ApiEndPoints.XAPI_KEY;
    // }
    options.headers['Content-type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    super.onRequest(options, handler);
  }
}
