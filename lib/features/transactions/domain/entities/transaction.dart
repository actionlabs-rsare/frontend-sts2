import 'package:equatable/equatable.dart';

/// Models mirroring transactions.openapi.yaml responses.
class TransactionLine extends Equatable {
  const TransactionLine({
    required this.fromStockholderCode,
    required this.toStockholderCode,
    required this.shareClassId,
    required this.shares,
    required this.sourceCertificateNumber,
  });

  final String fromStockholderCode;
  final String toStockholderCode;
  final String shareClassId;
  final int shares;
  final String sourceCertificateNumber;

  @override
  List<Object?> get props =>
      [fromStockholderCode, toStockholderCode, shareClassId, shares, sourceCertificateNumber];
}

class BreakdownEntry extends Equatable {
  const BreakdownEntry({
    required this.stockholderCode,
    required this.shareClassId,
    required this.sharesBefore,
    required this.delta,
    required this.sharesAfter,
  });

  final String stockholderCode;
  final String shareClassId;
  final int sharesBefore;
  final int delta;
  final int sharesAfter;

  @override
  List<Object?> get props => [stockholderCode, shareClassId, sharesBefore, delta, sharesAfter];
}

class ApprovalStep extends Equatable {
  const ApprovalStep({
    required this.level,
    required this.requiredRole,
    required this.decision,
    this.actor,
    this.reason,
    this.decidedAt,
  });

  final int level;
  final String requiredRole;
  final String decision;
  final String? actor;
  final String? reason;
  final String? decidedAt;

  @override
  List<Object?> get props => [level, requiredRole, decision, actor, reason, decidedAt];
}

class Transaction extends Equatable {
  const Transaction({
    required this.id,
    required this.type,
    required this.status,
    required this.companyCode,
    required this.transactionDate,
    required this.transferType,
    this.srfNo,
    this.remarks,
    required this.exception,
    this.postedAt,
    required this.lines,
    required this.breakdown,
    required this.approvals,
  });

  final String id;
  final String type;
  final String status;
  final String companyCode;
  final String transactionDate;
  final String transferType;
  final String? srfNo;
  final String? remarks;
  final bool exception;
  final String? postedAt;
  final List<TransactionLine> lines;
  final List<BreakdownEntry> breakdown;
  final List<ApprovalStep> approvals;

  @override
  List<Object?> get props => [
        id,
        type,
        status,
        companyCode,
        transactionDate,
        transferType,
        srfNo,
        remarks,
        exception,
        postedAt,
        lines,
        breakdown,
        approvals,
      ];
}

/// Fields the user supplies to create a transfer (TR-003).
class TransferLineDraft extends Equatable {
  const TransferLineDraft({
    required this.fromStockholderCode,
    required this.toStockholderCode,
    required this.shareClassId,
    required this.shares,
    required this.sourceCertificateNumber,
  });

  final String fromStockholderCode;
  final String toStockholderCode;
  final String shareClassId;
  final int shares;
  final String sourceCertificateNumber;

  @override
  List<Object?> get props =>
      [fromStockholderCode, toStockholderCode, shareClassId, shares, sourceCertificateNumber];
}

class TransferDraft extends Equatable {
  const TransferDraft({
    required this.companyCode,
    required this.transactionDate,
    required this.transferType,
    required this.lines,
    this.srfNo,
    this.remarks,
    this.exception = false,
  });

  final String companyCode;
  final String transactionDate;
  final String transferType;
  final List<TransferLineDraft> lines;
  final String? srfNo;
  final String? remarks;
  final bool exception;

  @override
  List<Object?> get props =>
      [companyCode, transactionDate, transferType, lines, srfNo, remarks, exception];
}
