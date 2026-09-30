import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/formatters.dart';
import '../../../../core/utils/pdf_download.dart' as pdf;
import '../../domain/entities/certificate.dart';
import '../../domain/usecases/print_use_cases.dart';
import '../../domain/usecases/reference_use_cases.dart';
import 'print_state.dart';

/// TR-017/TR-018: approved transactions → print → assigned numbers → PDF.
class PrintCubit extends Cubit<PrintState> {
  PrintCubit(
    this._getPrintableTransactions,
    this._getCompanies,
    this._listCertificates,
    this._printCertificates,
    this._downloadDocument,
  ) : super(const PrintState()) {
    _init();
  }

  final GetPrintableTransactionsUseCase _getPrintableTransactions;
  final GetCertificateCompaniesUseCase _getCompanies;
  final ListCertificatesForTransactionUseCase _listCertificates;
  final PrintCertificatesUseCase _printCertificates;
  final DownloadCertificateDocumentUseCase _downloadDocument;

  Future<void> _init() async {
    emit(state.copyWith(status: PrintTransactionsStatus.loading));
    try {
      final transactions = await _getPrintableTransactions();
      final companies = await _getCompanies();
      emit(state.copyWith(
          status: PrintTransactionsStatus.success, transactions: transactions, companies: companies));
    } catch (e) {
      emit(state.copyWith(status: PrintTransactionsStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> open(PrintableTransactionRef tx) async {
    emit(state.copyWith(
      selected: tx,
      certificatesStatus: CertificatesStatus.loading,
      certificates: const [],
      errorMessage: null,
      successMessage: null,
    ));
    try {
      final list = await _listCertificates(tx.id);
      emit(state.copyWith(certificatesStatus: CertificatesStatus.success, certificates: list));
    } catch (_) {
      emit(state.copyWith(
        certificatesStatus: CertificatesStatus.failure,
        errorMessage: 'Could not load the certificates for ${tx.id}. Try again.',
      ));
    }
  }

  Future<List<Certificate>?> print(
    PrintableTransactionRef tx,
    PrintMode mode, {
    String? manualNumber,
    bool teamLeaderApproval = false,
  }) async {
    try {
      final printed = await _printCertificates(tx.id, mode,
          manualNumber: manualNumber, teamLeaderApproval: teamLeaderApproval);
      emit(state.copyWith(
        selected: tx,
        certificatesStatus: CertificatesStatus.success,
        certificates: printed,
        errorMessage: null,
        successMessage: '${printed.length} certificate${printed.length == 1 ? '' : 's'} ready for '
            '${tx.id} at ${formatTimeOfDay(DateTime.now())}: ${printed.map((c) => c.number).join(', ')}. '
            'Download the PDF to print them.',
      ));
      return printed;
    } catch (_) {
      return null;
    }
  }

  Future<Uint8List?> download() async {
    final tx = state.selected;
    if (tx == null) return null;
    emit(state.copyWith(isDownloading: true, errorMessage: null));
    try {
      final bytes = await _downloadDocument(tx.id);
      final saved = await pdf.savePdf(bytes, 'certificates-${tx.id}.pdf');
      emit(state.copyWith(
        isDownloading: false,
        successMessage: saved
            ? 'PDF for ${tx.id} downloaded at ${formatTimeOfDay(DateTime.now())} (${bytes.length ~/ 1024 + 1} KB).'
            : 'The PDF for ${tx.id} was generated, but this platform cannot save files. Use the web app.',
      ));
      return bytes;
    } catch (_) {
      emit(state.copyWith(
        isDownloading: false,
        errorMessage: 'Could not download the PDF. Try again.',
      ));
      return null;
    }
  }
}
