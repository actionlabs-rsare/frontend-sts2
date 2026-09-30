import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/transaction.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
abstract class TransactionLineModel with _$TransactionLineModel {
  const TransactionLineModel._();

  const factory TransactionLineModel({
    required String fromStockholderCode,
    required String toStockholderCode,
    required String shareClassId,
    required int shares,
    required String sourceCertificateNumber,
  }) = _TransactionLineModel;

  factory TransactionLineModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionLineModelFromJson(json);

  TransactionLine toEntity() => TransactionLine(
        fromStockholderCode: fromStockholderCode,
        toStockholderCode: toStockholderCode,
        shareClassId: shareClassId,
        shares: shares,
        sourceCertificateNumber: sourceCertificateNumber,
      );
}

@freezed
abstract class BreakdownEntryModel with _$BreakdownEntryModel {
  const BreakdownEntryModel._();

  const factory BreakdownEntryModel({
    required String stockholderCode,
    required String shareClassId,
    required int sharesBefore,
    required int delta,
    required int sharesAfter,
  }) = _BreakdownEntryModel;

  factory BreakdownEntryModel.fromJson(Map<String, dynamic> json) =>
      _$BreakdownEntryModelFromJson(json);

  BreakdownEntry toEntity() => BreakdownEntry(
        stockholderCode: stockholderCode,
        shareClassId: shareClassId,
        sharesBefore: sharesBefore,
        delta: delta,
        sharesAfter: sharesAfter,
      );
}

@freezed
abstract class ApprovalStepModel with _$ApprovalStepModel {
  const ApprovalStepModel._();

  const factory ApprovalStepModel({
    required int level,
    required String requiredRole,
    required String decision,
    String? actor,
    String? reason,
    String? decidedAt,
  }) = _ApprovalStepModel;

  factory ApprovalStepModel.fromJson(Map<String, dynamic> json) => _$ApprovalStepModelFromJson(json);

  ApprovalStep toEntity() => ApprovalStep(
        level: level,
        requiredRole: requiredRole,
        decision: decision,
        actor: actor,
        reason: reason,
        decidedAt: decidedAt,
      );
}

@freezed
abstract class TransactionModel with _$TransactionModel {
  const TransactionModel._();

  const factory TransactionModel({
    required String id,
    required String type,
    required String status,
    required String companyCode,
    required String transactionDate,
    required String transferType,
    String? srfNo,
    String? remarks,
    @Default(false) bool exception,
    String? postedAt,
    @Default([]) List<TransactionLineModel> lines,
    @Default([]) List<BreakdownEntryModel> breakdown,
    @Default([]) List<ApprovalStepModel> approvals,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);

  Transaction toEntity() => Transaction(
        id: id,
        type: type,
        status: status,
        companyCode: companyCode,
        transactionDate: transactionDate,
        transferType: transferType,
        srfNo: srfNo,
        remarks: remarks,
        exception: exception,
        postedAt: postedAt,
        lines: lines.map((l) => l.toEntity()).toList(),
        breakdown: breakdown.map((b) => b.toEntity()).toList(),
        approvals: approvals.map((a) => a.toEntity()).toList(),
      );
}

@freezed
abstract class TransferLineRequestModel with _$TransferLineRequestModel {
  const factory TransferLineRequestModel({
    required String fromStockholderCode,
    required String toStockholderCode,
    required String shareClassId,
    required int shares,
    required String sourceCertificateNumber,
  }) = _TransferLineRequestModel;

  factory TransferLineRequestModel.fromDomain(TransferLineDraft d) => TransferLineRequestModel(
        fromStockholderCode: d.fromStockholderCode,
        toStockholderCode: d.toStockholderCode,
        shareClassId: d.shareClassId,
        shares: d.shares,
        sourceCertificateNumber: d.sourceCertificateNumber,
      );

  factory TransferLineRequestModel.fromJson(Map<String, dynamic> json) =>
      _$TransferLineRequestModelFromJson(json);
}

@freezed
abstract class TransferRequestModel with _$TransferRequestModel {
  const factory TransferRequestModel({
    required String companyCode,
    required String transactionDate,
    required String transferType,
    required List<TransferLineRequestModel> lines,
    String? srfNo,
    String? remarks,
    @Default(false) bool exception,
  }) = _TransferRequestModel;

  factory TransferRequestModel.fromDomain(TransferDraft d) => TransferRequestModel(
        companyCode: d.companyCode,
        transactionDate: d.transactionDate,
        transferType: d.transferType,
        lines: d.lines.map(TransferLineRequestModel.fromDomain).toList(),
        srfNo: d.srfNo,
        remarks: d.remarks,
        exception: d.exception,
      );

  factory TransferRequestModel.fromJson(Map<String, dynamic> json) =>
      _$TransferRequestModelFromJson(json);
}
