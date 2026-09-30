import 'package:dio/dio.dart';

import '../../../../core/error/app_exception.dart';
import '../models/share_class_model.dart';

abstract interface class ShareClassRemoteDataSource {
  Future<List<ShareClassModel>> list(String companyCode);
  Future<ShareClassModel> create(String companyCode, ShareClassRequestModel request);
  Future<ShareClassModel> update(String companyCode, String id, ShareClassRequestModel request);
}

/// REST client for `contracts/shares.openapi.yaml`.
class ShareClassRemoteDataSourceImpl implements ShareClassRemoteDataSource {
  const ShareClassRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<ShareClassModel>> list(String companyCode) async {
    try {
      final response =
          await _dio.get<List<dynamic>>('/companies/$companyCode/share-classes');
      final records = response.data ?? const [];
      return records.whereType<Map<String, dynamic>>().map(ShareClassModel.fromJson).toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<ShareClassModel> create(String companyCode, ShareClassRequestModel request) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/companies/$companyCode/share-classes',
        data: request.toJson(),
      );
      final data = response.data;
      if (data == null) throw const AppException('Share class was not created.');
      return ShareClassModel.fromJson(data);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<ShareClassModel> update(String companyCode, String id, ShareClassRequestModel request) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        '/companies/$companyCode/share-classes/$id',
        data: request.toJson(),
      );
      final data = response.data;
      if (data == null) throw const AppException('Share class was not updated.');
      return ShareClassModel.fromJson(data);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }
}
