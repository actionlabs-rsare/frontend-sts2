import 'package:dio/dio.dart';

import '../../../../core/error/app_exception.dart';
import '../models/stockholder_model.dart';

/// REST client for `contracts/stockholders.openapi.yaml`.
///
/// There is no delete call and there must not be one (OI-19): retiring a stockholder is an
/// update with `active: false`, which the server audits.
abstract interface class StockholderRemoteDataSource {
  Future<List<StockholderModel>> list({String? q});
  Future<StockholderModel> create(StockholderRequestModel request);
  Future<StockholderModel> update(String code, StockholderRequestModel request);
}

class StockholderRemoteDataSourceImpl implements StockholderRemoteDataSource {
  const StockholderRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<StockholderModel>> list({String? q}) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        '/stockholders',
        queryParameters: (q == null || q.isEmpty) ? null : {'q': q},
      );
      final records = response.data ?? const [];
      return records.whereType<Map<String, dynamic>>().map(StockholderModel.fromJson).toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<StockholderModel> create(StockholderRequestModel request) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>('/stockholders', data: request.toJson());
      final data = response.data;
      if (data == null) throw const AppException('Stockholder was not created.');
      return StockholderModel.fromJson(data);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<StockholderModel> update(String code, StockholderRequestModel request) async {
    try {
      final response =
          await _dio.put<Map<String, dynamic>>('/stockholders/$code', data: request.toJson());
      final data = response.data;
      if (data == null) throw const AppException('Stockholder was not updated.');
      return StockholderModel.fromJson(data);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }
}
