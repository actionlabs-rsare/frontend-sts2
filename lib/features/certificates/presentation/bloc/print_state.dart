import 'package:equatable/equatable.dart';

import '../../domain/entities/certificate.dart';

enum PrintTransactionsStatus { initial, loading, success, failure }
enum CertificatesStatus { idle, loading, success, failure }

class PrintState extends Equatable {
  const PrintState({
    this.status = PrintTransactionsStatus.initial,
    this.transactions = const [],
    this.companies = const {},
    this.selected,
    this.certificatesStatus = CertificatesStatus.idle,
    this.certificates = const [],
    this.successMessage,
    this.errorMessage,
    this.isDownloading = false,
  });

  final PrintTransactionsStatus status;
  final List<PrintableTransactionRef> transactions;
  final Map<String, String> companies;
  final PrintableTransactionRef? selected;
  final CertificatesStatus certificatesStatus;
  final List<Certificate> certificates;
  final String? successMessage;
  final String? errorMessage;
  final bool isDownloading;

  PrintState copyWith({
    PrintTransactionsStatus? status,
    List<PrintableTransactionRef>? transactions,
    Map<String, String>? companies,
    PrintableTransactionRef? selected,
    CertificatesStatus? certificatesStatus,
    List<Certificate>? certificates,
    String? successMessage,
    String? errorMessage,
    bool? isDownloading,
  }) {
    return PrintState(
      status: status ?? this.status,
      transactions: transactions ?? this.transactions,
      companies: companies ?? this.companies,
      selected: selected ?? this.selected,
      certificatesStatus: certificatesStatus ?? this.certificatesStatus,
      certificates: certificates ?? this.certificates,
      successMessage: successMessage,
      errorMessage: errorMessage,
      isDownloading: isDownloading ?? this.isDownloading,
    );
  }

  @override
  List<Object?> get props => [
        status,
        transactions,
        companies,
        selected,
        certificatesStatus,
        certificates,
        successMessage,
        errorMessage,
        isDownloading,
      ];
}
