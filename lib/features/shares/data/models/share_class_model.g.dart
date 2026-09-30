// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_class_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShareClassModel _$ShareClassModelFromJson(Map<String, dynamic> json) =>
    _ShareClassModel(
      id: json['id'] as String,
      companyCode: json['companyCode'] as String,
      stockType: json['stockType'] as String,
      parValue: (json['parValue'] as num).toDouble(),
      authorizedShares: (json['authorizedShares'] as num).toInt(),
      subscribedShares: (json['subscribedShares'] as num).toInt(),
      issuedShares: (json['issuedShares'] as num).toInt(),
      treasuryShares: (json['treasuryShares'] as num).toInt(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      nextCertificateNumber: json['nextCertificateNumber'] as String?,
    );

Map<String, dynamic> _$ShareClassModelToJson(_ShareClassModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyCode': instance.companyCode,
      'stockType': instance.stockType,
      'parValue': instance.parValue,
      'authorizedShares': instance.authorizedShares,
      'subscribedShares': instance.subscribedShares,
      'issuedShares': instance.issuedShares,
      'treasuryShares': instance.treasuryShares,
      'totalAmount': instance.totalAmount,
      'nextCertificateNumber': instance.nextCertificateNumber,
    };

_ShareClassRequestModel _$ShareClassRequestModelFromJson(
  Map<String, dynamic> json,
) => _ShareClassRequestModel(
  stockType: json['stockType'] as String,
  parValue: (json['parValue'] as num).toDouble(),
  authorizedShares: (json['authorizedShares'] as num).toInt(),
  subscribedShares: (json['subscribedShares'] as num).toInt(),
  issuedShares: (json['issuedShares'] as num).toInt(),
  treasuryShares: (json['treasuryShares'] as num).toInt(),
);

Map<String, dynamic> _$ShareClassRequestModelToJson(
  _ShareClassRequestModel instance,
) => <String, dynamic>{
  'stockType': instance.stockType,
  'parValue': instance.parValue,
  'authorizedShares': instance.authorizedShares,
  'subscribedShares': instance.subscribedShares,
  'issuedShares': instance.issuedShares,
  'treasuryShares': instance.treasuryShares,
};
