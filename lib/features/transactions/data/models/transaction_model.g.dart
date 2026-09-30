// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionLineModel _$TransactionLineModelFromJson(
  Map<String, dynamic> json,
) => _TransactionLineModel(
  fromStockholderCode: json['fromStockholderCode'] as String,
  toStockholderCode: json['toStockholderCode'] as String,
  shareClassId: json['shareClassId'] as String,
  shares: (json['shares'] as num).toInt(),
  sourceCertificateNumber: json['sourceCertificateNumber'] as String,
);

Map<String, dynamic> _$TransactionLineModelToJson(
  _TransactionLineModel instance,
) => <String, dynamic>{
  'fromStockholderCode': instance.fromStockholderCode,
  'toStockholderCode': instance.toStockholderCode,
  'shareClassId': instance.shareClassId,
  'shares': instance.shares,
  'sourceCertificateNumber': instance.sourceCertificateNumber,
};

_BreakdownEntryModel _$BreakdownEntryModelFromJson(Map<String, dynamic> json) =>
    _BreakdownEntryModel(
      stockholderCode: json['stockholderCode'] as String,
      shareClassId: json['shareClassId'] as String,
      sharesBefore: (json['sharesBefore'] as num).toInt(),
      delta: (json['delta'] as num).toInt(),
      sharesAfter: (json['sharesAfter'] as num).toInt(),
    );

Map<String, dynamic> _$BreakdownEntryModelToJson(
  _BreakdownEntryModel instance,
) => <String, dynamic>{
  'stockholderCode': instance.stockholderCode,
  'shareClassId': instance.shareClassId,
  'sharesBefore': instance.sharesBefore,
  'delta': instance.delta,
  'sharesAfter': instance.sharesAfter,
};

_ApprovalStepModel _$ApprovalStepModelFromJson(Map<String, dynamic> json) =>
    _ApprovalStepModel(
      level: (json['level'] as num).toInt(),
      requiredRole: json['requiredRole'] as String,
      decision: json['decision'] as String,
      actor: json['actor'] as String?,
      reason: json['reason'] as String?,
      decidedAt: json['decidedAt'] as String?,
    );

Map<String, dynamic> _$ApprovalStepModelToJson(_ApprovalStepModel instance) =>
    <String, dynamic>{
      'level': instance.level,
      'requiredRole': instance.requiredRole,
      'decision': instance.decision,
      'actor': instance.actor,
      'reason': instance.reason,
      'decidedAt': instance.decidedAt,
    };

_TransactionModel _$TransactionModelFromJson(
  Map<String, dynamic> json,
) => _TransactionModel(
  id: json['id'] as String,
  type: json['type'] as String,
  status: json['status'] as String,
  companyCode: json['companyCode'] as String,
  transactionDate: json['transactionDate'] as String,
  transferType: json['transferType'] as String,
  srfNo: json['srfNo'] as String?,
  remarks: json['remarks'] as String?,
  exception: json['exception'] as bool? ?? false,
  postedAt: json['postedAt'] as String?,
  lines:
      (json['lines'] as List<dynamic>?)
          ?.map((e) => TransactionLineModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  breakdown:
      (json['breakdown'] as List<dynamic>?)
          ?.map((e) => BreakdownEntryModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  approvals:
      (json['approvals'] as List<dynamic>?)
          ?.map((e) => ApprovalStepModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$TransactionModelToJson(_TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'status': instance.status,
      'companyCode': instance.companyCode,
      'transactionDate': instance.transactionDate,
      'transferType': instance.transferType,
      'srfNo': instance.srfNo,
      'remarks': instance.remarks,
      'exception': instance.exception,
      'postedAt': instance.postedAt,
      'lines': instance.lines,
      'breakdown': instance.breakdown,
      'approvals': instance.approvals,
    };

_TransferLineRequestModel _$TransferLineRequestModelFromJson(
  Map<String, dynamic> json,
) => _TransferLineRequestModel(
  fromStockholderCode: json['fromStockholderCode'] as String,
  toStockholderCode: json['toStockholderCode'] as String,
  shareClassId: json['shareClassId'] as String,
  shares: (json['shares'] as num).toInt(),
  sourceCertificateNumber: json['sourceCertificateNumber'] as String,
);

Map<String, dynamic> _$TransferLineRequestModelToJson(
  _TransferLineRequestModel instance,
) => <String, dynamic>{
  'fromStockholderCode': instance.fromStockholderCode,
  'toStockholderCode': instance.toStockholderCode,
  'shareClassId': instance.shareClassId,
  'shares': instance.shares,
  'sourceCertificateNumber': instance.sourceCertificateNumber,
};

_TransferRequestModel _$TransferRequestModelFromJson(
  Map<String, dynamic> json,
) => _TransferRequestModel(
  companyCode: json['companyCode'] as String,
  transactionDate: json['transactionDate'] as String,
  transferType: json['transferType'] as String,
  lines: (json['lines'] as List<dynamic>)
      .map((e) => TransferLineRequestModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  srfNo: json['srfNo'] as String?,
  remarks: json['remarks'] as String?,
  exception: json['exception'] as bool? ?? false,
);

Map<String, dynamic> _$TransferRequestModelToJson(
  _TransferRequestModel instance,
) => <String, dynamic>{
  'companyCode': instance.companyCode,
  'transactionDate': instance.transactionDate,
  'transferType': instance.transferType,
  'lines': instance.lines,
  'srfNo': instance.srfNo,
  'remarks': instance.remarks,
  'exception': instance.exception,
};
