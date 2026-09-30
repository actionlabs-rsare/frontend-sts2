import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/stockholder.dart';

part 'stockholder_model.freezed.dart';
part 'stockholder_model.g.dart';

@freezed
abstract class StockholderModel with _$StockholderModel {
  const StockholderModel._();

  const factory StockholderModel({
    required String stockholderCode,
    required String name,
    required String type,
    required String tin,
    required String nationality,
    required String gender,
    required String email,
    required bool active,
    String? mobile,
    String? address,
    String? corporationType,
    String? familyGroupId,
    int? sharesHeld,
  }) = _StockholderModel;

  factory StockholderModel.fromJson(Map<String, dynamic> json) => _$StockholderModelFromJson(json);

  Stockholder toEntity() => Stockholder(
        stockholderCode: stockholderCode,
        name: name,
        type: type,
        tin: tin,
        nationality: nationality,
        gender: gender,
        email: email,
        active: active,
        mobile: mobile,
        address: address,
        corporationType: corporationType,
        familyGroupId: familyGroupId,
        sharesHeld: sharesHeld,
      );
}

@freezed
abstract class StockholderRequestModel with _$StockholderRequestModel {
  const factory StockholderRequestModel({
    required String name,
    required String type,
    required String tin,
    required String nationality,
    required String gender,
    required String email,
    @JsonKey(includeIfNull: false) String? mobile,
    @JsonKey(includeIfNull: false) String? address,
    @JsonKey(includeIfNull: false) String? corporationType,
    @JsonKey(includeIfNull: false) String? familyGroupId,
    @JsonKey(includeIfNull: false) bool? active,
  }) = _StockholderRequestModel;

  factory StockholderRequestModel.fromDomain(StockholderDraft draft) => StockholderRequestModel(
        name: draft.name,
        type: draft.type,
        tin: draft.tin,
        nationality: draft.nationality,
        gender: draft.gender,
        email: draft.email,
        mobile: _emptyToNull(draft.mobile),
        address: _emptyToNull(draft.address),
        corporationType: _emptyToNull(draft.corporationType),
        familyGroupId: _emptyToNull(draft.familyGroupId),
        active: draft.active,
      );

  factory StockholderRequestModel.fromJson(Map<String, dynamic> json) =>
      _$StockholderRequestModelFromJson(json);
}

String? _emptyToNull(String? v) => (v == null || v.isEmpty) ? null : v;
