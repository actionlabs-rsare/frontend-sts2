import 'package:dio/dio.dart';

import '../../../../core/error/app_exception.dart';
import '../models/company_model.dart';

abstract interface class CompanyRemoteDataSource {
  Future<List<CompanyModel>> list({String? q});
  Future<CompanyModel> create(CreateCompanyRequestModel request);
}

class CompanyRemoteDataSourceImpl implements CompanyRemoteDataSource {
  const CompanyRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<CompanyModel>> list({String? q}) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        '/companies',
        queryParameters: (q == null || q.isEmpty) ? null : {'q': q},
      );
      final records = response.data ?? const [];
      return records.whereType<Map<String, dynamic>>().map(CompanyModel.fromJson).toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<CompanyModel> create(CreateCompanyRequestModel request) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>('/companies', data: request.toJson());
      final data = response.data;
      if (data == null) throw const AppException('Company was not created.');
      return CompanyModel.fromJson(data);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }
}
