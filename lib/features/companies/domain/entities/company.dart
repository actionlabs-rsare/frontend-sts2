import 'package:equatable/equatable.dart';

/// Company entity mirroring `contracts/companies.openapi.yaml` #/schemas/Company.
class Company extends Equatable {
  const Company({
    required this.companyCode,
    required this.name,
    required this.address,
    this.tin,
    this.secRegistrationCode,
    this.presidentName,
    this.corporateSecretaryName,
  });

  final String companyCode;
  final String name;
  final String address;
  final String? tin;
  final String? secRegistrationCode;
  final String? presidentName;
  final String? corporateSecretaryName;

  @override
  List<Object?> get props =>
      [companyCode, name, address, tin, secRegistrationCode, presidentName, corporateSecretaryName];
}

/// Fields the user supplies when creating a company. The code is server-assigned.
class CompanyDraft extends Equatable {
  const CompanyDraft({
    required this.name,
    required this.address,
    this.tin,
    this.presidentName,
    this.corporateSecretaryName,
  });

  final String name;
  final String address;
  final String? tin;
  final String? presidentName;
  final String? corporateSecretaryName;

  @override
  List<Object?> get props => [name, address, tin, presidentName, corporateSecretaryName];
}
