import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class BaseConstant {
  /// Whenever more than [receiveTimeout] passes between two events from response stream,
  /// [Dio] will throw the [DioError] with [DioErrorType.RECEIVE_TIMEOUT].
  /// Note: This is not the receiving time limitati
  static const Duration receiveTimeout = Duration(seconds: 50);

  /// Timeout for opening url.
  static const Duration connectionTimeout = Duration(seconds: 20);
}

class CacheOptionsConstant {
  /// Handles behaviour to request backend.
  ///
  ///
  ///
  static CachePolicy policy = CachePolicy.request;




  /// Ability to return cache excepted on given status codes.
  /// Giving an empty list will hit cache on any status codes.
  ///
  /// Other errors, such as socket exceptions (connect, send TO, receive TO,
  /// ...),
  /// will trigger the cache.
  static List<int>? hitCacheOnErrorExcept = [401, 403];

  /// Overrides any HTTP directive to delete entry past this duration.
  ///
  /// Giving this value to a later request will update the previously
  /// cached response with this directive.
  ///
  /// This allows to postpone the deletion.
  static Duration? maxStale = const Duration(days: 7);

  /// The priority of a cached value.
  /// Ease the clean up if needed.
  static CachePriority priority = CachePriority.normal;

  /// Store used for caching data.
  ///
  /// Required when setting interceptor.
  /// Optional when setting new options on dedicated requests.

  /// Optional method to decrypt/encrypt cache content

  /// allow POST method request to be cached.
  static bool allowPostMethod = false;
}
