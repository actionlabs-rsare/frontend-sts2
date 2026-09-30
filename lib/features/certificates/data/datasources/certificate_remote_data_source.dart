import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../../../core/error/app_exception.dart';
import '../../domain/entities/certificate.dart';
import '../models/certificate_model.dart';

/// REST client for `contracts/certificates.openapi.yaml` (SL-002, TR-017, TR-018).
abstract interface class CertificateRemoteDataSource {
  Future<NumberingConfigModel> getNumbering(String shareClassId);

  Future<NumberingConfigModel> setNumbering(
    String shareClassId, {
    String? originalStart,
    String? replacementStart,
    NumberingMode? mode,
  });

  Future<List<CertificateModel>> print(
    String transactionId,
    PrintMode mode, {
    String? manualNumber,
    bool teamLeaderApproval = false,
  });

  Future<List<CertificateModel>> listForTransaction(String transactionId);

  Future<Uint8List> downloadDocument(String transactionId, {PrintMode? mode});
}

class CertificateRemoteDataSourceImpl implements CertificateRemoteDataSource {
  const CertificateRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<NumberingConfigModel> getNumbering(String shareClassId) async {
    try {
      final response = await _dio
          .get<Map<String, dynamic>>('/share-classes/${Uri.encodeComponent(shareClassId)}/numbering');
      final data = response.data;
      if (data == null) throw const AppException('Numbering configuration not found.', statusCode: 404);
      return NumberingConfigModel.fromJson(data);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<NumberingConfigModel> setNumbering(
    String shareClassId, {
    String? originalStart,
    String? replacementStart,
    NumberingMode? mode,
  }) async {
    final body = <String, dynamic>{
      'shareClassId': shareClassId,
      'originalStart': ?originalStart,
      'replacementStart': ?replacementStart,
      'mode': ?mode?.wire,
    };
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        '/share-classes/${Uri.encodeComponent(shareClassId)}/numbering',
        data: body,
      );
      final data = response.data;
      if (data == null) throw const AppException('The numbering was not saved.');
      return NumberingConfigModel.fromJson(data);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<List<CertificateModel>> print(
    String transactionId,
    PrintMode mode, {
    String? manualNumber,
    bool teamLeaderApproval = false,
  }) async {
    final body = <String, dynamic>{
      'transactionId': transactionId,
      'mode': mode.wire,
      if (manualNumber != null && manualNumber.trim().isNotEmpty) ...{
        'manualNumber': manualNumber.trim(),
        'teamLeaderApproval': teamLeaderApproval,
      },
    };
    try {
      final response = await _dio.post<List<dynamic>>('/certificates/print', data: body);
      final records = response.data ?? const [];
      return records.whereType<Map<String, dynamic>>().map(CertificateModel.fromJson).toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<List<CertificateModel>> listForTransaction(String transactionId) async {
    try {
      final response = await _dio
          .get<List<dynamic>>('/certificates', queryParameters: {'transactionId': transactionId});
      final records = response.data ?? const [];
      return records.whereType<Map<String, dynamic>>().map(CertificateModel.fromJson).toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<Uint8List> downloadDocument(String transactionId, {PrintMode? mode}) async {
    try {
      final response = await _dio.get<List<int>>(
        '/certificates/print/${Uri.encodeComponent(transactionId)}/document',
        queryParameters: mode == null ? null : {'mode': mode.wire},
        options: Options(responseType: ResponseType.bytes, headers: {'Accept': 'application/pdf'}),
      );
      final data = response.data;
      if (data == null) throw const AppException('The document was empty.');
      return Uint8List.fromList(data);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }
}
