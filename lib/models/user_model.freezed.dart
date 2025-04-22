// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserModel implements DiagnosticableTreeMixin {

 String? get username; String? get password; bool get loading; bool get isValid; bool get initialLoad;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserModel'))
    ..add(DiagnosticsProperty('username', username))..add(DiagnosticsProperty('password', password))..add(DiagnosticsProperty('loading', loading))..add(DiagnosticsProperty('isValid', isValid))..add(DiagnosticsProperty('initialLoad', initialLoad));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.initialLoad, initialLoad) || other.initialLoad == initialLoad));
}


@override
int get hashCode => Object.hash(runtimeType,username,password,loading,isValid,initialLoad);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserModel(username: $username, password: $password, loading: $loading, isValid: $isValid, initialLoad: $initialLoad)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String? username, String? password, bool loading, bool isValid, bool initialLoad
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = freezed,Object? password = freezed,Object? loading = null,Object? isValid = null,Object? initialLoad = null,}) {
  return _then(_self.copyWith(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,initialLoad: null == initialLoad ? _self.initialLoad : initialLoad // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _UserModel with DiagnosticableTreeMixin implements UserModel {
   _UserModel({this.username, this.password, this.loading = true, this.isValid = false, this.initialLoad = false});
  

@override final  String? username;
@override final  String? password;
@override@JsonKey() final  bool loading;
@override@JsonKey() final  bool isValid;
@override@JsonKey() final  bool initialLoad;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserModel'))
    ..add(DiagnosticsProperty('username', username))..add(DiagnosticsProperty('password', password))..add(DiagnosticsProperty('loading', loading))..add(DiagnosticsProperty('isValid', isValid))..add(DiagnosticsProperty('initialLoad', initialLoad));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.initialLoad, initialLoad) || other.initialLoad == initialLoad));
}


@override
int get hashCode => Object.hash(runtimeType,username,password,loading,isValid,initialLoad);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserModel(username: $username, password: $password, loading: $loading, isValid: $isValid, initialLoad: $initialLoad)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String? username, String? password, bool loading, bool isValid, bool initialLoad
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = freezed,Object? password = freezed,Object? loading = null,Object? isValid = null,Object? initialLoad = null,}) {
  return _then(_UserModel(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,initialLoad: null == initialLoad ? _self.initialLoad : initialLoad // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
