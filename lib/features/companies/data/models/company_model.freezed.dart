// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyModel {

 String get companyCode; String get name; String get address; String? get tin; String? get secRegistrationCode; String? get presidentName; String? get corporateSecretaryName;
/// Create a copy of CompanyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyModelCopyWith<CompanyModel> get copyWith => _$CompanyModelCopyWithImpl<CompanyModel>(this as CompanyModel, _$identity);

  /// Serializes this CompanyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CompanyModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyModel&&(identical(other.companyCode, _this.companyCode) || other.companyCode == _this.companyCode)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.tin, _this.tin) || other.tin == _this.tin)&&(identical(other.secRegistrationCode, _this.secRegistrationCode) || other.secRegistrationCode == _this.secRegistrationCode)&&(identical(other.presidentName, _this.presidentName) || other.presidentName == _this.presidentName)&&(identical(other.corporateSecretaryName, _this.corporateSecretaryName) || other.corporateSecretaryName == _this.corporateSecretaryName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CompanyModel;
  return Object.hash(runtimeType,_this.companyCode,_this.name,_this.address,_this.tin,_this.secRegistrationCode,_this.presidentName,_this.corporateSecretaryName);
}

@override
String toString() {
  final _this = this as CompanyModel;
  return 'CompanyModel(companyCode: ${_this.companyCode}, name: ${_this.name}, address: ${_this.address}, tin: ${_this.tin}, secRegistrationCode: ${_this.secRegistrationCode}, presidentName: ${_this.presidentName}, corporateSecretaryName: ${_this.corporateSecretaryName})';
}


}

/// @nodoc
abstract mixin class $CompanyModelCopyWith<$Res>  {
  factory $CompanyModelCopyWith(CompanyModel value, $Res Function(CompanyModel) _then) = _$CompanyModelCopyWithImpl;
@useResult
$Res call({
 String companyCode, String name, String address, String? tin, String? secRegistrationCode, String? presidentName, String? corporateSecretaryName
});




}
/// @nodoc
class _$CompanyModelCopyWithImpl<$Res>
    implements $CompanyModelCopyWith<$Res> {
  _$CompanyModelCopyWithImpl(this._self, this._then);

  final CompanyModel _self;
  final $Res Function(CompanyModel) _then;

/// Create a copy of CompanyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companyCode = null,Object? name = null,Object? address = null,Object? tin = freezed,Object? secRegistrationCode = freezed,Object? presidentName = freezed,Object? corporateSecretaryName = freezed,}) {
  return _then(CompanyModel(
companyCode: null == companyCode ? _self.companyCode : companyCode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,tin: freezed == tin ? _self.tin : tin // ignore: cast_nullable_to_non_nullable
as String?,secRegistrationCode: freezed == secRegistrationCode ? _self.secRegistrationCode : secRegistrationCode // ignore: cast_nullable_to_non_nullable
as String?,presidentName: freezed == presidentName ? _self.presidentName : presidentName // ignore: cast_nullable_to_non_nullable
as String?,corporateSecretaryName: freezed == corporateSecretaryName ? _self.corporateSecretaryName : corporateSecretaryName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CompanyModel].
extension CompanyModelPatterns on CompanyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyModel value)  $default,){
final _that = this;
switch (_that) {
case _CompanyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyModel value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String companyCode,  String name,  String address,  String? tin,  String? secRegistrationCode,  String? presidentName,  String? corporateSecretaryName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyModel() when $default != null:
return $default(_that.companyCode,_that.name,_that.address,_that.tin,_that.secRegistrationCode,_that.presidentName,_that.corporateSecretaryName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String companyCode,  String name,  String address,  String? tin,  String? secRegistrationCode,  String? presidentName,  String? corporateSecretaryName)  $default,) {final _that = this;
switch (_that) {
case _CompanyModel():
return $default(_that.companyCode,_that.name,_that.address,_that.tin,_that.secRegistrationCode,_that.presidentName,_that.corporateSecretaryName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String companyCode,  String name,  String address,  String? tin,  String? secRegistrationCode,  String? presidentName,  String? corporateSecretaryName)?  $default,) {final _that = this;
switch (_that) {
case _CompanyModel() when $default != null:
return $default(_that.companyCode,_that.name,_that.address,_that.tin,_that.secRegistrationCode,_that.presidentName,_that.corporateSecretaryName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanyModel extends CompanyModel {
  const _CompanyModel({required this.companyCode, required this.name, required this.address, this.tin, this.secRegistrationCode, this.presidentName, this.corporateSecretaryName}): super._();
  factory _CompanyModel.fromJson(Map<String, dynamic> json) => _$CompanyModelFromJson(json);

@override final  String companyCode;
@override final  String name;
@override final  String address;
@override final  String? tin;
@override final  String? secRegistrationCode;
@override final  String? presidentName;
@override final  String? corporateSecretaryName;

/// Create a copy of CompanyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyModelCopyWith<_CompanyModel> get copyWith => __$CompanyModelCopyWithImpl<_CompanyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyModel&&(identical(other.companyCode, companyCode) || other.companyCode == companyCode)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.tin, tin) || other.tin == tin)&&(identical(other.secRegistrationCode, secRegistrationCode) || other.secRegistrationCode == secRegistrationCode)&&(identical(other.presidentName, presidentName) || other.presidentName == presidentName)&&(identical(other.corporateSecretaryName, corporateSecretaryName) || other.corporateSecretaryName == corporateSecretaryName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,companyCode,name,address,tin,secRegistrationCode,presidentName,corporateSecretaryName);
}

@override
String toString() {
    return 'CompanyModel(companyCode: $companyCode, name: $name, address: $address, tin: $tin, secRegistrationCode: $secRegistrationCode, presidentName: $presidentName, corporateSecretaryName: $corporateSecretaryName)';
}


}

/// @nodoc
abstract mixin class _$CompanyModelCopyWith<$Res> implements $CompanyModelCopyWith<$Res> {
  factory _$CompanyModelCopyWith(_CompanyModel value, $Res Function(_CompanyModel) _then) = __$CompanyModelCopyWithImpl;
@override @useResult
$Res call({
 String companyCode, String name, String address, String? tin, String? secRegistrationCode, String? presidentName, String? corporateSecretaryName
});




}
/// @nodoc
class __$CompanyModelCopyWithImpl<$Res>
    implements _$CompanyModelCopyWith<$Res> {
  __$CompanyModelCopyWithImpl(this._self, this._then);

  final _CompanyModel _self;
  final $Res Function(_CompanyModel) _then;

/// Create a copy of CompanyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyCode = null,Object? name = null,Object? address = null,Object? tin = freezed,Object? secRegistrationCode = freezed,Object? presidentName = freezed,Object? corporateSecretaryName = freezed,}) {
  return _then(_CompanyModel(
companyCode: null == companyCode ? _self.companyCode : companyCode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,tin: freezed == tin ? _self.tin : tin // ignore: cast_nullable_to_non_nullable
as String?,secRegistrationCode: freezed == secRegistrationCode ? _self.secRegistrationCode : secRegistrationCode // ignore: cast_nullable_to_non_nullable
as String?,presidentName: freezed == presidentName ? _self.presidentName : presidentName // ignore: cast_nullable_to_non_nullable
as String?,corporateSecretaryName: freezed == corporateSecretaryName ? _self.corporateSecretaryName : corporateSecretaryName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreateCompanyRequestModel {

 String get name; String get address; String? get tin; String? get presidentName; String? get corporateSecretaryName;
/// Create a copy of CreateCompanyRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCompanyRequestModelCopyWith<CreateCompanyRequestModel> get copyWith => _$CreateCompanyRequestModelCopyWithImpl<CreateCompanyRequestModel>(this as CreateCompanyRequestModel, _$identity);

  /// Serializes this CreateCompanyRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CreateCompanyRequestModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCompanyRequestModel&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.tin, _this.tin) || other.tin == _this.tin)&&(identical(other.presidentName, _this.presidentName) || other.presidentName == _this.presidentName)&&(identical(other.corporateSecretaryName, _this.corporateSecretaryName) || other.corporateSecretaryName == _this.corporateSecretaryName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CreateCompanyRequestModel;
  return Object.hash(runtimeType,_this.name,_this.address,_this.tin,_this.presidentName,_this.corporateSecretaryName);
}

@override
String toString() {
  final _this = this as CreateCompanyRequestModel;
  return 'CreateCompanyRequestModel(name: ${_this.name}, address: ${_this.address}, tin: ${_this.tin}, presidentName: ${_this.presidentName}, corporateSecretaryName: ${_this.corporateSecretaryName})';
}


}

/// @nodoc
abstract mixin class $CreateCompanyRequestModelCopyWith<$Res>  {
  factory $CreateCompanyRequestModelCopyWith(CreateCompanyRequestModel value, $Res Function(CreateCompanyRequestModel) _then) = _$CreateCompanyRequestModelCopyWithImpl;
@useResult
$Res call({
 String name, String address, String? tin, String? presidentName, String? corporateSecretaryName
});




}
/// @nodoc
class _$CreateCompanyRequestModelCopyWithImpl<$Res>
    implements $CreateCompanyRequestModelCopyWith<$Res> {
  _$CreateCompanyRequestModelCopyWithImpl(this._self, this._then);

  final CreateCompanyRequestModel _self;
  final $Res Function(CreateCompanyRequestModel) _then;

/// Create a copy of CreateCompanyRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? address = null,Object? tin = freezed,Object? presidentName = freezed,Object? corporateSecretaryName = freezed,}) {
  return _then(CreateCompanyRequestModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,tin: freezed == tin ? _self.tin : tin // ignore: cast_nullable_to_non_nullable
as String?,presidentName: freezed == presidentName ? _self.presidentName : presidentName // ignore: cast_nullable_to_non_nullable
as String?,corporateSecretaryName: freezed == corporateSecretaryName ? _self.corporateSecretaryName : corporateSecretaryName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateCompanyRequestModel].
extension CreateCompanyRequestModelPatterns on CreateCompanyRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateCompanyRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateCompanyRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateCompanyRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateCompanyRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateCompanyRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateCompanyRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String address,  String? tin,  String? presidentName,  String? corporateSecretaryName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateCompanyRequestModel() when $default != null:
return $default(_that.name,_that.address,_that.tin,_that.presidentName,_that.corporateSecretaryName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String address,  String? tin,  String? presidentName,  String? corporateSecretaryName)  $default,) {final _that = this;
switch (_that) {
case _CreateCompanyRequestModel():
return $default(_that.name,_that.address,_that.tin,_that.presidentName,_that.corporateSecretaryName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String address,  String? tin,  String? presidentName,  String? corporateSecretaryName)?  $default,) {final _that = this;
switch (_that) {
case _CreateCompanyRequestModel() when $default != null:
return $default(_that.name,_that.address,_that.tin,_that.presidentName,_that.corporateSecretaryName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateCompanyRequestModel implements CreateCompanyRequestModel {
  const _CreateCompanyRequestModel({required this.name, required this.address, this.tin, this.presidentName, this.corporateSecretaryName});
  factory _CreateCompanyRequestModel.fromJson(Map<String, dynamic> json) => _$CreateCompanyRequestModelFromJson(json);

@override final  String name;
@override final  String address;
@override final  String? tin;
@override final  String? presidentName;
@override final  String? corporateSecretaryName;

/// Create a copy of CreateCompanyRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCompanyRequestModelCopyWith<_CreateCompanyRequestModel> get copyWith => __$CreateCompanyRequestModelCopyWithImpl<_CreateCompanyRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateCompanyRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCompanyRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.tin, tin) || other.tin == tin)&&(identical(other.presidentName, presidentName) || other.presidentName == presidentName)&&(identical(other.corporateSecretaryName, corporateSecretaryName) || other.corporateSecretaryName == corporateSecretaryName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,address,tin,presidentName,corporateSecretaryName);
}

@override
String toString() {
    return 'CreateCompanyRequestModel(name: $name, address: $address, tin: $tin, presidentName: $presidentName, corporateSecretaryName: $corporateSecretaryName)';
}


}

/// @nodoc
abstract mixin class _$CreateCompanyRequestModelCopyWith<$Res> implements $CreateCompanyRequestModelCopyWith<$Res> {
  factory _$CreateCompanyRequestModelCopyWith(_CreateCompanyRequestModel value, $Res Function(_CreateCompanyRequestModel) _then) = __$CreateCompanyRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String address, String? tin, String? presidentName, String? corporateSecretaryName
});




}
/// @nodoc
class __$CreateCompanyRequestModelCopyWithImpl<$Res>
    implements _$CreateCompanyRequestModelCopyWith<$Res> {
  __$CreateCompanyRequestModelCopyWithImpl(this._self, this._then);

  final _CreateCompanyRequestModel _self;
  final $Res Function(_CreateCompanyRequestModel) _then;

/// Create a copy of CreateCompanyRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? address = null,Object? tin = freezed,Object? presidentName = freezed,Object? corporateSecretaryName = freezed,}) {
  return _then(_CreateCompanyRequestModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,tin: freezed == tin ? _self.tin : tin // ignore: cast_nullable_to_non_nullable
as String?,presidentName: freezed == presidentName ? _self.presidentName : presidentName // ignore: cast_nullable_to_non_nullable
as String?,corporateSecretaryName: freezed == corporateSecretaryName ? _self.corporateSecretaryName : corporateSecretaryName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
