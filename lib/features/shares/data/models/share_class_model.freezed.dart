// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_class_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShareClassModel {

 String get id; String get companyCode; String get stockType; double get parValue; int get authorizedShares; int get subscribedShares; int get issuedShares; int get treasuryShares; double get totalAmount; String? get nextCertificateNumber;
/// Create a copy of ShareClassModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShareClassModelCopyWith<ShareClassModel> get copyWith => _$ShareClassModelCopyWithImpl<ShareClassModel>(this as ShareClassModel, _$identity);

  /// Serializes this ShareClassModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ShareClassModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShareClassModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.companyCode, _this.companyCode) || other.companyCode == _this.companyCode)&&(identical(other.stockType, _this.stockType) || other.stockType == _this.stockType)&&(identical(other.parValue, _this.parValue) || other.parValue == _this.parValue)&&(identical(other.authorizedShares, _this.authorizedShares) || other.authorizedShares == _this.authorizedShares)&&(identical(other.subscribedShares, _this.subscribedShares) || other.subscribedShares == _this.subscribedShares)&&(identical(other.issuedShares, _this.issuedShares) || other.issuedShares == _this.issuedShares)&&(identical(other.treasuryShares, _this.treasuryShares) || other.treasuryShares == _this.treasuryShares)&&(identical(other.totalAmount, _this.totalAmount) || other.totalAmount == _this.totalAmount)&&(identical(other.nextCertificateNumber, _this.nextCertificateNumber) || other.nextCertificateNumber == _this.nextCertificateNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ShareClassModel;
  return Object.hash(runtimeType,_this.id,_this.companyCode,_this.stockType,_this.parValue,_this.authorizedShares,_this.subscribedShares,_this.issuedShares,_this.treasuryShares,_this.totalAmount,_this.nextCertificateNumber);
}

@override
String toString() {
  final _this = this as ShareClassModel;
  return 'ShareClassModel(id: ${_this.id}, companyCode: ${_this.companyCode}, stockType: ${_this.stockType}, parValue: ${_this.parValue}, authorizedShares: ${_this.authorizedShares}, subscribedShares: ${_this.subscribedShares}, issuedShares: ${_this.issuedShares}, treasuryShares: ${_this.treasuryShares}, totalAmount: ${_this.totalAmount}, nextCertificateNumber: ${_this.nextCertificateNumber})';
}


}

/// @nodoc
abstract mixin class $ShareClassModelCopyWith<$Res>  {
  factory $ShareClassModelCopyWith(ShareClassModel value, $Res Function(ShareClassModel) _then) = _$ShareClassModelCopyWithImpl;
@useResult
$Res call({
 String id, String companyCode, String stockType, double parValue, int authorizedShares, int subscribedShares, int issuedShares, int treasuryShares, double totalAmount, String? nextCertificateNumber
});




}
/// @nodoc
class _$ShareClassModelCopyWithImpl<$Res>
    implements $ShareClassModelCopyWith<$Res> {
  _$ShareClassModelCopyWithImpl(this._self, this._then);

  final ShareClassModel _self;
  final $Res Function(ShareClassModel) _then;

/// Create a copy of ShareClassModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? companyCode = null,Object? stockType = null,Object? parValue = null,Object? authorizedShares = null,Object? subscribedShares = null,Object? issuedShares = null,Object? treasuryShares = null,Object? totalAmount = null,Object? nextCertificateNumber = freezed,}) {
  return _then(ShareClassModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,companyCode: null == companyCode ? _self.companyCode : companyCode // ignore: cast_nullable_to_non_nullable
as String,stockType: null == stockType ? _self.stockType : stockType // ignore: cast_nullable_to_non_nullable
as String,parValue: null == parValue ? _self.parValue : parValue // ignore: cast_nullable_to_non_nullable
as double,authorizedShares: null == authorizedShares ? _self.authorizedShares : authorizedShares // ignore: cast_nullable_to_non_nullable
as int,subscribedShares: null == subscribedShares ? _self.subscribedShares : subscribedShares // ignore: cast_nullable_to_non_nullable
as int,issuedShares: null == issuedShares ? _self.issuedShares : issuedShares // ignore: cast_nullable_to_non_nullable
as int,treasuryShares: null == treasuryShares ? _self.treasuryShares : treasuryShares // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,nextCertificateNumber: freezed == nextCertificateNumber ? _self.nextCertificateNumber : nextCertificateNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShareClassModel].
extension ShareClassModelPatterns on ShareClassModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShareClassModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShareClassModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShareClassModel value)  $default,){
final _that = this;
switch (_that) {
case _ShareClassModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShareClassModel value)?  $default,){
final _that = this;
switch (_that) {
case _ShareClassModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String companyCode,  String stockType,  double parValue,  int authorizedShares,  int subscribedShares,  int issuedShares,  int treasuryShares,  double totalAmount,  String? nextCertificateNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShareClassModel() when $default != null:
return $default(_that.id,_that.companyCode,_that.stockType,_that.parValue,_that.authorizedShares,_that.subscribedShares,_that.issuedShares,_that.treasuryShares,_that.totalAmount,_that.nextCertificateNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String companyCode,  String stockType,  double parValue,  int authorizedShares,  int subscribedShares,  int issuedShares,  int treasuryShares,  double totalAmount,  String? nextCertificateNumber)  $default,) {final _that = this;
switch (_that) {
case _ShareClassModel():
return $default(_that.id,_that.companyCode,_that.stockType,_that.parValue,_that.authorizedShares,_that.subscribedShares,_that.issuedShares,_that.treasuryShares,_that.totalAmount,_that.nextCertificateNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String companyCode,  String stockType,  double parValue,  int authorizedShares,  int subscribedShares,  int issuedShares,  int treasuryShares,  double totalAmount,  String? nextCertificateNumber)?  $default,) {final _that = this;
switch (_that) {
case _ShareClassModel() when $default != null:
return $default(_that.id,_that.companyCode,_that.stockType,_that.parValue,_that.authorizedShares,_that.subscribedShares,_that.issuedShares,_that.treasuryShares,_that.totalAmount,_that.nextCertificateNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShareClassModel extends ShareClassModel {
  const _ShareClassModel({required this.id, required this.companyCode, required this.stockType, required this.parValue, required this.authorizedShares, required this.subscribedShares, required this.issuedShares, required this.treasuryShares, required this.totalAmount, this.nextCertificateNumber}): super._();
  factory _ShareClassModel.fromJson(Map<String, dynamic> json) => _$ShareClassModelFromJson(json);

@override final  String id;
@override final  String companyCode;
@override final  String stockType;
@override final  double parValue;
@override final  int authorizedShares;
@override final  int subscribedShares;
@override final  int issuedShares;
@override final  int treasuryShares;
@override final  double totalAmount;
@override final  String? nextCertificateNumber;

/// Create a copy of ShareClassModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShareClassModelCopyWith<_ShareClassModel> get copyWith => __$ShareClassModelCopyWithImpl<_ShareClassModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShareClassModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShareClassModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyCode, companyCode) || other.companyCode == companyCode)&&(identical(other.stockType, stockType) || other.stockType == stockType)&&(identical(other.parValue, parValue) || other.parValue == parValue)&&(identical(other.authorizedShares, authorizedShares) || other.authorizedShares == authorizedShares)&&(identical(other.subscribedShares, subscribedShares) || other.subscribedShares == subscribedShares)&&(identical(other.issuedShares, issuedShares) || other.issuedShares == issuedShares)&&(identical(other.treasuryShares, treasuryShares) || other.treasuryShares == treasuryShares)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.nextCertificateNumber, nextCertificateNumber) || other.nextCertificateNumber == nextCertificateNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,companyCode,stockType,parValue,authorizedShares,subscribedShares,issuedShares,treasuryShares,totalAmount,nextCertificateNumber);
}

@override
String toString() {
    return 'ShareClassModel(id: $id, companyCode: $companyCode, stockType: $stockType, parValue: $parValue, authorizedShares: $authorizedShares, subscribedShares: $subscribedShares, issuedShares: $issuedShares, treasuryShares: $treasuryShares, totalAmount: $totalAmount, nextCertificateNumber: $nextCertificateNumber)';
}


}

/// @nodoc
abstract mixin class _$ShareClassModelCopyWith<$Res> implements $ShareClassModelCopyWith<$Res> {
  factory _$ShareClassModelCopyWith(_ShareClassModel value, $Res Function(_ShareClassModel) _then) = __$ShareClassModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String companyCode, String stockType, double parValue, int authorizedShares, int subscribedShares, int issuedShares, int treasuryShares, double totalAmount, String? nextCertificateNumber
});




}
/// @nodoc
class __$ShareClassModelCopyWithImpl<$Res>
    implements _$ShareClassModelCopyWith<$Res> {
  __$ShareClassModelCopyWithImpl(this._self, this._then);

  final _ShareClassModel _self;
  final $Res Function(_ShareClassModel) _then;

/// Create a copy of ShareClassModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyCode = null,Object? stockType = null,Object? parValue = null,Object? authorizedShares = null,Object? subscribedShares = null,Object? issuedShares = null,Object? treasuryShares = null,Object? totalAmount = null,Object? nextCertificateNumber = freezed,}) {
  return _then(_ShareClassModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,companyCode: null == companyCode ? _self.companyCode : companyCode // ignore: cast_nullable_to_non_nullable
as String,stockType: null == stockType ? _self.stockType : stockType // ignore: cast_nullable_to_non_nullable
as String,parValue: null == parValue ? _self.parValue : parValue // ignore: cast_nullable_to_non_nullable
as double,authorizedShares: null == authorizedShares ? _self.authorizedShares : authorizedShares // ignore: cast_nullable_to_non_nullable
as int,subscribedShares: null == subscribedShares ? _self.subscribedShares : subscribedShares // ignore: cast_nullable_to_non_nullable
as int,issuedShares: null == issuedShares ? _self.issuedShares : issuedShares // ignore: cast_nullable_to_non_nullable
as int,treasuryShares: null == treasuryShares ? _self.treasuryShares : treasuryShares // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,nextCertificateNumber: freezed == nextCertificateNumber ? _self.nextCertificateNumber : nextCertificateNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ShareClassRequestModel {

 String get stockType; double get parValue; int get authorizedShares; int get subscribedShares; int get issuedShares; int get treasuryShares;
/// Create a copy of ShareClassRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShareClassRequestModelCopyWith<ShareClassRequestModel> get copyWith => _$ShareClassRequestModelCopyWithImpl<ShareClassRequestModel>(this as ShareClassRequestModel, _$identity);

  /// Serializes this ShareClassRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ShareClassRequestModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShareClassRequestModel&&(identical(other.stockType, _this.stockType) || other.stockType == _this.stockType)&&(identical(other.parValue, _this.parValue) || other.parValue == _this.parValue)&&(identical(other.authorizedShares, _this.authorizedShares) || other.authorizedShares == _this.authorizedShares)&&(identical(other.subscribedShares, _this.subscribedShares) || other.subscribedShares == _this.subscribedShares)&&(identical(other.issuedShares, _this.issuedShares) || other.issuedShares == _this.issuedShares)&&(identical(other.treasuryShares, _this.treasuryShares) || other.treasuryShares == _this.treasuryShares));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ShareClassRequestModel;
  return Object.hash(runtimeType,_this.stockType,_this.parValue,_this.authorizedShares,_this.subscribedShares,_this.issuedShares,_this.treasuryShares);
}

@override
String toString() {
  final _this = this as ShareClassRequestModel;
  return 'ShareClassRequestModel(stockType: ${_this.stockType}, parValue: ${_this.parValue}, authorizedShares: ${_this.authorizedShares}, subscribedShares: ${_this.subscribedShares}, issuedShares: ${_this.issuedShares}, treasuryShares: ${_this.treasuryShares})';
}


}

/// @nodoc
abstract mixin class $ShareClassRequestModelCopyWith<$Res>  {
  factory $ShareClassRequestModelCopyWith(ShareClassRequestModel value, $Res Function(ShareClassRequestModel) _then) = _$ShareClassRequestModelCopyWithImpl;
@useResult
$Res call({
 String stockType, double parValue, int authorizedShares, int subscribedShares, int issuedShares, int treasuryShares
});




}
/// @nodoc
class _$ShareClassRequestModelCopyWithImpl<$Res>
    implements $ShareClassRequestModelCopyWith<$Res> {
  _$ShareClassRequestModelCopyWithImpl(this._self, this._then);

  final ShareClassRequestModel _self;
  final $Res Function(ShareClassRequestModel) _then;

/// Create a copy of ShareClassRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stockType = null,Object? parValue = null,Object? authorizedShares = null,Object? subscribedShares = null,Object? issuedShares = null,Object? treasuryShares = null,}) {
  return _then(ShareClassRequestModel(
stockType: null == stockType ? _self.stockType : stockType // ignore: cast_nullable_to_non_nullable
as String,parValue: null == parValue ? _self.parValue : parValue // ignore: cast_nullable_to_non_nullable
as double,authorizedShares: null == authorizedShares ? _self.authorizedShares : authorizedShares // ignore: cast_nullable_to_non_nullable
as int,subscribedShares: null == subscribedShares ? _self.subscribedShares : subscribedShares // ignore: cast_nullable_to_non_nullable
as int,issuedShares: null == issuedShares ? _self.issuedShares : issuedShares // ignore: cast_nullable_to_non_nullable
as int,treasuryShares: null == treasuryShares ? _self.treasuryShares : treasuryShares // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ShareClassRequestModel].
extension ShareClassRequestModelPatterns on ShareClassRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShareClassRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShareClassRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShareClassRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _ShareClassRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShareClassRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _ShareClassRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String stockType,  double parValue,  int authorizedShares,  int subscribedShares,  int issuedShares,  int treasuryShares)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShareClassRequestModel() when $default != null:
return $default(_that.stockType,_that.parValue,_that.authorizedShares,_that.subscribedShares,_that.issuedShares,_that.treasuryShares);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String stockType,  double parValue,  int authorizedShares,  int subscribedShares,  int issuedShares,  int treasuryShares)  $default,) {final _that = this;
switch (_that) {
case _ShareClassRequestModel():
return $default(_that.stockType,_that.parValue,_that.authorizedShares,_that.subscribedShares,_that.issuedShares,_that.treasuryShares);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String stockType,  double parValue,  int authorizedShares,  int subscribedShares,  int issuedShares,  int treasuryShares)?  $default,) {final _that = this;
switch (_that) {
case _ShareClassRequestModel() when $default != null:
return $default(_that.stockType,_that.parValue,_that.authorizedShares,_that.subscribedShares,_that.issuedShares,_that.treasuryShares);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShareClassRequestModel implements ShareClassRequestModel {
  const _ShareClassRequestModel({required this.stockType, required this.parValue, required this.authorizedShares, required this.subscribedShares, required this.issuedShares, required this.treasuryShares});
  factory _ShareClassRequestModel.fromJson(Map<String, dynamic> json) => _$ShareClassRequestModelFromJson(json);

@override final  String stockType;
@override final  double parValue;
@override final  int authorizedShares;
@override final  int subscribedShares;
@override final  int issuedShares;
@override final  int treasuryShares;

/// Create a copy of ShareClassRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShareClassRequestModelCopyWith<_ShareClassRequestModel> get copyWith => __$ShareClassRequestModelCopyWithImpl<_ShareClassRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShareClassRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShareClassRequestModel&&(identical(other.stockType, stockType) || other.stockType == stockType)&&(identical(other.parValue, parValue) || other.parValue == parValue)&&(identical(other.authorizedShares, authorizedShares) || other.authorizedShares == authorizedShares)&&(identical(other.subscribedShares, subscribedShares) || other.subscribedShares == subscribedShares)&&(identical(other.issuedShares, issuedShares) || other.issuedShares == issuedShares)&&(identical(other.treasuryShares, treasuryShares) || other.treasuryShares == treasuryShares));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,stockType,parValue,authorizedShares,subscribedShares,issuedShares,treasuryShares);
}

@override
String toString() {
    return 'ShareClassRequestModel(stockType: $stockType, parValue: $parValue, authorizedShares: $authorizedShares, subscribedShares: $subscribedShares, issuedShares: $issuedShares, treasuryShares: $treasuryShares)';
}


}

/// @nodoc
abstract mixin class _$ShareClassRequestModelCopyWith<$Res> implements $ShareClassRequestModelCopyWith<$Res> {
  factory _$ShareClassRequestModelCopyWith(_ShareClassRequestModel value, $Res Function(_ShareClassRequestModel) _then) = __$ShareClassRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String stockType, double parValue, int authorizedShares, int subscribedShares, int issuedShares, int treasuryShares
});




}
/// @nodoc
class __$ShareClassRequestModelCopyWithImpl<$Res>
    implements _$ShareClassRequestModelCopyWith<$Res> {
  __$ShareClassRequestModelCopyWithImpl(this._self, this._then);

  final _ShareClassRequestModel _self;
  final $Res Function(_ShareClassRequestModel) _then;

/// Create a copy of ShareClassRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stockType = null,Object? parValue = null,Object? authorizedShares = null,Object? subscribedShares = null,Object? issuedShares = null,Object? treasuryShares = null,}) {
  return _then(_ShareClassRequestModel(
stockType: null == stockType ? _self.stockType : stockType // ignore: cast_nullable_to_non_nullable
as String,parValue: null == parValue ? _self.parValue : parValue // ignore: cast_nullable_to_non_nullable
as double,authorizedShares: null == authorizedShares ? _self.authorizedShares : authorizedShares // ignore: cast_nullable_to_non_nullable
as int,subscribedShares: null == subscribedShares ? _self.subscribedShares : subscribedShares // ignore: cast_nullable_to_non_nullable
as int,issuedShares: null == issuedShares ? _self.issuedShares : issuedShares // ignore: cast_nullable_to_non_nullable
as int,treasuryShares: null == treasuryShares ? _self.treasuryShares : treasuryShares // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
