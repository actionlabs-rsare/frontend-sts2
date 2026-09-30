import 'package:dio/dio.dart';

/// Uniform failure surfaced to the presentation layer. Every repository throws this (never a
/// raw [DioException]) so blocs/cubits have one exception type to catch.
class AppException implements Exception {
  const AppException(this.message, {this.statusCode, this.code});

  final String message;
  final int? statusCode;
  final String? code;

  bool get isForbidden => statusCode == 401 || statusCode == 403;
  bool get isNotFound => statusCode == 404;

  @override
  String toString() => 'AppException($statusCode): $message';
}

/// Maps a [DioException] to an [AppException], reading the backend's `{code, message}` error
/// body when present and falling back to a status-aware generic message otherwise.
AppException mapDioException(DioException error) {
  final statusCode = error.response?.statusCode;
  final data = error.response?.data;
  String? code;
  String? message;
  if (data is Map) {
    final m = data['message'];
    if (m is String && m.isNotEmpty) message = m;
    final c = data['code'];
    if (c is String) code = c;
  }
  message ??= _fallbackMessage(statusCode, error);
  return AppException(message, statusCode: statusCode, code: code);
}

String _fallbackMessage(int? statusCode, DioException error) {
  switch (statusCode) {
    case 401:
    case 403:
      return 'Your role is not allowed to do this.';
    case 404:
      return 'Not found. Check the reference and try again.';
    case 422:
      return 'That action is not allowed in the current state, or a reason is required.';
  }
  if (error.type == DioExceptionType.connectionError ||
      error.type == DioExceptionType.connectionTimeout) {
    return 'Could not reach the server. Check that the backend is running and try again.';
  }
  return 'The server could not complete the request${statusCode != null ? ' (HTTP $statusCode)' : ''}. '
      'Try again, or contact support.';
}
