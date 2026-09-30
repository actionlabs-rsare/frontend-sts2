// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NumberingConfigModel _$NumberingConfigModelFromJson(
  Map<String, dynamic> json,
) => _NumberingConfigModel(
  shareClassId: json['shareClassId'] as String,
  originalStart: json['originalStart'] as String,
  replacementStart: json['replacementStart'] as String,
  nextOriginal: json['nextOriginal'] as String,
  nextReplacement: json['nextReplacement'] as String,
  mode: json['mode'] as String,
);

Map<String, dynamic> _$NumberingConfigModelToJson(
  _NumberingConfigModel instance,
) => <String, dynamic>{
  'shareClassId': instance.shareClassId,
  'originalStart': instance.originalStart,
  'replacementStart': instance.replacementStart,
  'nextOriginal': instance.nextOriginal,
  'nextReplacement': instance.nextReplacement,
  'mode': instance.mode,
};

_CertificateModel _$CertificateModelFromJson(Map<String, dynamic> json) =>
    _CertificateModel(
      number: json['number'] as String,
      shareClassId: json['shareClassId'] as String,
      holderStockholderCode: json['holderStockholderCode'] as String,
      shares: (json['shares'] as num).toInt(),
      status: json['status'] as String,
      indicator: json['indicator'] as String,
      origin: json['origin'] as String? ?? 'original',
    );

Map<String, dynamic> _$CertificateModelToJson(_CertificateModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'shareClassId': instance.shareClassId,
      'holderStockholderCode': instance.holderStockholderCode,
      'shares': instance.shares,
      'status': instance.status,
      'indicator': instance.indicator,
      'origin': instance.origin,
    };
