// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionModel {

 String get token; String get role; List<String> get permissions;
/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionModelCopyWith<SessionModel> get copyWith => _$SessionModelCopyWithImpl<SessionModel>(this as SessionModel, _$identity);

  /// Serializes this SessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SessionModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionModel&&(identical(other.token, _this.token) || other.token == _this.token)&&(identical(other.role, _this.role) || other.role == _this.role)&&const DeepCollectionEquality().equals(other.permissions, _this.permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SessionModel;
  return Object.hash(runtimeType,_this.token,_this.role,const DeepCollectionEquality().hash(_this.permissions));
}

@override
String toString() {
  final _this = this as SessionModel;
  return 'SessionModel(token: ${_this.token}, role: ${_this.role}, permissions: ${_this.permissions})';
}


}

/// @nodoc
abstract mixin class $SessionModelCopyWith<$Res>  {
  factory $SessionModelCopyWith(SessionModel value, $Res Function(SessionModel) _then) = _$SessionModelCopyWithImpl;
@useResult
$Res call({
 String token, String role, List<String> permissions
});




}
/// @nodoc
class _$SessionModelCopyWithImpl<$Res>
    implements $SessionModelCopyWith<$Res> {
  _$SessionModelCopyWithImpl(this._self, this._then);

  final SessionModel _self;
  final $Res Function(SessionModel) _then;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? role = null,Object? permissions = null,}) {
  return _then(SessionModel(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionModel].
extension SessionModelPatterns on SessionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionModel value)  $default,){
final _that = this;
switch (_that) {
case _SessionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  String role,  List<String> permissions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
return $default(_that.token,_that.role,_that.permissions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  String role,  List<String> permissions)  $default,) {final _that = this;
switch (_that) {
case _SessionModel():
return $default(_that.token,_that.role,_that.permissions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  String role,  List<String> permissions)?  $default,) {final _that = this;
switch (_that) {
case _SessionModel() when $default != null:
return $default(_that.token,_that.role,_that.permissions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionModel extends SessionModel {
  const _SessionModel({required this.token, required this.role, required  List<String> permissions}): _permissions = permissions,super._();
  factory _SessionModel.fromJson(Map<String, dynamic> json) => _$SessionModelFromJson(json);

@override final  String token;
@override final  String role;
 final  List<String> _permissions;
@override List<String> get permissions {
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissions);
}


/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionModelCopyWith<_SessionModel> get copyWith => __$SessionModelCopyWithImpl<_SessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionModel&&(identical(other.token, token) || other.token == token)&&(identical(other.role, role) || other.role == role)&&const DeepCollectionEquality().equals(other.permissions, _permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,token,role,const DeepCollectionEquality().hash(_permissions));
}

@override
String toString() {
    return 'SessionModel(token: $token, role: $role, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class _$SessionModelCopyWith<$Res> implements $SessionModelCopyWith<$Res> {
  factory _$SessionModelCopyWith(_SessionModel value, $Res Function(_SessionModel) _then) = __$SessionModelCopyWithImpl;
@override @useResult
$Res call({
 String token, String role, List<String> permissions
});




}
/// @nodoc
class __$SessionModelCopyWithImpl<$Res>
    implements _$SessionModelCopyWith<$Res> {
  __$SessionModelCopyWithImpl(this._self, this._then);

  final _SessionModel _self;
  final $Res Function(_SessionModel) _then;

/// Create a copy of SessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? role = null,Object? permissions = null,}) {
  return _then(_SessionModel(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
