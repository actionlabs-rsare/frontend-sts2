import 'package:equatable/equatable.dart';

import '../../domain/entities/company.dart';

enum CompanyListStatus { initial, loading, success, failure }

class CompanyListState extends Equatable {
  const CompanyListState({
    this.status = CompanyListStatus.initial,
    this.companies = const [],
    this.errorMessage,
  });

  final CompanyListStatus status;
  final List<Company> companies;
  final String? errorMessage;

  CompanyListState copyWith({
    CompanyListStatus? status,
    List<Company>? companies,
    String? errorMessage,
  }) {
    return CompanyListState(
      status: status ?? this.status,
      companies: companies ?? this.companies,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, companies, errorMessage];
}
