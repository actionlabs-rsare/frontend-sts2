import 'package:dio/dio.dart';

import '../../../../core/error/app_exception.dart';
import '../models/family_group_model.dart';
import '../models/stockholder_model.dart';

/// REST client for the family-group paths of `contracts/stockholders.openapi.yaml`.
abstract interface class FamilyGroupRemoteDataSource {
  Future<List<FamilyGroupModel>> list();
  Future<FamilyGroupModel> create(String name);
  Future<List<StockholderModel>> members(String id);
}

class FamilyGroupRemoteDataSourceImpl implements FamilyGroupRemoteDataSource {
  const FamilyGroupRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<FamilyGroupModel>> list() async {
    try {
      final response = await _dio.get<List<dynamic>>('/family-groups');
      final records = response.data ?? const [];
      return records.whereType<Map<String, dynamic>>().map(FamilyGroupModel.fromJson).toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<FamilyGroupModel> create(String name) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>('/family-groups', data: {'name': name});
      final data = response.data;
      if (data == null) throw const AppException('Family group was not created.');
      return FamilyGroupModel.fromJson(data);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<List<StockholderModel>> members(String id) async {
    try {
      final response = await _dio.get<List<dynamic>>('/family-groups/$id/stockholders');
      final records = response.data ?? const [];
      return records.whereType<Map<String, dynamic>>().map(StockholderModel.fromJson).toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }
}
