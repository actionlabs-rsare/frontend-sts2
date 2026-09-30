import 'package:dio/dio.dart';

import '../../../../core/error/app_exception.dart';
import '../models/session_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<SessionModel> devSignIn(String role);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<SessionModel> devSignIn(String role) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/auth/dev-login',
        data: {'role': role},
      );
      final data = response.data;
      if (data == null) throw const AppException('Sign-in returned no data.');
      return SessionModel.fromJson(data);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }
}
