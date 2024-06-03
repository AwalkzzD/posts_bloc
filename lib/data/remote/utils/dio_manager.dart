import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:posts_bloc/base/constants/api/app_api_calls.dart';

class DioManager {
  DioManager._();

  static Dio? _instance;

  static Future<Dio?> getInstance() async {
    if (_instance == null) {
      final appDocDir = await getApplicationDocumentsDirectory();
      Hive.init(appDocDir.path);
      final cacheStore =
          HiveCacheStore(appDocDir.path, hiveBoxName: 'posts_bloc');

      final cacheOptions = CacheOptions(
        store: cacheStore,
        policy: CachePolicy.forceCache,
        hitCacheOnErrorExcept: [401, 403],
        priority: CachePriority.normal,
        maxStale: const Duration(minutes: AppApiCalls.cacheTimeoutMinutes),
      );

      _instance = Dio(
        BaseOptions(
          baseUrl: AppApiCalls.postsApiBaseUrl,
          connectTimeout:
              const Duration(seconds: AppApiCalls.connectionTimeout),
          receiveTimeout: const Duration(seconds: AppApiCalls.readTimeout),
          sendTimeout: const Duration(seconds: AppApiCalls.writeTimeout),
        ),
      )..interceptors.add(DioCacheInterceptor(options: cacheOptions));
    }
    return _instance;
  }
}
