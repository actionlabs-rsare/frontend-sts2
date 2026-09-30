// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stockholder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockholderModel _$StockholderModelFromJson(Map<String, dynamic> json) =>
    _StockholderModel(
      stockholderCode: json['stockholderCode'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      tin: json['tin'] as String,
      nationality: json['nationality'] as String,
      gender: json['gender'] as String,
      email: json['email'] as String,
      active: json['active'] as bool,
      mobile: json['mobile'] as String?,
      address: json['address'] as String?,
      corporationType: json['corporationType'] as String?,
      familyGroupId: json['familyGroupId'] as String?,
      sharesHeld: (json['sharesHeld'] as num?)?.toInt(),
    );

Map<String, dynamic> _$StockholderModelToJson(_StockholderModel instance) =>
    <String, dynamic>{
      'stockholderCode': instance.stockholderCode,
      'name': instance.name,
      'type': instance.type,
      'tin': instance.tin,
      'nationality': instance.nationality,
      'gender': instance.gender,
      'email': instance.email,
      'active': instance.active,
      'mobile': instance.mobile,
      'address': instance.address,
      'corporationType': instance.corporationType,
      'familyGroupId': instance.familyGroupId,
      'sharesHeld': instance.sharesHeld,
    };

_StockholderRequestModel _$StockholderRequestModelFromJson(
  Map<String, dynamic> json,
) => _StockholderRequestModel(
  name: json['name'] as String,
  type: json['type'] as String,
  tin: json['tin'] as String,
  nationality: json['nationality'] as String,
  gender: json['gender'] as String,
  email: json['email'] as String,
  mobile: json['mobile'] as String?,
  address: json['address'] as String?,
  corporationType: json['corporationType'] as String?,
  familyGroupId: json['familyGroupId'] as String?,
  active: json['active'] as bool?,
);

Map<String, dynamic> _$StockholderRequestModelToJson(
  _StockholderRequestModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'type': instance.type,
  'tin': instance.tin,
  'nationality': instance.nationality,
  'gender': instance.gender,
  'email': instance.email,
  'mobile': ?instance.mobile,
  'address': ?instance.address,
  'corporationType': ?instance.corporationType,
  'familyGroupId': ?instance.familyGroupId,
  'active': ?instance.active,
};
