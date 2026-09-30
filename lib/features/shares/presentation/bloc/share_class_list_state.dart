import 'package:equatable/equatable.dart';

import '../../../companies/domain/entities/company.dart';
import '../../domain/entities/share_class.dart';

enum ShareClassListStatus { initial, loading, success, failure }

class ShareClassListState extends Equatable {
  const ShareClassListState({
    this.status = ShareClassListStatus.initial,
    this.companies = const [],
    this.companyCode,
    this.shareClasses = const [],
    this.errorMessage,
  });

  final ShareClassListStatus status;
  final List<Company> companies;
  final String? companyCode;
  final List<ShareClass> shareClasses;
  final String? errorMessage;

  ShareClassListState copyWith({
    ShareClassListStatus? status,
    List<Company>? companies,
    String? companyCode,
    List<ShareClass>? shareClasses,
    String? errorMessage,
  }) {
    return ShareClassListState(
      status: status ?? this.status,
      companies: companies ?? this.companies,
      companyCode: companyCode ?? this.companyCode,
      shareClasses: shareClasses ?? this.shareClasses,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, companies, companyCode, shareClasses, errorMessage];
}
