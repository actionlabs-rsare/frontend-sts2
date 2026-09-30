import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../../../core/error/app_exception.dart';
import '../models/transaction_model.dart';

/// REST client for the Transactions & Approval API, matching transactions.openapi.yaml.
abstract interface class TransactionRemoteDataSource {
  Future<List<TransactionModel>> list({String? companyCode, String? status});
  Future<TransactionModel> get(String id);
  Future<TransactionModel> createTransfer(TransferRequestModel request);
  Future<TransactionModel> submit(String id);
  Future<TransactionModel> approve(String id, {String? reason});
  Future<TransactionModel> reject(String id, {required String reason});
  Future<TransactionModel> markPrinted(String id);
  Future<Uint8List> report({String? companyCode, String? status, String? dateFrom, String? dateTo});
}

class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  const TransactionRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<TransactionModel>> list({String? companyCode, String? status}) async {
    final query = <String, String>{};
    if (companyCode != null && companyCode.isNotEmpty) query['companyCode'] = companyCode;
    if (status != null && status.isNotEmpty) query['status'] = status;
    try {
      final response =
          await _dio.get<List<dynamic>>('/transactions', queryParameters: query.isEmpty ? null : query);
      final records = response.data ?? const [];
      return records.whereType<Map<String, dynamic>>().map(TransactionModel.fromJson).toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<TransactionModel> get(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/transactions/$id');
      final data = response.data;
      if (data == null) throw const AppException('Transaction not found.', statusCode: 404);
      return TransactionModel.fromJson(data);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<TransactionModel> createTransfer(TransferRequestModel request) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>('/transactions', data: request.toJson());
      final data = response.data;
      if (data == null) throw const AppException('The transfer was not created.');
      return TransactionModel.fromJson(data);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<TransactionModel> submit(String id) => _action(id, 'submit', null);

  @override
  Future<TransactionModel> approve(String id, {String? reason}) =>
      _action(id, 'approve', reason == null ? null : {'reason': reason});

  @override
  Future<TransactionModel> reject(String id, {required String reason}) =>
      _action(id, 'reject', {'reason': reason});

  @override
  Future<TransactionModel> markPrinted(String id) => _action(id, 'mark-printed', null);

  Future<TransactionModel> _action(String id, String action, Object? body) async {
    try {
      final response =
          await _dio.post<Map<String, dynamic>>('/transactions/$id/$action', data: body ?? const {});
      final data = response.data;
      if (data == null) throw const AppException('The action did not return a transaction.');
      return TransactionModel.fromJson(data);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<Uint8List> report({String? companyCode, String? status, String? dateFrom, String? dateTo}) async {
    final query = <String, String>{};
    if (companyCode != null && companyCode.isNotEmpty) query['companyCode'] = companyCode;
    if (status != null && status.isNotEmpty) query['status'] = status;
    if (dateFrom != null && dateFrom.isNotEmpty) query['dateFrom'] = dateFrom;
    if (dateTo != null && dateTo.isNotEmpty) query['dateTo'] = dateTo;
    try {
      final response = await _dio.get<List<int>>(
        '/transactions/report',
        queryParameters: query.isEmpty ? null : query,
        options: Options(responseType: ResponseType.bytes),
      );
      final data = response.data;
      if (data == null) throw const AppException('The report was empty.');
      return Uint8List.fromList(data);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }
}
