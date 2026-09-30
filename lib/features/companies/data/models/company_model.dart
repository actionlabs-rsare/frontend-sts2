import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/company.dart';

part 'company_model.freezed.dart';
part 'company_model.g.dart';

@freezed
abstract class CompanyModel with _$CompanyModel {
  const CompanyModel._();

  const factory CompanyModel({
    required String companyCode,
    required String name,
    required String address,
    String? tin,
    String? secRegistrationCode,
    String? presidentName,
    String? corporateSecretaryName,
  }) = _CompanyModel;

  factory CompanyModel.fromJson(Map<String, dynamic> json) => _$CompanyModelFromJson(json);

  Company toEntity() => Company(
        companyCode: companyCode,
        name: name,
        address: address,
        tin: tin,
        secRegistrationCode: secRegistrationCode,
        presidentName: presidentName,
        corporateSecretaryName: corporateSecretaryName,
      );
}

@freezed
abstract class CreateCompanyRequestModel with _$CreateCompanyRequestModel {
  const factory CreateCompanyRequestModel({
    required String name,
    required String address,
    String? tin,
    String? presidentName,
    String? corporateSecretaryName,
  }) = _CreateCompanyRequestModel;

  factory CreateCompanyRequestModel.fromDomain(CompanyDraft draft) => CreateCompanyRequestModel(
        name: draft.name,
        address: draft.address,
        tin: _emptyToNull(draft.tin),
        presidentName: _emptyToNull(draft.presidentName),
        corporateSecretaryName: _emptyToNull(draft.corporateSecretaryName),
      );

  factory CreateCompanyRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCompanyRequestModelFromJson(json);
}

String? _emptyToNull(String? v) => (v == null || v.isEmpty) ? null : v;
