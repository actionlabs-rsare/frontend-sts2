// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stockholder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockholderModel {

 String get stockholderCode; String get name; String get type; String get tin; String get nationality; String get gender; String get email; bool get active; String? get mobile; String? get address; String? get corporationType; String? get familyGroupId; int? get sharesHeld;
/// Create a copy of StockholderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockholderModelCopyWith<StockholderModel> get copyWith => _$StockholderModelCopyWithImpl<StockholderModel>(this as StockholderModel, _$identity);

  /// Serializes this StockholderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StockholderModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockholderModel&&(identical(other.stockholderCode, _this.stockholderCode) || other.stockholderCode == _this.stockholderCode)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.tin, _this.tin) || other.tin == _this.tin)&&(identical(other.nationality, _this.nationality) || other.nationality == _this.nationality)&&(identical(other.gender, _this.gender) || other.gender == _this.gender)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.active, _this.active) || other.active == _this.active)&&(identical(other.mobile, _this.mobile) || other.mobile == _this.mobile)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.corporationType, _this.corporationType) || other.corporationType == _this.corporationType)&&(identical(other.familyGroupId, _this.familyGroupId) || other.familyGroupId == _this.familyGroupId)&&(identical(other.sharesHeld, _this.sharesHeld) || other.sharesHeld == _this.sharesHeld));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StockholderModel;
  return Object.hash(runtimeType,_this.stockholderCode,_this.name,_this.type,_this.tin,_this.nationality,_this.gender,_this.email,_this.active,_this.mobile,_this.address,_this.corporationType,_this.familyGroupId,_this.sharesHeld);
}

@override
String toString() {
  final _this = this as StockholderModel;
  return 'StockholderModel(stockholderCode: ${_this.stockholderCode}, name: ${_this.name}, type: ${_this.type}, tin: ${_this.tin}, nationality: ${_this.nationality}, gender: ${_this.gender}, email: ${_this.email}, active: ${_this.active}, mobile: ${_this.mobile}, address: ${_this.address}, corporationType: ${_this.corporationType}, familyGroupId: ${_this.familyGroupId}, sharesHeld: ${_this.sharesHeld})';
}


}

/// @nodoc
abstract mixin class $StockholderModelCopyWith<$Res>  {
  factory $StockholderModelCopyWith(StockholderModel value, $Res Function(StockholderModel) _then) = _$StockholderModelCopyWithImpl;
@useResult
$Res call({
 String stockholderCode, String name, String type, String tin, String nationality, String gender, String email, bool active, String? mobile, String? address, String? corporationType, String? familyGroupId, int? sharesHeld
});




}
/// @nodoc
class _$StockholderModelCopyWithImpl<$Res>
    implements $StockholderModelCopyWith<$Res> {
  _$StockholderModelCopyWithImpl(this._self, this._then);

  final StockholderModel _self;
  final $Res Function(StockholderModel) _then;

/// Create a copy of StockholderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stockholderCode = null,Object? name = null,Object? type = null,Object? tin = null,Object? nationality = null,Object? gender = null,Object? email = null,Object? active = null,Object? mobile = freezed,Object? address = freezed,Object? corporationType = freezed,Object? familyGroupId = freezed,Object? sharesHeld = freezed,}) {
  return _then(StockholderModel(
stockholderCode: null == stockholderCode ? _self.stockholderCode : stockholderCode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,tin: null == tin ? _self.tin : tin // ignore: cast_nullable_to_non_nullable
as String,nationality: null == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,corporationType: freezed == corporationType ? _self.corporationType : corporationType // ignore: cast_nullable_to_non_nullable
as String?,familyGroupId: freezed == familyGroupId ? _self.familyGroupId : familyGroupId // ignore: cast_nullable_to_non_nullable
as String?,sharesHeld: freezed == sharesHeld ? _self.sharesHeld : sharesHeld // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [StockholderModel].
extension StockholderModelPatterns on StockholderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockholderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockholderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockholderModel value)  $default,){
final _that = this;
switch (_that) {
case _StockholderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockholderModel value)?  $default,){
final _that = this;
switch (_that) {
case _StockholderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String stockholderCode,  String name,  String type,  String tin,  String nationality,  String gender,  String email,  bool active,  String? mobile,  String? address,  String? corporationType,  String? familyGroupId,  int? sharesHeld)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockholderModel() when $default != null:
return $default(_that.stockholderCode,_that.name,_that.type,_that.tin,_that.nationality,_that.gender,_that.email,_that.active,_that.mobile,_that.address,_that.corporationType,_that.familyGroupId,_that.sharesHeld);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String stockholderCode,  String name,  String type,  String tin,  String nationality,  String gender,  String email,  bool active,  String? mobile,  String? address,  String? corporationType,  String? familyGroupId,  int? sharesHeld)  $default,) {final _that = this;
switch (_that) {
case _StockholderModel():
return $default(_that.stockholderCode,_that.name,_that.type,_that.tin,_that.nationality,_that.gender,_that.email,_that.active,_that.mobile,_that.address,_that.corporationType,_that.familyGroupId,_that.sharesHeld);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String stockholderCode,  String name,  String type,  String tin,  String nationality,  String gender,  String email,  bool active,  String? mobile,  String? address,  String? corporationType,  String? familyGroupId,  int? sharesHeld)?  $default,) {final _that = this;
switch (_that) {
case _StockholderModel() when $default != null:
return $default(_that.stockholderCode,_that.name,_that.type,_that.tin,_that.nationality,_that.gender,_that.email,_that.active,_that.mobile,_that.address,_that.corporationType,_that.familyGroupId,_that.sharesHeld);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockholderModel extends StockholderModel {
  const _StockholderModel({required this.stockholderCode, required this.name, required this.type, required this.tin, required this.nationality, required this.gender, required this.email, required this.active, this.mobile, this.address, this.corporationType, this.familyGroupId, this.sharesHeld}): super._();
  factory _StockholderModel.fromJson(Map<String, dynamic> json) => _$StockholderModelFromJson(json);

@override final  String stockholderCode;
@override final  String name;
@override final  String type;
@override final  String tin;
@override final  String nationality;
@override final  String gender;
@override final  String email;
@override final  bool active;
@override final  String? mobile;
@override final  String? address;
@override final  String? corporationType;
@override final  String? familyGroupId;
@override final  int? sharesHeld;

/// Create a copy of StockholderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockholderModelCopyWith<_StockholderModel> get copyWith => __$StockholderModelCopyWithImpl<_StockholderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockholderModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockholderModel&&(identical(other.stockholderCode, stockholderCode) || other.stockholderCode == stockholderCode)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.tin, tin) || other.tin == tin)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.email, email) || other.email == email)&&(identical(other.active, active) || other.active == active)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.address, address) || other.address == address)&&(identical(other.corporationType, corporationType) || other.corporationType == corporationType)&&(identical(other.familyGroupId, familyGroupId) || other.familyGroupId == familyGroupId)&&(identical(other.sharesHeld, sharesHeld) || other.sharesHeld == sharesHeld));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,stockholderCode,name,type,tin,nationality,gender,email,active,mobile,address,corporationType,familyGroupId,sharesHeld);
}

@override
String toString() {
    return 'StockholderModel(stockholderCode: $stockholderCode, name: $name, type: $type, tin: $tin, nationality: $nationality, gender: $gender, email: $email, active: $active, mobile: $mobile, address: $address, corporationType: $corporationType, familyGroupId: $familyGroupId, sharesHeld: $sharesHeld)';
}


}

/// @nodoc
abstract mixin class _$StockholderModelCopyWith<$Res> implements $StockholderModelCopyWith<$Res> {
  factory _$StockholderModelCopyWith(_StockholderModel value, $Res Function(_StockholderModel) _then) = __$StockholderModelCopyWithImpl;
@override @useResult
$Res call({
 String stockholderCode, String name, String type, String tin, String nationality, String gender, String email, bool active, String? mobile, String? address, String? corporationType, String? familyGroupId, int? sharesHeld
});




}
/// @nodoc
class __$StockholderModelCopyWithImpl<$Res>
    implements _$StockholderModelCopyWith<$Res> {
  __$StockholderModelCopyWithImpl(this._self, this._then);

  final _StockholderModel _self;
  final $Res Function(_StockholderModel) _then;

/// Create a copy of StockholderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stockholderCode = null,Object? name = null,Object? type = null,Object? tin = null,Object? nationality = null,Object? gender = null,Object? email = null,Object? active = null,Object? mobile = freezed,Object? address = freezed,Object? corporationType = freezed,Object? familyGroupId = freezed,Object? sharesHeld = freezed,}) {
  return _then(_StockholderModel(
stockholderCode: null == stockholderCode ? _self.stockholderCode : stockholderCode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,tin: null == tin ? _self.tin : tin // ignore: cast_nullable_to_non_nullable
as String,nationality: null == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,corporationType: freezed == corporationType ? _self.corporationType : corporationType // ignore: cast_nullable_to_non_nullable
as String?,familyGroupId: freezed == familyGroupId ? _self.familyGroupId : familyGroupId // ignore: cast_nullable_to_non_nullable
as String?,sharesHeld: freezed == sharesHeld ? _self.sharesHeld : sharesHeld // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$StockholderRequestModel {

 String get name; String get type; String get tin; String get nationality; String get gender; String get email;@JsonKey(includeIfNull: false) String? get mobile;@JsonKey(includeIfNull: false) String? get address;@JsonKey(includeIfNull: false) String? get corporationType;@JsonKey(includeIfNull: false) String? get familyGroupId;@JsonKey(includeIfNull: false) bool? get active;
/// Create a copy of StockholderRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockholderRequestModelCopyWith<StockholderRequestModel> get copyWith => _$StockholderRequestModelCopyWithImpl<StockholderRequestModel>(this as StockholderRequestModel, _$identity);

  /// Serializes this StockholderRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StockholderRequestModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockholderRequestModel&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.tin, _this.tin) || other.tin == _this.tin)&&(identical(other.nationality, _this.nationality) || other.nationality == _this.nationality)&&(identical(other.gender, _this.gender) || other.gender == _this.gender)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.mobile, _this.mobile) || other.mobile == _this.mobile)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.corporationType, _this.corporationType) || other.corporationType == _this.corporationType)&&(identical(other.familyGroupId, _this.familyGroupId) || other.familyGroupId == _this.familyGroupId)&&(identical(other.active, _this.active) || other.active == _this.active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StockholderRequestModel;
  return Object.hash(runtimeType,_this.name,_this.type,_this.tin,_this.nationality,_this.gender,_this.email,_this.mobile,_this.address,_this.corporationType,_this.familyGroupId,_this.active);
}

@override
String toString() {
  final _this = this as StockholderRequestModel;
  return 'StockholderRequestModel(name: ${_this.name}, type: ${_this.type}, tin: ${_this.tin}, nationality: ${_this.nationality}, gender: ${_this.gender}, email: ${_this.email}, mobile: ${_this.mobile}, address: ${_this.address}, corporationType: ${_this.corporationType}, familyGroupId: ${_this.familyGroupId}, active: ${_this.active})';
}


}

/// @nodoc
abstract mixin class $StockholderRequestModelCopyWith<$Res>  {
  factory $StockholderRequestModelCopyWith(StockholderRequestModel value, $Res Function(StockholderRequestModel) _then) = _$StockholderRequestModelCopyWithImpl;
@useResult
$Res call({
 String name, String type, String tin, String nationality, String gender, String email,@JsonKey(includeIfNull: false) String? mobile,@JsonKey(includeIfNull: false) String? address,@JsonKey(includeIfNull: false) String? corporationType,@JsonKey(includeIfNull: false) String? familyGroupId,@JsonKey(includeIfNull: false) bool? active
});




}
/// @nodoc
class _$StockholderRequestModelCopyWithImpl<$Res>
    implements $StockholderRequestModelCopyWith<$Res> {
  _$StockholderRequestModelCopyWithImpl(this._self, this._then);

  final StockholderRequestModel _self;
  final $Res Function(StockholderRequestModel) _then;

/// Create a copy of StockholderRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,Object? tin = null,Object? nationality = null,Object? gender = null,Object? email = null,Object? mobile = freezed,Object? address = freezed,Object? corporationType = freezed,Object? familyGroupId = freezed,Object? active = freezed,}) {
  return _then(StockholderRequestModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,tin: null == tin ? _self.tin : tin // ignore: cast_nullable_to_non_nullable
as String,nationality: null == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,corporationType: freezed == corporationType ? _self.corporationType : corporationType // ignore: cast_nullable_to_non_nullable
as String?,familyGroupId: freezed == familyGroupId ? _self.familyGroupId : familyGroupId // ignore: cast_nullable_to_non_nullable
as String?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [StockholderRequestModel].
extension StockholderRequestModelPatterns on StockholderRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockholderRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockholderRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockholderRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _StockholderRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockholderRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _StockholderRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String type,  String tin,  String nationality,  String gender,  String email, @JsonKey(includeIfNull: false)  String? mobile, @JsonKey(includeIfNull: false)  String? address, @JsonKey(includeIfNull: false)  String? corporationType, @JsonKey(includeIfNull: false)  String? familyGroupId, @JsonKey(includeIfNull: false)  bool? active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockholderRequestModel() when $default != null:
return $default(_that.name,_that.type,_that.tin,_that.nationality,_that.gender,_that.email,_that.mobile,_that.address,_that.corporationType,_that.familyGroupId,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String type,  String tin,  String nationality,  String gender,  String email, @JsonKey(includeIfNull: false)  String? mobile, @JsonKey(includeIfNull: false)  String? address, @JsonKey(includeIfNull: false)  String? corporationType, @JsonKey(includeIfNull: false)  String? familyGroupId, @JsonKey(includeIfNull: false)  bool? active)  $default,) {final _that = this;
switch (_that) {
case _StockholderRequestModel():
return $default(_that.name,_that.type,_that.tin,_that.nationality,_that.gender,_that.email,_that.mobile,_that.address,_that.corporationType,_that.familyGroupId,_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String type,  String tin,  String nationality,  String gender,  String email, @JsonKey(includeIfNull: false)  String? mobile, @JsonKey(includeIfNull: false)  String? address, @JsonKey(includeIfNull: false)  String? corporationType, @JsonKey(includeIfNull: false)  String? familyGroupId, @JsonKey(includeIfNull: false)  bool? active)?  $default,) {final _that = this;
switch (_that) {
case _StockholderRequestModel() when $default != null:
return $default(_that.name,_that.type,_that.tin,_that.nationality,_that.gender,_that.email,_that.mobile,_that.address,_that.corporationType,_that.familyGroupId,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockholderRequestModel implements StockholderRequestModel {
  const _StockholderRequestModel({required this.name, required this.type, required this.tin, required this.nationality, required this.gender, required this.email, @JsonKey(includeIfNull: false) this.mobile, @JsonKey(includeIfNull: false) this.address, @JsonKey(includeIfNull: false) this.corporationType, @JsonKey(includeIfNull: false) this.familyGroupId, @JsonKey(includeIfNull: false) this.active});
  factory _StockholderRequestModel.fromJson(Map<String, dynamic> json) => _$StockholderRequestModelFromJson(json);

@override final  String name;
@override final  String type;
@override final  String tin;
@override final  String nationality;
@override final  String gender;
@override final  String email;
@override@JsonKey(includeIfNull: false) final  String? mobile;
@override@JsonKey(includeIfNull: false) final  String? address;
@override@JsonKey(includeIfNull: false) final  String? corporationType;
@override@JsonKey(includeIfNull: false) final  String? familyGroupId;
@override@JsonKey(includeIfNull: false) final  bool? active;

/// Create a copy of StockholderRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockholderRequestModelCopyWith<_StockholderRequestModel> get copyWith => __$StockholderRequestModelCopyWithImpl<_StockholderRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockholderRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockholderRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.tin, tin) || other.tin == tin)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.email, email) || other.email == email)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.address, address) || other.address == address)&&(identical(other.corporationType, corporationType) || other.corporationType == corporationType)&&(identical(other.familyGroupId, familyGroupId) || other.familyGroupId == familyGroupId)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,type,tin,nationality,gender,email,mobile,address,corporationType,familyGroupId,active);
}

@override
String toString() {
    return 'StockholderRequestModel(name: $name, type: $type, tin: $tin, nationality: $nationality, gender: $gender, email: $email, mobile: $mobile, address: $address, corporationType: $corporationType, familyGroupId: $familyGroupId, active: $active)';
}


}

/// @nodoc
abstract mixin class _$StockholderRequestModelCopyWith<$Res> implements $StockholderRequestModelCopyWith<$Res> {
  factory _$StockholderRequestModelCopyWith(_StockholderRequestModel value, $Res Function(_StockholderRequestModel) _then) = __$StockholderRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String type, String tin, String nationality, String gender, String email,@JsonKey(includeIfNull: false) String? mobile,@JsonKey(includeIfNull: false) String? address,@JsonKey(includeIfNull: false) String? corporationType,@JsonKey(includeIfNull: false) String? familyGroupId,@JsonKey(includeIfNull: false) bool? active
});




}
/// @nodoc
class __$StockholderRequestModelCopyWithImpl<$Res>
    implements _$StockholderRequestModelCopyWith<$Res> {
  __$StockholderRequestModelCopyWithImpl(this._self, this._then);

  final _StockholderRequestModel _self;
  final $Res Function(_StockholderRequestModel) _then;

/// Create a copy of StockholderRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,Object? tin = null,Object? nationality = null,Object? gender = null,Object? email = null,Object? mobile = freezed,Object? address = freezed,Object? corporationType = freezed,Object? familyGroupId = freezed,Object? active = freezed,}) {
  return _then(_StockholderRequestModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,tin: null == tin ? _self.tin : tin // ignore: cast_nullable_to_non_nullable
as String,nationality: null == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,corporationType: freezed == corporationType ? _self.corporationType : corporationType // ignore: cast_nullable_to_non_nullable
as String?,familyGroupId: freezed == familyGroupId ? _self.familyGroupId : familyGroupId // ignore: cast_nullable_to_non_nullable
as String?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
