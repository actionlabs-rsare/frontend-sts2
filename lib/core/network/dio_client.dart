import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../config/app_config.dart';
import '../../features/auth/presentation/bloc/session_cubit.dart';

/// Builds the single [Dio] instance the whole app shares. Auth is looked up lazily through
/// [GetIt] inside the interceptor (not injected directly) so this file has no compile-time
/// dependency cycle with the session feature — by the time a request fires, DI is fully wired.
Dio buildDioClient({String baseUrl = AppConfig.apiBaseUrl}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      headers: {'Accept': '*/*', 'Content-Type': 'application/json'},
    ),
  );
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        if (GetIt.instance.isRegistered<SessionCubit>()) {
          final token = GetIt.instance<SessionCubit>().state.token;
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
        }
        handler.next(options);
      },
    ),
  );
  return dio;
}
