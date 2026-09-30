import 'package:equatable/equatable.dart';

/// Stockholder entity mirroring `contracts/stockholders.openapi.yaml` #/schemas/Stockholder.
///
/// Personal data (TIN, nationality, gender, mobile, address, email) is carried here because
/// the maintenance screen needs it, but the list view shows TIN masked.
class Stockholder extends Equatable {
  const Stockholder({
    required this.stockholderCode,
    required this.name,
    required this.type,
    required this.tin,
    required this.nationality,
    required this.gender,
    required this.email,
    required this.active,
    this.mobile,
    this.address,
    this.corporationType,
    this.familyGroupId,
    this.sharesHeld,
  });

  final String stockholderCode;
  final String name;
  final String type; // Individual | Corporate
  final String tin;
  final String nationality;
  final String gender; // Female | Male | PreferNotToSay
  final String email;
  final bool active;
  final String? mobile;
  final String? address;
  final String? corporationType; // Domestic | Foreign
  final String? familyGroupId;

  /// Combined shareholdings, only populated by the family-group inquiry.
  /// Null means "not available" (S2's holding ledger arrives in Wave 2), never zero.
  final int? sharesHeld;

  /// Nationality plus corporation type, as the stockholder table shows it.
  String get nationalityLabel => corporationType == null ? nationality : '$nationality ($corporationType)';

  @override
  List<Object?> get props => [
        stockholderCode,
        name,
        type,
        tin,
        nationality,
        gender,
        email,
        active,
        mobile,
        address,
        corporationType,
        familyGroupId,
        sharesHeld,
      ];
}

/// Payload for create/update, matching #/schemas/StockholderInput.
class StockholderDraft extends Equatable {
  const StockholderDraft({
    required this.name,
    required this.type,
    required this.tin,
    required this.nationality,
    required this.gender,
    required this.email,
    this.mobile,
    this.address,
    this.corporationType,
    this.familyGroupId,
    this.active,
  });

  factory StockholderDraft.from(Stockholder s, {bool? active}) => StockholderDraft(
        name: s.name,
        type: s.type,
        tin: s.tin,
        nationality: s.nationality,
        gender: s.gender,
        email: s.email,
        mobile: s.mobile,
        address: s.address,
        corporationType: s.corporationType,
        familyGroupId: s.familyGroupId,
        active: active ?? s.active,
      );

  final String name;
  final String type;
  final String tin;
  final String nationality;
  final String gender;
  final String email;
  final String? mobile;
  final String? address;
  final String? corporationType;
  final String? familyGroupId;
  final bool? active;

  @override
  List<Object?> get props =>
      [name, type, tin, nationality, gender, email, mobile, address, corporationType, familyGroupId, active];
}
