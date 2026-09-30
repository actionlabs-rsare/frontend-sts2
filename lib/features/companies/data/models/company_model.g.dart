// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) =>
    _CompanyModel(
      companyCode: json['companyCode'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      tin: json['tin'] as String?,
      secRegistrationCode: json['secRegistrationCode'] as String?,
      presidentName: json['presidentName'] as String?,
      corporateSecretaryName: json['corporateSecretaryName'] as String?,
    );

Map<String, dynamic> _$CompanyModelToJson(_CompanyModel instance) =>
    <String, dynamic>{
      'companyCode': instance.companyCode,
      'name': instance.name,
      'address': instance.address,
      'tin': instance.tin,
      'secRegistrationCode': instance.secRegistrationCode,
      'presidentName': instance.presidentName,
      'corporateSecretaryName': instance.corporateSecretaryName,
    };

_CreateCompanyRequestModel _$CreateCompanyRequestModelFromJson(
  Map<String, dynamic> json,
) => _CreateCompanyRequestModel(
  name: json['name'] as String,
  address: json['address'] as String,
  tin: json['tin'] as String?,
  presidentName: json['presidentName'] as String?,
  corporateSecretaryName: json['corporateSecretaryName'] as String?,
);

Map<String, dynamic> _$CreateCompanyRequestModelToJson(
  _CreateCompanyRequestModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'address': instance.address,
  'tin': instance.tin,
  'presidentName': instance.presidentName,
  'corporateSecretaryName': instance.corporateSecretaryName,
};
