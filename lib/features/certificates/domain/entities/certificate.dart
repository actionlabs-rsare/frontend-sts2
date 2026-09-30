/// Models mirroring contracts/certificates.openapi.yaml (SL-002, TR-017, TR-018).
library;

import 'package:equatable/equatable.dart';

/// TR-017 print options.
enum PrintMode {
  prePrintedForm('PrePrintedForm'),
  systemTemplate('SystemTemplate');

  const PrintMode(this.wire);

  final String wire;

  static PrintMode fromWire(String? value) =>
      PrintMode.values.firstWhere((m) => m.wire == value, orElse: () => PrintMode.prePrintedForm);
}

/// SL-002 numbering mode (Manual = VECO pre-printed, behaviour pending S3-Q2).
enum NumberingMode {
  automatic('Automatic'),
  manual('Manual');

  const NumberingMode(this.wire);

  final String wire;

  static NumberingMode fromWire(String? value) =>
      NumberingMode.values.firstWhere((m) => m.wire == value, orElse: () => NumberingMode.automatic);
}

/// #/components/schemas/NumberingConfig
class NumberingConfig extends Equatable {
  const NumberingConfig({
    required this.shareClassId,
    required this.originalStart,
    required this.replacementStart,
    required this.nextOriginal,
    required this.nextReplacement,
    required this.mode,
  });

  final String shareClassId;
  final String originalStart;
  final String replacementStart;
  final String nextOriginal;
  final String nextReplacement;
  final NumberingMode mode;

  /// A series that has issued shows a next number past its start; the server enforces the lock.
  bool get originalLocked => nextOriginal != originalStart;
  bool get replacementLocked => nextReplacement != replacementStart;

  @override
  List<Object?> get props =>
      [shareClassId, originalStart, replacementStart, nextOriginal, nextReplacement, mode];
}

/// #/components/schemas/Certificate
class Certificate extends Equatable {
  const Certificate({
    required this.number,
    required this.shareClassId,
    required this.holderStockholderCode,
    required this.shares,
    required this.status,
    required this.indicator,
    required this.origin,
  });

  final String number;
  final String shareClassId;
  final String holderStockholderCode;
  final int shares;
  final String status;
  final String indicator;
  final String origin;

  @override
  List<Object?> get props => [number, shareClassId, holderStockholderCode, shares, status, indicator, origin];
}

/// Share class as the numbering screen needs it (shares.openapi.yaml ShareClass subset).
class ShareClassRef extends Equatable {
  const ShareClassRef({required this.id, required this.companyCode, required this.stockType});

  final String id;
  final String companyCode;
  final String stockType;

  @override
  List<Object?> get props => [id, companyCode, stockType];
}

/// An approved transaction waiting to be printed (transactions.openapi.yaml subset).
class PrintableTransactionRef extends Equatable {
  const PrintableTransactionRef({
    required this.id,
    required this.companyCode,
    required this.status,
    required this.summary,
    required this.certificateCount,
  });

  final String id;
  final String companyCode;
  final String status;
  final String summary;
  final int certificateCount;

  @override
  List<Object?> get props => [id, companyCode, status, summary, certificateCount];
}
