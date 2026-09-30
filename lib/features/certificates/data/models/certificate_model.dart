import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/certificate.dart';

part 'certificate_model.freezed.dart';
part 'certificate_model.g.dart';

@freezed
abstract class NumberingConfigModel with _$NumberingConfigModel {
  const NumberingConfigModel._();

  const factory NumberingConfigModel({
    required String shareClassId,
    required String originalStart,
    required String replacementStart,
    required String nextOriginal,
    required String nextReplacement,
    required String mode,
  }) = _NumberingConfigModel;

  factory NumberingConfigModel.fromJson(Map<String, dynamic> json) =>
      _$NumberingConfigModelFromJson(json);

  NumberingConfig toEntity() => NumberingConfig(
        shareClassId: shareClassId,
        originalStart: originalStart,
        replacementStart: replacementStart,
        nextOriginal: nextOriginal,
        nextReplacement: nextReplacement,
        mode: NumberingMode.fromWire(mode),
      );
}

@freezed
abstract class CertificateModel with _$CertificateModel {
  const CertificateModel._();

  const factory CertificateModel({
    required String number,
    required String shareClassId,
    required String holderStockholderCode,
    required int shares,
    required String status,
    required String indicator,
    @Default('original') String origin,
  }) = _CertificateModel;

  factory CertificateModel.fromJson(Map<String, dynamic> json) => _$CertificateModelFromJson(json);

  Certificate toEntity() => Certificate(
        number: number,
        shareClassId: shareClassId,
        holderStockholderCode: holderStockholderCode,
        shares: shares,
        status: status,
        indicator: indicator,
        origin: origin,
      );
}
