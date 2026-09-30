import 'package:equatable/equatable.dart';

/// Share class entity mirroring `contracts/shares.openapi.yaml` #/schemas/ShareClass.
///
/// `totalAmount` and `nextCertificateNumber` are computed by the server (MDM-003, SL-002); the
/// form shows them read-only so the screen can never disagree with the stored figures.
class ShareClass extends Equatable {
  const ShareClass({
    required this.id,
    required this.companyCode,
    required this.stockType,
    required this.parValue,
    required this.authorizedShares,
    required this.subscribedShares,
    required this.issuedShares,
    required this.treasuryShares,
    required this.totalAmount,
    this.nextCertificateNumber,
  });

  final String id;
  final String companyCode;
  final String stockType;
  final double parValue;
  final int authorizedShares;
  final int subscribedShares;
  final int issuedShares;
  final int treasuryShares;
  final double totalAmount;

  /// Next number this class's own sequence would issue. Null when the server cannot read it.
  final String? nextCertificateNumber;

  @override
  List<Object?> get props => [
        id,
        companyCode,
        stockType,
        parValue,
        authorizedShares,
        subscribedShares,
        issuedShares,
        treasuryShares,
        totalAmount,
        nextCertificateNumber,
      ];
}

/// Payload for create/update (#/schemas/ShareClassInput). Total amount is not sent: the server
/// computes it, so sending it would only create a way to disagree with it.
class ShareClassDraft extends Equatable {
  const ShareClassDraft({
    required this.stockType,
    required this.parValue,
    required this.authorizedShares,
    this.subscribedShares = 0,
    this.issuedShares = 0,
    this.treasuryShares = 0,
  });

  factory ShareClassDraft.from(ShareClass sc) => ShareClassDraft(
        stockType: sc.stockType,
        parValue: sc.parValue,
        authorizedShares: sc.authorizedShares,
        subscribedShares: sc.subscribedShares,
        issuedShares: sc.issuedShares,
        treasuryShares: sc.treasuryShares,
      );

  final String stockType;
  final double parValue;
  final int authorizedShares;
  final int subscribedShares;
  final int issuedShares;
  final int treasuryShares;

  @override
  List<Object?> get props =>
      [stockType, parValue, authorizedShares, subscribedShares, issuedShares, treasuryShares];
}
