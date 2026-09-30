import 'package:equatable/equatable.dart';

import '../../domain/entities/certificate.dart';

enum NumberingStatus { initial, loading, success, failure }

class ClassNumbering extends Equatable {
  const ClassNumbering(this.shareClass, this.config);

  final ShareClassRef shareClass;
  final NumberingConfig config;

  @override
  List<Object?> get props => [shareClass, config];
}

class NumberingState extends Equatable {
  const NumberingState({
    this.status = NumberingStatus.initial,
    this.companies = const {},
    this.companyCode,
    this.rows = const [],
    this.successMessage,
    this.errorMessage,
  });

  final NumberingStatus status;
  final Map<String, String> companies;
  final String? companyCode;
  final List<ClassNumbering> rows;
  final String? successMessage;
  final String? errorMessage;

  NumberingState copyWith({
    NumberingStatus? status,
    Map<String, String>? companies,
    String? companyCode,
    List<ClassNumbering>? rows,
    String? successMessage,
    String? errorMessage,
  }) {
    return NumberingState(
      status: status ?? this.status,
      companies: companies ?? this.companies,
      companyCode: companyCode ?? this.companyCode,
      rows: rows ?? this.rows,
      successMessage: successMessage,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, companies, companyCode, rows, successMessage, errorMessage];
}
