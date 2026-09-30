// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionLineModel {

 String get fromStockholderCode; String get toStockholderCode; String get shareClassId; int get shares; String get sourceCertificateNumber;
/// Create a copy of TransactionLineModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionLineModelCopyWith<TransactionLineModel> get copyWith => _$TransactionLineModelCopyWithImpl<TransactionLineModel>(this as TransactionLineModel, _$identity);

  /// Serializes this TransactionLineModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TransactionLineModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionLineModel&&(identical(other.fromStockholderCode, _this.fromStockholderCode) || other.fromStockholderCode == _this.fromStockholderCode)&&(identical(other.toStockholderCode, _this.toStockholderCode) || other.toStockholderCode == _this.toStockholderCode)&&(identical(other.shareClassId, _this.shareClassId) || other.shareClassId == _this.shareClassId)&&(identical(other.shares, _this.shares) || other.shares == _this.shares)&&(identical(other.sourceCertificateNumber, _this.sourceCertificateNumber) || other.sourceCertificateNumber == _this.sourceCertificateNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TransactionLineModel;
  return Object.hash(runtimeType,_this.fromStockholderCode,_this.toStockholderCode,_this.shareClassId,_this.shares,_this.sourceCertificateNumber);
}

@override
String toString() {
  final _this = this as TransactionLineModel;
  return 'TransactionLineModel(fromStockholderCode: ${_this.fromStockholderCode}, toStockholderCode: ${_this.toStockholderCode}, shareClassId: ${_this.shareClassId}, shares: ${_this.shares}, sourceCertificateNumber: ${_this.sourceCertificateNumber})';
}


}

/// @nodoc
abstract mixin class $TransactionLineModelCopyWith<$Res>  {
  factory $TransactionLineModelCopyWith(TransactionLineModel value, $Res Function(TransactionLineModel) _then) = _$TransactionLineModelCopyWithImpl;
@useResult
$Res call({
 String fromStockholderCode, String toStockholderCode, String shareClassId, int shares, String sourceCertificateNumber
});




}
/// @nodoc
class _$TransactionLineModelCopyWithImpl<$Res>
    implements $TransactionLineModelCopyWith<$Res> {
  _$TransactionLineModelCopyWithImpl(this._self, this._then);

  final TransactionLineModel _self;
  final $Res Function(TransactionLineModel) _then;

/// Create a copy of TransactionLineModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fromStockholderCode = null,Object? toStockholderCode = null,Object? shareClassId = null,Object? shares = null,Object? sourceCertificateNumber = null,}) {
  return _then(TransactionLineModel(
fromStockholderCode: null == fromStockholderCode ? _self.fromStockholderCode : fromStockholderCode // ignore: cast_nullable_to_non_nullable
as String,toStockholderCode: null == toStockholderCode ? _self.toStockholderCode : toStockholderCode // ignore: cast_nullable_to_non_nullable
as String,shareClassId: null == shareClassId ? _self.shareClassId : shareClassId // ignore: cast_nullable_to_non_nullable
as String,shares: null == shares ? _self.shares : shares // ignore: cast_nullable_to_non_nullable
as int,sourceCertificateNumber: null == sourceCertificateNumber ? _self.sourceCertificateNumber : sourceCertificateNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionLineModel].
extension TransactionLineModelPatterns on TransactionLineModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionLineModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionLineModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionLineModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionLineModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionLineModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionLineModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fromStockholderCode,  String toStockholderCode,  String shareClassId,  int shares,  String sourceCertificateNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionLineModel() when $default != null:
return $default(_that.fromStockholderCode,_that.toStockholderCode,_that.shareClassId,_that.shares,_that.sourceCertificateNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fromStockholderCode,  String toStockholderCode,  String shareClassId,  int shares,  String sourceCertificateNumber)  $default,) {final _that = this;
switch (_that) {
case _TransactionLineModel():
return $default(_that.fromStockholderCode,_that.toStockholderCode,_that.shareClassId,_that.shares,_that.sourceCertificateNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fromStockholderCode,  String toStockholderCode,  String shareClassId,  int shares,  String sourceCertificateNumber)?  $default,) {final _that = this;
switch (_that) {
case _TransactionLineModel() when $default != null:
return $default(_that.fromStockholderCode,_that.toStockholderCode,_that.shareClassId,_that.shares,_that.sourceCertificateNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionLineModel extends TransactionLineModel {
  const _TransactionLineModel({required this.fromStockholderCode, required this.toStockholderCode, required this.shareClassId, required this.shares, required this.sourceCertificateNumber}): super._();
  factory _TransactionLineModel.fromJson(Map<String, dynamic> json) => _$TransactionLineModelFromJson(json);

@override final  String fromStockholderCode;
@override final  String toStockholderCode;
@override final  String shareClassId;
@override final  int shares;
@override final  String sourceCertificateNumber;

/// Create a copy of TransactionLineModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionLineModelCopyWith<_TransactionLineModel> get copyWith => __$TransactionLineModelCopyWithImpl<_TransactionLineModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionLineModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionLineModel&&(identical(other.fromStockholderCode, fromStockholderCode) || other.fromStockholderCode == fromStockholderCode)&&(identical(other.toStockholderCode, toStockholderCode) || other.toStockholderCode == toStockholderCode)&&(identical(other.shareClassId, shareClassId) || other.shareClassId == shareClassId)&&(identical(other.shares, shares) || other.shares == shares)&&(identical(other.sourceCertificateNumber, sourceCertificateNumber) || other.sourceCertificateNumber == sourceCertificateNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fromStockholderCode,toStockholderCode,shareClassId,shares,sourceCertificateNumber);
}

@override
String toString() {
    return 'TransactionLineModel(fromStockholderCode: $fromStockholderCode, toStockholderCode: $toStockholderCode, shareClassId: $shareClassId, shares: $shares, sourceCertificateNumber: $sourceCertificateNumber)';
}


}

/// @nodoc
abstract mixin class _$TransactionLineModelCopyWith<$Res> implements $TransactionLineModelCopyWith<$Res> {
  factory _$TransactionLineModelCopyWith(_TransactionLineModel value, $Res Function(_TransactionLineModel) _then) = __$TransactionLineModelCopyWithImpl;
@override @useResult
$Res call({
 String fromStockholderCode, String toStockholderCode, String shareClassId, int shares, String sourceCertificateNumber
});




}
/// @nodoc
class __$TransactionLineModelCopyWithImpl<$Res>
    implements _$TransactionLineModelCopyWith<$Res> {
  __$TransactionLineModelCopyWithImpl(this._self, this._then);

  final _TransactionLineModel _self;
  final $Res Function(_TransactionLineModel) _then;

/// Create a copy of TransactionLineModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fromStockholderCode = null,Object? toStockholderCode = null,Object? shareClassId = null,Object? shares = null,Object? sourceCertificateNumber = null,}) {
  return _then(_TransactionLineModel(
fromStockholderCode: null == fromStockholderCode ? _self.fromStockholderCode : fromStockholderCode // ignore: cast_nullable_to_non_nullable
as String,toStockholderCode: null == toStockholderCode ? _self.toStockholderCode : toStockholderCode // ignore: cast_nullable_to_non_nullable
as String,shareClassId: null == shareClassId ? _self.shareClassId : shareClassId // ignore: cast_nullable_to_non_nullable
as String,shares: null == shares ? _self.shares : shares // ignore: cast_nullable_to_non_nullable
as int,sourceCertificateNumber: null == sourceCertificateNumber ? _self.sourceCertificateNumber : sourceCertificateNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BreakdownEntryModel {

 String get stockholderCode; String get shareClassId; int get sharesBefore; int get delta; int get sharesAfter;
/// Create a copy of BreakdownEntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BreakdownEntryModelCopyWith<BreakdownEntryModel> get copyWith => _$BreakdownEntryModelCopyWithImpl<BreakdownEntryModel>(this as BreakdownEntryModel, _$identity);

  /// Serializes this BreakdownEntryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BreakdownEntryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BreakdownEntryModel&&(identical(other.stockholderCode, _this.stockholderCode) || other.stockholderCode == _this.stockholderCode)&&(identical(other.shareClassId, _this.shareClassId) || other.shareClassId == _this.shareClassId)&&(identical(other.sharesBefore, _this.sharesBefore) || other.sharesBefore == _this.sharesBefore)&&(identical(other.delta, _this.delta) || other.delta == _this.delta)&&(identical(other.sharesAfter, _this.sharesAfter) || other.sharesAfter == _this.sharesAfter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BreakdownEntryModel;
  return Object.hash(runtimeType,_this.stockholderCode,_this.shareClassId,_this.sharesBefore,_this.delta,_this.sharesAfter);
}

@override
String toString() {
  final _this = this as BreakdownEntryModel;
  return 'BreakdownEntryModel(stockholderCode: ${_this.stockholderCode}, shareClassId: ${_this.shareClassId}, sharesBefore: ${_this.sharesBefore}, delta: ${_this.delta}, sharesAfter: ${_this.sharesAfter})';
}


}

/// @nodoc
abstract mixin class $BreakdownEntryModelCopyWith<$Res>  {
  factory $BreakdownEntryModelCopyWith(BreakdownEntryModel value, $Res Function(BreakdownEntryModel) _then) = _$BreakdownEntryModelCopyWithImpl;
@useResult
$Res call({
 String stockholderCode, String shareClassId, int sharesBefore, int delta, int sharesAfter
});




}
/// @nodoc
class _$BreakdownEntryModelCopyWithImpl<$Res>
    implements $BreakdownEntryModelCopyWith<$Res> {
  _$BreakdownEntryModelCopyWithImpl(this._self, this._then);

  final BreakdownEntryModel _self;
  final $Res Function(BreakdownEntryModel) _then;

/// Create a copy of BreakdownEntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stockholderCode = null,Object? shareClassId = null,Object? sharesBefore = null,Object? delta = null,Object? sharesAfter = null,}) {
  return _then(BreakdownEntryModel(
stockholderCode: null == stockholderCode ? _self.stockholderCode : stockholderCode // ignore: cast_nullable_to_non_nullable
as String,shareClassId: null == shareClassId ? _self.shareClassId : shareClassId // ignore: cast_nullable_to_non_nullable
as String,sharesBefore: null == sharesBefore ? _self.sharesBefore : sharesBefore // ignore: cast_nullable_to_non_nullable
as int,delta: null == delta ? _self.delta : delta // ignore: cast_nullable_to_non_nullable
as int,sharesAfter: null == sharesAfter ? _self.sharesAfter : sharesAfter // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BreakdownEntryModel].
extension BreakdownEntryModelPatterns on BreakdownEntryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BreakdownEntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BreakdownEntryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BreakdownEntryModel value)  $default,){
final _that = this;
switch (_that) {
case _BreakdownEntryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BreakdownEntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _BreakdownEntryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String stockholderCode,  String shareClassId,  int sharesBefore,  int delta,  int sharesAfter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BreakdownEntryModel() when $default != null:
return $default(_that.stockholderCode,_that.shareClassId,_that.sharesBefore,_that.delta,_that.sharesAfter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String stockholderCode,  String shareClassId,  int sharesBefore,  int delta,  int sharesAfter)  $default,) {final _that = this;
switch (_that) {
case _BreakdownEntryModel():
return $default(_that.stockholderCode,_that.shareClassId,_that.sharesBefore,_that.delta,_that.sharesAfter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String stockholderCode,  String shareClassId,  int sharesBefore,  int delta,  int sharesAfter)?  $default,) {final _that = this;
switch (_that) {
case _BreakdownEntryModel() when $default != null:
return $default(_that.stockholderCode,_that.shareClassId,_that.sharesBefore,_that.delta,_that.sharesAfter);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BreakdownEntryModel extends BreakdownEntryModel {
  const _BreakdownEntryModel({required this.stockholderCode, required this.shareClassId, required this.sharesBefore, required this.delta, required this.sharesAfter}): super._();
  factory _BreakdownEntryModel.fromJson(Map<String, dynamic> json) => _$BreakdownEntryModelFromJson(json);

@override final  String stockholderCode;
@override final  String shareClassId;
@override final  int sharesBefore;
@override final  int delta;
@override final  int sharesAfter;

/// Create a copy of BreakdownEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BreakdownEntryModelCopyWith<_BreakdownEntryModel> get copyWith => __$BreakdownEntryModelCopyWithImpl<_BreakdownEntryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BreakdownEntryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BreakdownEntryModel&&(identical(other.stockholderCode, stockholderCode) || other.stockholderCode == stockholderCode)&&(identical(other.shareClassId, shareClassId) || other.shareClassId == shareClassId)&&(identical(other.sharesBefore, sharesBefore) || other.sharesBefore == sharesBefore)&&(identical(other.delta, delta) || other.delta == delta)&&(identical(other.sharesAfter, sharesAfter) || other.sharesAfter == sharesAfter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,stockholderCode,shareClassId,sharesBefore,delta,sharesAfter);
}

@override
String toString() {
    return 'BreakdownEntryModel(stockholderCode: $stockholderCode, shareClassId: $shareClassId, sharesBefore: $sharesBefore, delta: $delta, sharesAfter: $sharesAfter)';
}


}

/// @nodoc
abstract mixin class _$BreakdownEntryModelCopyWith<$Res> implements $BreakdownEntryModelCopyWith<$Res> {
  factory _$BreakdownEntryModelCopyWith(_BreakdownEntryModel value, $Res Function(_BreakdownEntryModel) _then) = __$BreakdownEntryModelCopyWithImpl;
@override @useResult
$Res call({
 String stockholderCode, String shareClassId, int sharesBefore, int delta, int sharesAfter
});




}
/// @nodoc
class __$BreakdownEntryModelCopyWithImpl<$Res>
    implements _$BreakdownEntryModelCopyWith<$Res> {
  __$BreakdownEntryModelCopyWithImpl(this._self, this._then);

  final _BreakdownEntryModel _self;
  final $Res Function(_BreakdownEntryModel) _then;

/// Create a copy of BreakdownEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stockholderCode = null,Object? shareClassId = null,Object? sharesBefore = null,Object? delta = null,Object? sharesAfter = null,}) {
  return _then(_BreakdownEntryModel(
stockholderCode: null == stockholderCode ? _self.stockholderCode : stockholderCode // ignore: cast_nullable_to_non_nullable
as String,shareClassId: null == shareClassId ? _self.shareClassId : shareClassId // ignore: cast_nullable_to_non_nullable
as String,sharesBefore: null == sharesBefore ? _self.sharesBefore : sharesBefore // ignore: cast_nullable_to_non_nullable
as int,delta: null == delta ? _self.delta : delta // ignore: cast_nullable_to_non_nullable
as int,sharesAfter: null == sharesAfter ? _self.sharesAfter : sharesAfter // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ApprovalStepModel {

 int get level; String get requiredRole; String get decision; String? get actor; String? get reason; String? get decidedAt;
/// Create a copy of ApprovalStepModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApprovalStepModelCopyWith<ApprovalStepModel> get copyWith => _$ApprovalStepModelCopyWithImpl<ApprovalStepModel>(this as ApprovalStepModel, _$identity);

  /// Serializes this ApprovalStepModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ApprovalStepModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApprovalStepModel&&(identical(other.level, _this.level) || other.level == _this.level)&&(identical(other.requiredRole, _this.requiredRole) || other.requiredRole == _this.requiredRole)&&(identical(other.decision, _this.decision) || other.decision == _this.decision)&&(identical(other.actor, _this.actor) || other.actor == _this.actor)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.decidedAt, _this.decidedAt) || other.decidedAt == _this.decidedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ApprovalStepModel;
  return Object.hash(runtimeType,_this.level,_this.requiredRole,_this.decision,_this.actor,_this.reason,_this.decidedAt);
}

@override
String toString() {
  final _this = this as ApprovalStepModel;
  return 'ApprovalStepModel(level: ${_this.level}, requiredRole: ${_this.requiredRole}, decision: ${_this.decision}, actor: ${_this.actor}, reason: ${_this.reason}, decidedAt: ${_this.decidedAt})';
}


}

/// @nodoc
abstract mixin class $ApprovalStepModelCopyWith<$Res>  {
  factory $ApprovalStepModelCopyWith(ApprovalStepModel value, $Res Function(ApprovalStepModel) _then) = _$ApprovalStepModelCopyWithImpl;
@useResult
$Res call({
 int level, String requiredRole, String decision, String? actor, String? reason, String? decidedAt
});




}
/// @nodoc
class _$ApprovalStepModelCopyWithImpl<$Res>
    implements $ApprovalStepModelCopyWith<$Res> {
  _$ApprovalStepModelCopyWithImpl(this._self, this._then);

  final ApprovalStepModel _self;
  final $Res Function(ApprovalStepModel) _then;

/// Create a copy of ApprovalStepModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? level = null,Object? requiredRole = null,Object? decision = null,Object? actor = freezed,Object? reason = freezed,Object? decidedAt = freezed,}) {
  return _then(ApprovalStepModel(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,requiredRole: null == requiredRole ? _self.requiredRole : requiredRole // ignore: cast_nullable_to_non_nullable
as String,decision: null == decision ? _self.decision : decision // ignore: cast_nullable_to_non_nullable
as String,actor: freezed == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,decidedAt: freezed == decidedAt ? _self.decidedAt : decidedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApprovalStepModel].
extension ApprovalStepModelPatterns on ApprovalStepModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApprovalStepModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApprovalStepModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApprovalStepModel value)  $default,){
final _that = this;
switch (_that) {
case _ApprovalStepModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApprovalStepModel value)?  $default,){
final _that = this;
switch (_that) {
case _ApprovalStepModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int level,  String requiredRole,  String decision,  String? actor,  String? reason,  String? decidedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApprovalStepModel() when $default != null:
return $default(_that.level,_that.requiredRole,_that.decision,_that.actor,_that.reason,_that.decidedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int level,  String requiredRole,  String decision,  String? actor,  String? reason,  String? decidedAt)  $default,) {final _that = this;
switch (_that) {
case _ApprovalStepModel():
return $default(_that.level,_that.requiredRole,_that.decision,_that.actor,_that.reason,_that.decidedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int level,  String requiredRole,  String decision,  String? actor,  String? reason,  String? decidedAt)?  $default,) {final _that = this;
switch (_that) {
case _ApprovalStepModel() when $default != null:
return $default(_that.level,_that.requiredRole,_that.decision,_that.actor,_that.reason,_that.decidedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApprovalStepModel extends ApprovalStepModel {
  const _ApprovalStepModel({required this.level, required this.requiredRole, required this.decision, this.actor, this.reason, this.decidedAt}): super._();
  factory _ApprovalStepModel.fromJson(Map<String, dynamic> json) => _$ApprovalStepModelFromJson(json);

@override final  int level;
@override final  String requiredRole;
@override final  String decision;
@override final  String? actor;
@override final  String? reason;
@override final  String? decidedAt;

/// Create a copy of ApprovalStepModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApprovalStepModelCopyWith<_ApprovalStepModel> get copyWith => __$ApprovalStepModelCopyWithImpl<_ApprovalStepModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApprovalStepModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApprovalStepModel&&(identical(other.level, level) || other.level == level)&&(identical(other.requiredRole, requiredRole) || other.requiredRole == requiredRole)&&(identical(other.decision, decision) || other.decision == decision)&&(identical(other.actor, actor) || other.actor == actor)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.decidedAt, decidedAt) || other.decidedAt == decidedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,level,requiredRole,decision,actor,reason,decidedAt);
}

@override
String toString() {
    return 'ApprovalStepModel(level: $level, requiredRole: $requiredRole, decision: $decision, actor: $actor, reason: $reason, decidedAt: $decidedAt)';
}


}

/// @nodoc
abstract mixin class _$ApprovalStepModelCopyWith<$Res> implements $ApprovalStepModelCopyWith<$Res> {
  factory _$ApprovalStepModelCopyWith(_ApprovalStepModel value, $Res Function(_ApprovalStepModel) _then) = __$ApprovalStepModelCopyWithImpl;
@override @useResult
$Res call({
 int level, String requiredRole, String decision, String? actor, String? reason, String? decidedAt
});




}
/// @nodoc
class __$ApprovalStepModelCopyWithImpl<$Res>
    implements _$ApprovalStepModelCopyWith<$Res> {
  __$ApprovalStepModelCopyWithImpl(this._self, this._then);

  final _ApprovalStepModel _self;
  final $Res Function(_ApprovalStepModel) _then;

/// Create a copy of ApprovalStepModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? level = null,Object? requiredRole = null,Object? decision = null,Object? actor = freezed,Object? reason = freezed,Object? decidedAt = freezed,}) {
  return _then(_ApprovalStepModel(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,requiredRole: null == requiredRole ? _self.requiredRole : requiredRole // ignore: cast_nullable_to_non_nullable
as String,decision: null == decision ? _self.decision : decision // ignore: cast_nullable_to_non_nullable
as String,actor: freezed == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,decidedAt: freezed == decidedAt ? _self.decidedAt : decidedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TransactionModel {

 String get id; String get type; String get status; String get companyCode; String get transactionDate; String get transferType; String? get srfNo; String? get remarks; bool get exception; String? get postedAt; List<TransactionLineModel> get lines; List<BreakdownEntryModel> get breakdown; List<ApprovalStepModel> get approvals;
/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionModelCopyWith<TransactionModel> get copyWith => _$TransactionModelCopyWithImpl<TransactionModel>(this as TransactionModel, _$identity);

  /// Serializes this TransactionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TransactionModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.companyCode, _this.companyCode) || other.companyCode == _this.companyCode)&&(identical(other.transactionDate, _this.transactionDate) || other.transactionDate == _this.transactionDate)&&(identical(other.transferType, _this.transferType) || other.transferType == _this.transferType)&&(identical(other.srfNo, _this.srfNo) || other.srfNo == _this.srfNo)&&(identical(other.remarks, _this.remarks) || other.remarks == _this.remarks)&&(identical(other.exception, _this.exception) || other.exception == _this.exception)&&(identical(other.postedAt, _this.postedAt) || other.postedAt == _this.postedAt)&&const DeepCollectionEquality().equals(other.lines, _this.lines)&&const DeepCollectionEquality().equals(other.breakdown, _this.breakdown)&&const DeepCollectionEquality().equals(other.approvals, _this.approvals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TransactionModel;
  return Object.hash(runtimeType,_this.id,_this.type,_this.status,_this.companyCode,_this.transactionDate,_this.transferType,_this.srfNo,_this.remarks,_this.exception,_this.postedAt,const DeepCollectionEquality().hash(_this.lines),const DeepCollectionEquality().hash(_this.breakdown),const DeepCollectionEquality().hash(_this.approvals));
}

@override
String toString() {
  final _this = this as TransactionModel;
  return 'TransactionModel(id: ${_this.id}, type: ${_this.type}, status: ${_this.status}, companyCode: ${_this.companyCode}, transactionDate: ${_this.transactionDate}, transferType: ${_this.transferType}, srfNo: ${_this.srfNo}, remarks: ${_this.remarks}, exception: ${_this.exception}, postedAt: ${_this.postedAt}, lines: ${_this.lines}, breakdown: ${_this.breakdown}, approvals: ${_this.approvals})';
}


}

/// @nodoc
abstract mixin class $TransactionModelCopyWith<$Res>  {
  factory $TransactionModelCopyWith(TransactionModel value, $Res Function(TransactionModel) _then) = _$TransactionModelCopyWithImpl;
@useResult
$Res call({
 String id, String type, String status, String companyCode, String transactionDate, String transferType, String? srfNo, String? remarks, bool exception, String? postedAt, List<TransactionLineModel> lines, List<BreakdownEntryModel> breakdown, List<ApprovalStepModel> approvals
});




}
/// @nodoc
class _$TransactionModelCopyWithImpl<$Res>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._self, this._then);

  final TransactionModel _self;
  final $Res Function(TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? status = null,Object? companyCode = null,Object? transactionDate = null,Object? transferType = null,Object? srfNo = freezed,Object? remarks = freezed,Object? exception = null,Object? postedAt = freezed,Object? lines = null,Object? breakdown = null,Object? approvals = null,}) {
  return _then(TransactionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,companyCode: null == companyCode ? _self.companyCode : companyCode // ignore: cast_nullable_to_non_nullable
as String,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as String,transferType: null == transferType ? _self.transferType : transferType // ignore: cast_nullable_to_non_nullable
as String,srfNo: freezed == srfNo ? _self.srfNo : srfNo // ignore: cast_nullable_to_non_nullable
as String?,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,exception: null == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as bool,postedAt: freezed == postedAt ? _self.postedAt : postedAt // ignore: cast_nullable_to_non_nullable
as String?,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<TransactionLineModel>,breakdown: null == breakdown ? _self.breakdown : breakdown // ignore: cast_nullable_to_non_nullable
as List<BreakdownEntryModel>,approvals: null == approvals ? _self.approvals : approvals // ignore: cast_nullable_to_non_nullable
as List<ApprovalStepModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionModel].
extension TransactionModelPatterns on TransactionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  String status,  String companyCode,  String transactionDate,  String transferType,  String? srfNo,  String? remarks,  bool exception,  String? postedAt,  List<TransactionLineModel> lines,  List<BreakdownEntryModel> breakdown,  List<ApprovalStepModel> approvals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that.id,_that.type,_that.status,_that.companyCode,_that.transactionDate,_that.transferType,_that.srfNo,_that.remarks,_that.exception,_that.postedAt,_that.lines,_that.breakdown,_that.approvals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  String status,  String companyCode,  String transactionDate,  String transferType,  String? srfNo,  String? remarks,  bool exception,  String? postedAt,  List<TransactionLineModel> lines,  List<BreakdownEntryModel> breakdown,  List<ApprovalStepModel> approvals)  $default,) {final _that = this;
switch (_that) {
case _TransactionModel():
return $default(_that.id,_that.type,_that.status,_that.companyCode,_that.transactionDate,_that.transferType,_that.srfNo,_that.remarks,_that.exception,_that.postedAt,_that.lines,_that.breakdown,_that.approvals);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  String status,  String companyCode,  String transactionDate,  String transferType,  String? srfNo,  String? remarks,  bool exception,  String? postedAt,  List<TransactionLineModel> lines,  List<BreakdownEntryModel> breakdown,  List<ApprovalStepModel> approvals)?  $default,) {final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that.id,_that.type,_that.status,_that.companyCode,_that.transactionDate,_that.transferType,_that.srfNo,_that.remarks,_that.exception,_that.postedAt,_that.lines,_that.breakdown,_that.approvals);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionModel extends TransactionModel {
  const _TransactionModel({required this.id, required this.type, required this.status, required this.companyCode, required this.transactionDate, required this.transferType, this.srfNo, this.remarks, this.exception = false, this.postedAt,  List<TransactionLineModel> lines = const [],  List<BreakdownEntryModel> breakdown = const [],  List<ApprovalStepModel> approvals = const []}): _lines = lines,_breakdown = breakdown,_approvals = approvals,super._();
  factory _TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);

@override final  String id;
@override final  String type;
@override final  String status;
@override final  String companyCode;
@override final  String transactionDate;
@override final  String transferType;
@override final  String? srfNo;
@override final  String? remarks;
@override@JsonKey() final  bool exception;
@override final  String? postedAt;
 final  List<TransactionLineModel> _lines;
@override@JsonKey() List<TransactionLineModel> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

 final  List<BreakdownEntryModel> _breakdown;
@override@JsonKey() List<BreakdownEntryModel> get breakdown {
  if (_breakdown is EqualUnmodifiableListView) return _breakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_breakdown);
}

 final  List<ApprovalStepModel> _approvals;
@override@JsonKey() List<ApprovalStepModel> get approvals {
  if (_approvals is EqualUnmodifiableListView) return _approvals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_approvals);
}


/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionModelCopyWith<_TransactionModel> get copyWith => __$TransactionModelCopyWithImpl<_TransactionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.companyCode, companyCode) || other.companyCode == companyCode)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.transferType, transferType) || other.transferType == transferType)&&(identical(other.srfNo, srfNo) || other.srfNo == srfNo)&&(identical(other.remarks, remarks) || other.remarks == remarks)&&(identical(other.exception, exception) || other.exception == exception)&&(identical(other.postedAt, postedAt) || other.postedAt == postedAt)&&const DeepCollectionEquality().equals(other.lines, _lines)&&const DeepCollectionEquality().equals(other.breakdown, _breakdown)&&const DeepCollectionEquality().equals(other.approvals, _approvals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,status,companyCode,transactionDate,transferType,srfNo,remarks,exception,postedAt,const DeepCollectionEquality().hash(_lines),const DeepCollectionEquality().hash(_breakdown),const DeepCollectionEquality().hash(_approvals));
}

@override
String toString() {
    return 'TransactionModel(id: $id, type: $type, status: $status, companyCode: $companyCode, transactionDate: $transactionDate, transferType: $transferType, srfNo: $srfNo, remarks: $remarks, exception: $exception, postedAt: $postedAt, lines: $lines, breakdown: $breakdown, approvals: $approvals)';
}


}

/// @nodoc
abstract mixin class _$TransactionModelCopyWith<$Res> implements $TransactionModelCopyWith<$Res> {
  factory _$TransactionModelCopyWith(_TransactionModel value, $Res Function(_TransactionModel) _then) = __$TransactionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, String status, String companyCode, String transactionDate, String transferType, String? srfNo, String? remarks, bool exception, String? postedAt, List<TransactionLineModel> lines, List<BreakdownEntryModel> breakdown, List<ApprovalStepModel> approvals
});




}
/// @nodoc
class __$TransactionModelCopyWithImpl<$Res>
    implements _$TransactionModelCopyWith<$Res> {
  __$TransactionModelCopyWithImpl(this._self, this._then);

  final _TransactionModel _self;
  final $Res Function(_TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? status = null,Object? companyCode = null,Object? transactionDate = null,Object? transferType = null,Object? srfNo = freezed,Object? remarks = freezed,Object? exception = null,Object? postedAt = freezed,Object? lines = null,Object? breakdown = null,Object? approvals = null,}) {
  return _then(_TransactionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,companyCode: null == companyCode ? _self.companyCode : companyCode // ignore: cast_nullable_to_non_nullable
as String,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as String,transferType: null == transferType ? _self.transferType : transferType // ignore: cast_nullable_to_non_nullable
as String,srfNo: freezed == srfNo ? _self.srfNo : srfNo // ignore: cast_nullable_to_non_nullable
as String?,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,exception: null == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as bool,postedAt: freezed == postedAt ? _self.postedAt : postedAt // ignore: cast_nullable_to_non_nullable
as String?,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<TransactionLineModel>,breakdown: null == breakdown ? _self._breakdown : breakdown // ignore: cast_nullable_to_non_nullable
as List<BreakdownEntryModel>,approvals: null == approvals ? _self._approvals : approvals // ignore: cast_nullable_to_non_nullable
as List<ApprovalStepModel>,
  ));
}


}


/// @nodoc
mixin _$TransferLineRequestModel {

 String get fromStockholderCode; String get toStockholderCode; String get shareClassId; int get shares; String get sourceCertificateNumber;
/// Create a copy of TransferLineRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferLineRequestModelCopyWith<TransferLineRequestModel> get copyWith => _$TransferLineRequestModelCopyWithImpl<TransferLineRequestModel>(this as TransferLineRequestModel, _$identity);

  /// Serializes this TransferLineRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TransferLineRequestModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferLineRequestModel&&(identical(other.fromStockholderCode, _this.fromStockholderCode) || other.fromStockholderCode == _this.fromStockholderCode)&&(identical(other.toStockholderCode, _this.toStockholderCode) || other.toStockholderCode == _this.toStockholderCode)&&(identical(other.shareClassId, _this.shareClassId) || other.shareClassId == _this.shareClassId)&&(identical(other.shares, _this.shares) || other.shares == _this.shares)&&(identical(other.sourceCertificateNumber, _this.sourceCertificateNumber) || other.sourceCertificateNumber == _this.sourceCertificateNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TransferLineRequestModel;
  return Object.hash(runtimeType,_this.fromStockholderCode,_this.toStockholderCode,_this.shareClassId,_this.shares,_this.sourceCertificateNumber);
}

@override
String toString() {
  final _this = this as TransferLineRequestModel;
  return 'TransferLineRequestModel(fromStockholderCode: ${_this.fromStockholderCode}, toStockholderCode: ${_this.toStockholderCode}, shareClassId: ${_this.shareClassId}, shares: ${_this.shares}, sourceCertificateNumber: ${_this.sourceCertificateNumber})';
}


}

/// @nodoc
abstract mixin class $TransferLineRequestModelCopyWith<$Res>  {
  factory $TransferLineRequestModelCopyWith(TransferLineRequestModel value, $Res Function(TransferLineRequestModel) _then) = _$TransferLineRequestModelCopyWithImpl;
@useResult
$Res call({
 String fromStockholderCode, String toStockholderCode, String shareClassId, int shares, String sourceCertificateNumber
});




}
/// @nodoc
class _$TransferLineRequestModelCopyWithImpl<$Res>
    implements $TransferLineRequestModelCopyWith<$Res> {
  _$TransferLineRequestModelCopyWithImpl(this._self, this._then);

  final TransferLineRequestModel _self;
  final $Res Function(TransferLineRequestModel) _then;

/// Create a copy of TransferLineRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fromStockholderCode = null,Object? toStockholderCode = null,Object? shareClassId = null,Object? shares = null,Object? sourceCertificateNumber = null,}) {
  return _then(TransferLineRequestModel(
fromStockholderCode: null == fromStockholderCode ? _self.fromStockholderCode : fromStockholderCode // ignore: cast_nullable_to_non_nullable
as String,toStockholderCode: null == toStockholderCode ? _self.toStockholderCode : toStockholderCode // ignore: cast_nullable_to_non_nullable
as String,shareClassId: null == shareClassId ? _self.shareClassId : shareClassId // ignore: cast_nullable_to_non_nullable
as String,shares: null == shares ? _self.shares : shares // ignore: cast_nullable_to_non_nullable
as int,sourceCertificateNumber: null == sourceCertificateNumber ? _self.sourceCertificateNumber : sourceCertificateNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TransferLineRequestModel].
extension TransferLineRequestModelPatterns on TransferLineRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransferLineRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransferLineRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransferLineRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _TransferLineRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransferLineRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransferLineRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fromStockholderCode,  String toStockholderCode,  String shareClassId,  int shares,  String sourceCertificateNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferLineRequestModel() when $default != null:
return $default(_that.fromStockholderCode,_that.toStockholderCode,_that.shareClassId,_that.shares,_that.sourceCertificateNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fromStockholderCode,  String toStockholderCode,  String shareClassId,  int shares,  String sourceCertificateNumber)  $default,) {final _that = this;
switch (_that) {
case _TransferLineRequestModel():
return $default(_that.fromStockholderCode,_that.toStockholderCode,_that.shareClassId,_that.shares,_that.sourceCertificateNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fromStockholderCode,  String toStockholderCode,  String shareClassId,  int shares,  String sourceCertificateNumber)?  $default,) {final _that = this;
switch (_that) {
case _TransferLineRequestModel() when $default != null:
return $default(_that.fromStockholderCode,_that.toStockholderCode,_that.shareClassId,_that.shares,_that.sourceCertificateNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransferLineRequestModel implements TransferLineRequestModel {
  const _TransferLineRequestModel({required this.fromStockholderCode, required this.toStockholderCode, required this.shareClassId, required this.shares, required this.sourceCertificateNumber});
  factory _TransferLineRequestModel.fromJson(Map<String, dynamic> json) => _$TransferLineRequestModelFromJson(json);

@override final  String fromStockholderCode;
@override final  String toStockholderCode;
@override final  String shareClassId;
@override final  int shares;
@override final  String sourceCertificateNumber;

/// Create a copy of TransferLineRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferLineRequestModelCopyWith<_TransferLineRequestModel> get copyWith => __$TransferLineRequestModelCopyWithImpl<_TransferLineRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferLineRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferLineRequestModel&&(identical(other.fromStockholderCode, fromStockholderCode) || other.fromStockholderCode == fromStockholderCode)&&(identical(other.toStockholderCode, toStockholderCode) || other.toStockholderCode == toStockholderCode)&&(identical(other.shareClassId, shareClassId) || other.shareClassId == shareClassId)&&(identical(other.shares, shares) || other.shares == shares)&&(identical(other.sourceCertificateNumber, sourceCertificateNumber) || other.sourceCertificateNumber == sourceCertificateNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fromStockholderCode,toStockholderCode,shareClassId,shares,sourceCertificateNumber);
}

@override
String toString() {
    return 'TransferLineRequestModel(fromStockholderCode: $fromStockholderCode, toStockholderCode: $toStockholderCode, shareClassId: $shareClassId, shares: $shares, sourceCertificateNumber: $sourceCertificateNumber)';
}


}

/// @nodoc
abstract mixin class _$TransferLineRequestModelCopyWith<$Res> implements $TransferLineRequestModelCopyWith<$Res> {
  factory _$TransferLineRequestModelCopyWith(_TransferLineRequestModel value, $Res Function(_TransferLineRequestModel) _then) = __$TransferLineRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String fromStockholderCode, String toStockholderCode, String shareClassId, int shares, String sourceCertificateNumber
});




}
/// @nodoc
class __$TransferLineRequestModelCopyWithImpl<$Res>
    implements _$TransferLineRequestModelCopyWith<$Res> {
  __$TransferLineRequestModelCopyWithImpl(this._self, this._then);

  final _TransferLineRequestModel _self;
  final $Res Function(_TransferLineRequestModel) _then;

/// Create a copy of TransferLineRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fromStockholderCode = null,Object? toStockholderCode = null,Object? shareClassId = null,Object? shares = null,Object? sourceCertificateNumber = null,}) {
  return _then(_TransferLineRequestModel(
fromStockholderCode: null == fromStockholderCode ? _self.fromStockholderCode : fromStockholderCode // ignore: cast_nullable_to_non_nullable
as String,toStockholderCode: null == toStockholderCode ? _self.toStockholderCode : toStockholderCode // ignore: cast_nullable_to_non_nullable
as String,shareClassId: null == shareClassId ? _self.shareClassId : shareClassId // ignore: cast_nullable_to_non_nullable
as String,shares: null == shares ? _self.shares : shares // ignore: cast_nullable_to_non_nullable
as int,sourceCertificateNumber: null == sourceCertificateNumber ? _self.sourceCertificateNumber : sourceCertificateNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TransferRequestModel {

 String get companyCode; String get transactionDate; String get transferType; List<TransferLineRequestModel> get lines; String? get srfNo; String? get remarks; bool get exception;
/// Create a copy of TransferRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferRequestModelCopyWith<TransferRequestModel> get copyWith => _$TransferRequestModelCopyWithImpl<TransferRequestModel>(this as TransferRequestModel, _$identity);

  /// Serializes this TransferRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TransferRequestModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferRequestModel&&(identical(other.companyCode, _this.companyCode) || other.companyCode == _this.companyCode)&&(identical(other.transactionDate, _this.transactionDate) || other.transactionDate == _this.transactionDate)&&(identical(other.transferType, _this.transferType) || other.transferType == _this.transferType)&&const DeepCollectionEquality().equals(other.lines, _this.lines)&&(identical(other.srfNo, _this.srfNo) || other.srfNo == _this.srfNo)&&(identical(other.remarks, _this.remarks) || other.remarks == _this.remarks)&&(identical(other.exception, _this.exception) || other.exception == _this.exception));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TransferRequestModel;
  return Object.hash(runtimeType,_this.companyCode,_this.transactionDate,_this.transferType,const DeepCollectionEquality().hash(_this.lines),_this.srfNo,_this.remarks,_this.exception);
}

@override
String toString() {
  final _this = this as TransferRequestModel;
  return 'TransferRequestModel(companyCode: ${_this.companyCode}, transactionDate: ${_this.transactionDate}, transferType: ${_this.transferType}, lines: ${_this.lines}, srfNo: ${_this.srfNo}, remarks: ${_this.remarks}, exception: ${_this.exception})';
}


}

/// @nodoc
abstract mixin class $TransferRequestModelCopyWith<$Res>  {
  factory $TransferRequestModelCopyWith(TransferRequestModel value, $Res Function(TransferRequestModel) _then) = _$TransferRequestModelCopyWithImpl;
@useResult
$Res call({
 String companyCode, String transactionDate, String transferType, List<TransferLineRequestModel> lines, String? srfNo, String? remarks, bool exception
});




}
/// @nodoc
class _$TransferRequestModelCopyWithImpl<$Res>
    implements $TransferRequestModelCopyWith<$Res> {
  _$TransferRequestModelCopyWithImpl(this._self, this._then);

  final TransferRequestModel _self;
  final $Res Function(TransferRequestModel) _then;

/// Create a copy of TransferRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companyCode = null,Object? transactionDate = null,Object? transferType = null,Object? lines = null,Object? srfNo = freezed,Object? remarks = freezed,Object? exception = null,}) {
  return _then(TransferRequestModel(
companyCode: null == companyCode ? _self.companyCode : companyCode // ignore: cast_nullable_to_non_nullable
as String,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as String,transferType: null == transferType ? _self.transferType : transferType // ignore: cast_nullable_to_non_nullable
as String,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<TransferLineRequestModel>,srfNo: freezed == srfNo ? _self.srfNo : srfNo // ignore: cast_nullable_to_non_nullable
as String?,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,exception: null == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TransferRequestModel].
extension TransferRequestModelPatterns on TransferRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransferRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransferRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransferRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _TransferRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransferRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransferRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String companyCode,  String transactionDate,  String transferType,  List<TransferLineRequestModel> lines,  String? srfNo,  String? remarks,  bool exception)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferRequestModel() when $default != null:
return $default(_that.companyCode,_that.transactionDate,_that.transferType,_that.lines,_that.srfNo,_that.remarks,_that.exception);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String companyCode,  String transactionDate,  String transferType,  List<TransferLineRequestModel> lines,  String? srfNo,  String? remarks,  bool exception)  $default,) {final _that = this;
switch (_that) {
case _TransferRequestModel():
return $default(_that.companyCode,_that.transactionDate,_that.transferType,_that.lines,_that.srfNo,_that.remarks,_that.exception);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String companyCode,  String transactionDate,  String transferType,  List<TransferLineRequestModel> lines,  String? srfNo,  String? remarks,  bool exception)?  $default,) {final _that = this;
switch (_that) {
case _TransferRequestModel() when $default != null:
return $default(_that.companyCode,_that.transactionDate,_that.transferType,_that.lines,_that.srfNo,_that.remarks,_that.exception);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransferRequestModel implements TransferRequestModel {
  const _TransferRequestModel({required this.companyCode, required this.transactionDate, required this.transferType, required  List<TransferLineRequestModel> lines, this.srfNo, this.remarks, this.exception = false}): _lines = lines;
  factory _TransferRequestModel.fromJson(Map<String, dynamic> json) => _$TransferRequestModelFromJson(json);

@override final  String companyCode;
@override final  String transactionDate;
@override final  String transferType;
 final  List<TransferLineRequestModel> _lines;
@override List<TransferLineRequestModel> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

@override final  String? srfNo;
@override final  String? remarks;
@override@JsonKey() final  bool exception;

/// Create a copy of TransferRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferRequestModelCopyWith<_TransferRequestModel> get copyWith => __$TransferRequestModelCopyWithImpl<_TransferRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferRequestModel&&(identical(other.companyCode, companyCode) || other.companyCode == companyCode)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.transferType, transferType) || other.transferType == transferType)&&const DeepCollectionEquality().equals(other.lines, _lines)&&(identical(other.srfNo, srfNo) || other.srfNo == srfNo)&&(identical(other.remarks, remarks) || other.remarks == remarks)&&(identical(other.exception, exception) || other.exception == exception));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,companyCode,transactionDate,transferType,const DeepCollectionEquality().hash(_lines),srfNo,remarks,exception);
}

@override
String toString() {
    return 'TransferRequestModel(companyCode: $companyCode, transactionDate: $transactionDate, transferType: $transferType, lines: $lines, srfNo: $srfNo, remarks: $remarks, exception: $exception)';
}


}

/// @nodoc
abstract mixin class _$TransferRequestModelCopyWith<$Res> implements $TransferRequestModelCopyWith<$Res> {
  factory _$TransferRequestModelCopyWith(_TransferRequestModel value, $Res Function(_TransferRequestModel) _then) = __$TransferRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String companyCode, String transactionDate, String transferType, List<TransferLineRequestModel> lines, String? srfNo, String? remarks, bool exception
});




}
/// @nodoc
class __$TransferRequestModelCopyWithImpl<$Res>
    implements _$TransferRequestModelCopyWith<$Res> {
  __$TransferRequestModelCopyWithImpl(this._self, this._then);

  final _TransferRequestModel _self;
  final $Res Function(_TransferRequestModel) _then;

/// Create a copy of TransferRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyCode = null,Object? transactionDate = null,Object? transferType = null,Object? lines = null,Object? srfNo = freezed,Object? remarks = freezed,Object? exception = null,}) {
  return _then(_TransferRequestModel(
companyCode: null == companyCode ? _self.companyCode : companyCode // ignore: cast_nullable_to_non_nullable
as String,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as String,transferType: null == transferType ? _self.transferType : transferType // ignore: cast_nullable_to_non_nullable
as String,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<TransferLineRequestModel>,srfNo: freezed == srfNo ? _self.srfNo : srfNo // ignore: cast_nullable_to_non_nullable
as String?,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,exception: null == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
