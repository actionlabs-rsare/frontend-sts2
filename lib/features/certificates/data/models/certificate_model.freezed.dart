// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certificate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NumberingConfigModel {

 String get shareClassId; String get originalStart; String get replacementStart; String get nextOriginal; String get nextReplacement; String get mode;
/// Create a copy of NumberingConfigModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NumberingConfigModelCopyWith<NumberingConfigModel> get copyWith => _$NumberingConfigModelCopyWithImpl<NumberingConfigModel>(this as NumberingConfigModel, _$identity);

  /// Serializes this NumberingConfigModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NumberingConfigModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NumberingConfigModel&&(identical(other.shareClassId, _this.shareClassId) || other.shareClassId == _this.shareClassId)&&(identical(other.originalStart, _this.originalStart) || other.originalStart == _this.originalStart)&&(identical(other.replacementStart, _this.replacementStart) || other.replacementStart == _this.replacementStart)&&(identical(other.nextOriginal, _this.nextOriginal) || other.nextOriginal == _this.nextOriginal)&&(identical(other.nextReplacement, _this.nextReplacement) || other.nextReplacement == _this.nextReplacement)&&(identical(other.mode, _this.mode) || other.mode == _this.mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NumberingConfigModel;
  return Object.hash(runtimeType,_this.shareClassId,_this.originalStart,_this.replacementStart,_this.nextOriginal,_this.nextReplacement,_this.mode);
}

@override
String toString() {
  final _this = this as NumberingConfigModel;
  return 'NumberingConfigModel(shareClassId: ${_this.shareClassId}, originalStart: ${_this.originalStart}, replacementStart: ${_this.replacementStart}, nextOriginal: ${_this.nextOriginal}, nextReplacement: ${_this.nextReplacement}, mode: ${_this.mode})';
}


}

/// @nodoc
abstract mixin class $NumberingConfigModelCopyWith<$Res>  {
  factory $NumberingConfigModelCopyWith(NumberingConfigModel value, $Res Function(NumberingConfigModel) _then) = _$NumberingConfigModelCopyWithImpl;
@useResult
$Res call({
 String shareClassId, String originalStart, String replacementStart, String nextOriginal, String nextReplacement, String mode
});




}
/// @nodoc
class _$NumberingConfigModelCopyWithImpl<$Res>
    implements $NumberingConfigModelCopyWith<$Res> {
  _$NumberingConfigModelCopyWithImpl(this._self, this._then);

  final NumberingConfigModel _self;
  final $Res Function(NumberingConfigModel) _then;

/// Create a copy of NumberingConfigModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shareClassId = null,Object? originalStart = null,Object? replacementStart = null,Object? nextOriginal = null,Object? nextReplacement = null,Object? mode = null,}) {
  return _then(NumberingConfigModel(
shareClassId: null == shareClassId ? _self.shareClassId : shareClassId // ignore: cast_nullable_to_non_nullable
as String,originalStart: null == originalStart ? _self.originalStart : originalStart // ignore: cast_nullable_to_non_nullable
as String,replacementStart: null == replacementStart ? _self.replacementStart : replacementStart // ignore: cast_nullable_to_non_nullable
as String,nextOriginal: null == nextOriginal ? _self.nextOriginal : nextOriginal // ignore: cast_nullable_to_non_nullable
as String,nextReplacement: null == nextReplacement ? _self.nextReplacement : nextReplacement // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NumberingConfigModel].
extension NumberingConfigModelPatterns on NumberingConfigModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NumberingConfigModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NumberingConfigModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NumberingConfigModel value)  $default,){
final _that = this;
switch (_that) {
case _NumberingConfigModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NumberingConfigModel value)?  $default,){
final _that = this;
switch (_that) {
case _NumberingConfigModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String shareClassId,  String originalStart,  String replacementStart,  String nextOriginal,  String nextReplacement,  String mode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NumberingConfigModel() when $default != null:
return $default(_that.shareClassId,_that.originalStart,_that.replacementStart,_that.nextOriginal,_that.nextReplacement,_that.mode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String shareClassId,  String originalStart,  String replacementStart,  String nextOriginal,  String nextReplacement,  String mode)  $default,) {final _that = this;
switch (_that) {
case _NumberingConfigModel():
return $default(_that.shareClassId,_that.originalStart,_that.replacementStart,_that.nextOriginal,_that.nextReplacement,_that.mode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String shareClassId,  String originalStart,  String replacementStart,  String nextOriginal,  String nextReplacement,  String mode)?  $default,) {final _that = this;
switch (_that) {
case _NumberingConfigModel() when $default != null:
return $default(_that.shareClassId,_that.originalStart,_that.replacementStart,_that.nextOriginal,_that.nextReplacement,_that.mode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NumberingConfigModel extends NumberingConfigModel {
  const _NumberingConfigModel({required this.shareClassId, required this.originalStart, required this.replacementStart, required this.nextOriginal, required this.nextReplacement, required this.mode}): super._();
  factory _NumberingConfigModel.fromJson(Map<String, dynamic> json) => _$NumberingConfigModelFromJson(json);

@override final  String shareClassId;
@override final  String originalStart;
@override final  String replacementStart;
@override final  String nextOriginal;
@override final  String nextReplacement;
@override final  String mode;

/// Create a copy of NumberingConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NumberingConfigModelCopyWith<_NumberingConfigModel> get copyWith => __$NumberingConfigModelCopyWithImpl<_NumberingConfigModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NumberingConfigModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NumberingConfigModel&&(identical(other.shareClassId, shareClassId) || other.shareClassId == shareClassId)&&(identical(other.originalStart, originalStart) || other.originalStart == originalStart)&&(identical(other.replacementStart, replacementStart) || other.replacementStart == replacementStart)&&(identical(other.nextOriginal, nextOriginal) || other.nextOriginal == nextOriginal)&&(identical(other.nextReplacement, nextReplacement) || other.nextReplacement == nextReplacement)&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,shareClassId,originalStart,replacementStart,nextOriginal,nextReplacement,mode);
}

@override
String toString() {
    return 'NumberingConfigModel(shareClassId: $shareClassId, originalStart: $originalStart, replacementStart: $replacementStart, nextOriginal: $nextOriginal, nextReplacement: $nextReplacement, mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$NumberingConfigModelCopyWith<$Res> implements $NumberingConfigModelCopyWith<$Res> {
  factory _$NumberingConfigModelCopyWith(_NumberingConfigModel value, $Res Function(_NumberingConfigModel) _then) = __$NumberingConfigModelCopyWithImpl;
@override @useResult
$Res call({
 String shareClassId, String originalStart, String replacementStart, String nextOriginal, String nextReplacement, String mode
});




}
/// @nodoc
class __$NumberingConfigModelCopyWithImpl<$Res>
    implements _$NumberingConfigModelCopyWith<$Res> {
  __$NumberingConfigModelCopyWithImpl(this._self, this._then);

  final _NumberingConfigModel _self;
  final $Res Function(_NumberingConfigModel) _then;

/// Create a copy of NumberingConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shareClassId = null,Object? originalStart = null,Object? replacementStart = null,Object? nextOriginal = null,Object? nextReplacement = null,Object? mode = null,}) {
  return _then(_NumberingConfigModel(
shareClassId: null == shareClassId ? _self.shareClassId : shareClassId // ignore: cast_nullable_to_non_nullable
as String,originalStart: null == originalStart ? _self.originalStart : originalStart // ignore: cast_nullable_to_non_nullable
as String,replacementStart: null == replacementStart ? _self.replacementStart : replacementStart // ignore: cast_nullable_to_non_nullable
as String,nextOriginal: null == nextOriginal ? _self.nextOriginal : nextOriginal // ignore: cast_nullable_to_non_nullable
as String,nextReplacement: null == nextReplacement ? _self.nextReplacement : nextReplacement // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CertificateModel {

 String get number; String get shareClassId; String get holderStockholderCode; int get shares; String get status; String get indicator; String get origin;
/// Create a copy of CertificateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CertificateModelCopyWith<CertificateModel> get copyWith => _$CertificateModelCopyWithImpl<CertificateModel>(this as CertificateModel, _$identity);

  /// Serializes this CertificateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CertificateModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificateModel&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.shareClassId, _this.shareClassId) || other.shareClassId == _this.shareClassId)&&(identical(other.holderStockholderCode, _this.holderStockholderCode) || other.holderStockholderCode == _this.holderStockholderCode)&&(identical(other.shares, _this.shares) || other.shares == _this.shares)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.indicator, _this.indicator) || other.indicator == _this.indicator)&&(identical(other.origin, _this.origin) || other.origin == _this.origin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CertificateModel;
  return Object.hash(runtimeType,_this.number,_this.shareClassId,_this.holderStockholderCode,_this.shares,_this.status,_this.indicator,_this.origin);
}

@override
String toString() {
  final _this = this as CertificateModel;
  return 'CertificateModel(number: ${_this.number}, shareClassId: ${_this.shareClassId}, holderStockholderCode: ${_this.holderStockholderCode}, shares: ${_this.shares}, status: ${_this.status}, indicator: ${_this.indicator}, origin: ${_this.origin})';
}


}

/// @nodoc
abstract mixin class $CertificateModelCopyWith<$Res>  {
  factory $CertificateModelCopyWith(CertificateModel value, $Res Function(CertificateModel) _then) = _$CertificateModelCopyWithImpl;
@useResult
$Res call({
 String number, String shareClassId, String holderStockholderCode, int shares, String status, String indicator, String origin
});




}
/// @nodoc
class _$CertificateModelCopyWithImpl<$Res>
    implements $CertificateModelCopyWith<$Res> {
  _$CertificateModelCopyWithImpl(this._self, this._then);

  final CertificateModel _self;
  final $Res Function(CertificateModel) _then;

/// Create a copy of CertificateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? shareClassId = null,Object? holderStockholderCode = null,Object? shares = null,Object? status = null,Object? indicator = null,Object? origin = null,}) {
  return _then(CertificateModel(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,shareClassId: null == shareClassId ? _self.shareClassId : shareClassId // ignore: cast_nullable_to_non_nullable
as String,holderStockholderCode: null == holderStockholderCode ? _self.holderStockholderCode : holderStockholderCode // ignore: cast_nullable_to_non_nullable
as String,shares: null == shares ? _self.shares : shares // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,indicator: null == indicator ? _self.indicator : indicator // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CertificateModel].
extension CertificateModelPatterns on CertificateModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CertificateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CertificateModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CertificateModel value)  $default,){
final _that = this;
switch (_that) {
case _CertificateModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CertificateModel value)?  $default,){
final _that = this;
switch (_that) {
case _CertificateModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String number,  String shareClassId,  String holderStockholderCode,  int shares,  String status,  String indicator,  String origin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CertificateModel() when $default != null:
return $default(_that.number,_that.shareClassId,_that.holderStockholderCode,_that.shares,_that.status,_that.indicator,_that.origin);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String number,  String shareClassId,  String holderStockholderCode,  int shares,  String status,  String indicator,  String origin)  $default,) {final _that = this;
switch (_that) {
case _CertificateModel():
return $default(_that.number,_that.shareClassId,_that.holderStockholderCode,_that.shares,_that.status,_that.indicator,_that.origin);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String number,  String shareClassId,  String holderStockholderCode,  int shares,  String status,  String indicator,  String origin)?  $default,) {final _that = this;
switch (_that) {
case _CertificateModel() when $default != null:
return $default(_that.number,_that.shareClassId,_that.holderStockholderCode,_that.shares,_that.status,_that.indicator,_that.origin);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CertificateModel extends CertificateModel {
  const _CertificateModel({required this.number, required this.shareClassId, required this.holderStockholderCode, required this.shares, required this.status, required this.indicator, this.origin = 'original'}): super._();
  factory _CertificateModel.fromJson(Map<String, dynamic> json) => _$CertificateModelFromJson(json);

@override final  String number;
@override final  String shareClassId;
@override final  String holderStockholderCode;
@override final  int shares;
@override final  String status;
@override final  String indicator;
@override@JsonKey() final  String origin;

/// Create a copy of CertificateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CertificateModelCopyWith<_CertificateModel> get copyWith => __$CertificateModelCopyWithImpl<_CertificateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CertificateModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CertificateModel&&(identical(other.number, number) || other.number == number)&&(identical(other.shareClassId, shareClassId) || other.shareClassId == shareClassId)&&(identical(other.holderStockholderCode, holderStockholderCode) || other.holderStockholderCode == holderStockholderCode)&&(identical(other.shares, shares) || other.shares == shares)&&(identical(other.status, status) || other.status == status)&&(identical(other.indicator, indicator) || other.indicator == indicator)&&(identical(other.origin, origin) || other.origin == origin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,number,shareClassId,holderStockholderCode,shares,status,indicator,origin);
}

@override
String toString() {
    return 'CertificateModel(number: $number, shareClassId: $shareClassId, holderStockholderCode: $holderStockholderCode, shares: $shares, status: $status, indicator: $indicator, origin: $origin)';
}


}

/// @nodoc
abstract mixin class _$CertificateModelCopyWith<$Res> implements $CertificateModelCopyWith<$Res> {
  factory _$CertificateModelCopyWith(_CertificateModel value, $Res Function(_CertificateModel) _then) = __$CertificateModelCopyWithImpl;
@override @useResult
$Res call({
 String number, String shareClassId, String holderStockholderCode, int shares, String status, String indicator, String origin
});




}
/// @nodoc
class __$CertificateModelCopyWithImpl<$Res>
    implements _$CertificateModelCopyWith<$Res> {
  __$CertificateModelCopyWithImpl(this._self, this._then);

  final _CertificateModel _self;
  final $Res Function(_CertificateModel) _then;

/// Create a copy of CertificateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? shareClassId = null,Object? holderStockholderCode = null,Object? shares = null,Object? status = null,Object? indicator = null,Object? origin = null,}) {
  return _then(_CertificateModel(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,shareClassId: null == shareClassId ? _self.shareClassId : shareClassId // ignore: cast_nullable_to_non_nullable
as String,holderStockholderCode: null == holderStockholderCode ? _self.holderStockholderCode : holderStockholderCode // ignore: cast_nullable_to_non_nullable
as String,shares: null == shares ? _self.shares : shares // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,indicator: null == indicator ? _self.indicator : indicator // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
