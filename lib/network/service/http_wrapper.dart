// ignore_for_file: constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:ananta/AppConfig/StringConstant.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import '../../ApiServices/api_endpoints.dart';
import '../../AppUtils/ui_utils.dart';
import '../../core/utils/pref_utils.dart';
import '../CustomInterceptor/authorization_interceptor.dart';
import '../network_contants.dart';
import 'api_exception.dart';
import 'data_response.dart';

enum BodyType { RAW, FORMDATA }

enum ApiType { WP, ASTRO, LOCATION, RECONNECTINTERNET }

enum SetInCache { FALSE, SERVER, MANUAL }

class DioWrapper {
  ApiType apiType;
  Dio _dio = Dio();
  var optionsCache;

  DioWrapper({required this.apiType}) {
    final options = BaseOptions(
        baseUrl: ApiEndPoints.baseUrl,
        connectTimeout: BaseConstant.connectionTimeout,
        receiveTimeout: BaseConstant.receiveTimeout,
        responseType: ResponseType.json,
        contentType: ContentType.json.toString());

    optionsCache = CacheOptions(
      store: HiveCacheStore(PrefUtils.getString(StringConstant.tempDir)),
      policy: CacheOptionsConstant.policy,
      hitCacheOnErrorExcept: CacheOptionsConstant.hitCacheOnErrorExcept,
      maxStale: CacheOptionsConstant.maxStale,
      allowPostMethod: CacheOptionsConstant.allowPostMethod,
    );

    _dio = Dio(options)
      ..interceptors.add(DioCacheInterceptor(options: optionsCache))
      ..interceptors.add(kDebugMode
          ? LogInterceptor(
              responseBody: true,
              requestBody: true,
              requestHeader: true,
              request: true)
          : LogInterceptor(
              responseBody: false, responseHeader: false, request: false))
      ..interceptors.add(AuthInterceptor(apiType));
  }

  //  // GET request with parameters

  Future<DataResponse> get(
    String url,
    dynamic queryParameters, {
    bool getFromCache = true,
    SetInCache setInCache = SetInCache.SERVER,
    bool shouldShowGlobalErrorToaster = true,
    bool showLoader = false,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    Map<String, dynamic> queryParametersMap = <String, dynamic>{};
    List<MapEntry<String, dynamic>> listqueryParameterEntries =
        queryParameters.entries.toList();
    listqueryParameterEntries.sort((a, b) => a.key.compareTo(b.key));
    queryParametersMap = Map.fromEntries(listqueryParameterEntries);
    try {
      if (showLoader) {
        UIUtils.showProgressDialog(isCancellable: false);
      }
      final Response response = await _dio.get(url,
          queryParameters: queryParametersMap,
          onReceiveProgress: onReceiveProgress,
          options: getFromCache && setInCache == SetInCache.FALSE
              ? optionsCache.copyWith(policy: CachePolicy.request).toOptions()
              : getFromCache && setInCache == SetInCache.SERVER
                  ? optionsCache
                      .copyWith(policy: CachePolicy.request)
                      .toOptions()
                  : getFromCache && setInCache == SetInCache.MANUAL
                      ? optionsCache
                          .copyWith(policy: CachePolicy.forceCache)
                          .toOptions()
                      : !getFromCache && setInCache == SetInCache.FALSE
                          ? optionsCache
                              .copyWith(policy: CachePolicy.noCache)
                              .toOptions()
                          : !getFromCache && setInCache == SetInCache.SERVER
                              ? optionsCache
                                  .copyWith(policy: CachePolicy.refresh)
                                  .toOptions()
                              : optionsCache
                                  .copyWith(
                                      policy: CachePolicy.refreshForceCache)
                                  .toOptions(),
          cancelToken: cancelToken);
      if (showLoader) {
        UIUtils.hideProgressDialog();
      }
      return DataResponse.mapResponse(response, apiType);
    } on DioException catch (e) {
      if (showLoader) {
        UIUtils.hideProgressDialog();
      }
      final ApiException apiException = ApiException.fromDioError(e, apiType);
      var dataResponse = DataResponse();
      dataResponse.isSuccess = false;
      dataResponse.message = apiException.message;
      if (shouldShowGlobalErrorToaster == true) {
        UIUtils.showSnakBar(bodyText: apiException.message, headerText: "");
      }
      return dataResponse;
    }
  }

  // POST request
  Future<dynamic> post(String url,
      {dynamic data,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      BodyType bodytype = BodyType.RAW,
      bool showLoader = true,
      bool shouldShowGlobalErrorToaster = true}) async {
    try {
      if (showLoader) {
        UIUtils.showProgressDialog(isCancellable: false);
      }

      final Response response = await _dio.post(url,
          data: bodytype == BodyType.FORMDATA ? FormData.fromMap(data) : data,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress);
      if (showLoader) {
        UIUtils.hideProgressDialog();
      }
      return DataResponse.mapResponse(response, apiType);
    } on DioException catch (e) {
      if (showLoader) {
        UIUtils.hideProgressDialog();
      }
      final ApiException apiException = ApiException.fromDioError(e, apiType);
      var dataResponse = DataResponse();
      dataResponse.isSuccess = false;
      dataResponse.message = apiException.message;
      if (shouldShowGlobalErrorToaster == true) {
        UIUtils.showSnakBar(bodyText: apiException.message, headerText: "");
      }
      return dataResponse;
    }
  }

  Future<String> downloadFile(
    String url, {
    bool getFromCache = true,
    bool shouldUpdateInCache = true,
    bool shouldShowGlobalErrorToaster = true,
    bool showLoader = false,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    var dir = await getApplicationDocumentsDirectory();
    var imageDownloadPath = '${dir.path}/image.jpg';
    var downloadProgress = 0.0;
    await _dio.download(url, imageDownloadPath,
        onReceiveProgress: (received, total) {
      var progress = (received / total) * 100;
      debugPrint('Rec: $received , Total: $total, $progress%');
      downloadProgress = received.toDouble() / total.toDouble();
    });
    // downloadFile function returns path where image has been downloaded
    return imageDownloadPath;
  }

  Future<void> deleteCacheKey(String url, dynamic queryParameters) async {
    List<MapEntry<String, dynamic>> listqueryParameterEntries =
        queryParameters.entries.toList();
    listqueryParameterEntries.sort((a, b) => a.key.compareTo(b.key));
    final Map<String, dynamic> queryParametersMap =
        Map.fromEntries(listqueryParameterEntries);
    RequestOptions requestOptions = RequestOptions(
        queryParameters: queryParametersMap,
        path: url,
        baseUrl: apiType == ApiType.ASTRO
            ? ApiEndPoints.ASTRO_URL
            : apiType == ApiType.LOCATION
                ? ApiEndPoints.LOCATION_URL
                : ApiEndPoints.WORDPRESS_URL);
    final key = CacheOptions.defaultCacheKeyBuilder(
      requestOptions,
    );
    await HiveCacheStore(PrefUtils.getString(StringConstant.tempDir))
        .delete(key);
  }

  Future<void> cleanStore() async {
    await HiveCacheStore(PrefUtils.getString(StringConstant.tempDir)).clean();
  }
}
