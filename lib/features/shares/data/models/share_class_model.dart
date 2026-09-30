import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/share_class.dart';

part 'share_class_model.freezed.dart';
part 'share_class_model.g.dart';

@freezed
abstract class ShareClassModel with _$ShareClassModel {
  const ShareClassModel._();

  const factory ShareClassModel({
    required String id,
    required String companyCode,
    required String stockType,
    required double parValue,
    required int authorizedShares,
    required int subscribedShares,
    required int issuedShares,
    required int treasuryShares,
    required double totalAmount,
    String? nextCertificateNumber,
  }) = _ShareClassModel;

  factory ShareClassModel.fromJson(Map<String, dynamic> json) => _$ShareClassModelFromJson(json);

  ShareClass toEntity() => ShareClass(
        id: id,
        companyCode: companyCode,
        stockType: stockType,
        parValue: parValue,
        authorizedShares: authorizedShares,
        subscribedShares: subscribedShares,
        issuedShares: issuedShares,
        treasuryShares: treasuryShares,
        totalAmount: totalAmount,
        nextCertificateNumber: nextCertificateNumber,
      );
}

@freezed
abstract class ShareClassRequestModel with _$ShareClassRequestModel {
  const factory ShareClassRequestModel({
    required String stockType,
    required double parValue,
    required int authorizedShares,
    required int subscribedShares,
    required int issuedShares,
    required int treasuryShares,
  }) = _ShareClassRequestModel;

  factory ShareClassRequestModel.fromDomain(ShareClassDraft draft) => ShareClassRequestModel(
        stockType: draft.stockType,
        parValue: draft.parValue,
        authorizedShares: draft.authorizedShares,
        subscribedShares: draft.subscribedShares,
        issuedShares: draft.issuedShares,
        treasuryShares: draft.treasuryShares,
      );

  factory ShareClassRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ShareClassRequestModelFromJson(json);
}
