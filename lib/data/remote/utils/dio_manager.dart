import 'package:dio/dio.dart';
import 'package:posts_bloc/base/constants/api/app_api_calls.dart';

class DioManager {
  DioManager._();

  static Dio? _instance;

  static Dio? getInstance() {
    _instance ??= Dio(
      BaseOptions(
        baseUrl: AppApiCalls.postsApiBaseUrl,
        connectTimeout: const Duration(seconds: AppApiCalls.connectionTimeout),
        receiveTimeout: const Duration(seconds: AppApiCalls.readTimeout),
        sendTimeout: const Duration(seconds: AppApiCalls.writeTimeout),
      ),
    );
    return _instance;
  }
}
