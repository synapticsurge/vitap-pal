// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserEntity implements DiagnosticableTreeMixin {

 String? get username; String? get password; String? get semid; String? get wifiusername; String? get wifiPassword; bool get isValid;
/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEntityCopyWith<UserEntity> get copyWith => _$UserEntityCopyWithImpl<UserEntity>(this as UserEntity, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserEntity'))
    ..add(DiagnosticsProperty('username', username))..add(DiagnosticsProperty('password', password))..add(DiagnosticsProperty('semid', semid))..add(DiagnosticsProperty('wifiusername', wifiusername))..add(DiagnosticsProperty('wifiPassword', wifiPassword))..add(DiagnosticsProperty('isValid', isValid));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEntity&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.semid, semid) || other.semid == semid)&&(identical(other.wifiusername, wifiusername) || other.wifiusername == wifiusername)&&(identical(other.wifiPassword, wifiPassword) || other.wifiPassword == wifiPassword)&&(identical(other.isValid, isValid) || other.isValid == isValid));
}


@override
int get hashCode => Object.hash(runtimeType,username,password,semid,wifiusername,wifiPassword,isValid);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserEntity(username: $username, password: $password, semid: $semid, wifiusername: $wifiusername, wifiPassword: $wifiPassword, isValid: $isValid)';
}


}

/// @nodoc
abstract mixin class $UserEntityCopyWith<$Res>  {
  factory $UserEntityCopyWith(UserEntity value, $Res Function(UserEntity) _then) = _$UserEntityCopyWithImpl;
@useResult
$Res call({
 String? username, String? password, String? semid, String? wifiusername, String? wifiPassword, bool isValid
});




}
/// @nodoc
class _$UserEntityCopyWithImpl<$Res>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._self, this._then);

  final UserEntity _self;
  final $Res Function(UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = freezed,Object? password = freezed,Object? semid = freezed,Object? wifiusername = freezed,Object? wifiPassword = freezed,Object? isValid = null,}) {
  return _then(_self.copyWith(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,semid: freezed == semid ? _self.semid : semid // ignore: cast_nullable_to_non_nullable
as String?,wifiusername: freezed == wifiusername ? _self.wifiusername : wifiusername // ignore: cast_nullable_to_non_nullable
as String?,wifiPassword: freezed == wifiPassword ? _self.wifiPassword : wifiPassword // ignore: cast_nullable_to_non_nullable
as String?,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _UserEntity with DiagnosticableTreeMixin implements UserEntity {
   _UserEntity({required this.username, required this.password, this.semid, this.wifiusername, this.wifiPassword, this.isValid = false});
  

@override final  String? username;
@override final  String? password;
@override final  String? semid;
@override final  String? wifiusername;
@override final  String? wifiPassword;
@override@JsonKey() final  bool isValid;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEntityCopyWith<_UserEntity> get copyWith => __$UserEntityCopyWithImpl<_UserEntity>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserEntity'))
    ..add(DiagnosticsProperty('username', username))..add(DiagnosticsProperty('password', password))..add(DiagnosticsProperty('semid', semid))..add(DiagnosticsProperty('wifiusername', wifiusername))..add(DiagnosticsProperty('wifiPassword', wifiPassword))..add(DiagnosticsProperty('isValid', isValid));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEntity&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.semid, semid) || other.semid == semid)&&(identical(other.wifiusername, wifiusername) || other.wifiusername == wifiusername)&&(identical(other.wifiPassword, wifiPassword) || other.wifiPassword == wifiPassword)&&(identical(other.isValid, isValid) || other.isValid == isValid));
}


@override
int get hashCode => Object.hash(runtimeType,username,password,semid,wifiusername,wifiPassword,isValid);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserEntity(username: $username, password: $password, semid: $semid, wifiusername: $wifiusername, wifiPassword: $wifiPassword, isValid: $isValid)';
}


}

/// @nodoc
abstract mixin class _$UserEntityCopyWith<$Res> implements $UserEntityCopyWith<$Res> {
  factory _$UserEntityCopyWith(_UserEntity value, $Res Function(_UserEntity) _then) = __$UserEntityCopyWithImpl;
@override @useResult
$Res call({
 String? username, String? password, String? semid, String? wifiusername, String? wifiPassword, bool isValid
});




}
/// @nodoc
class __$UserEntityCopyWithImpl<$Res>
    implements _$UserEntityCopyWith<$Res> {
  __$UserEntityCopyWithImpl(this._self, this._then);

  final _UserEntity _self;
  final $Res Function(_UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = freezed,Object? password = freezed,Object? semid = freezed,Object? wifiusername = freezed,Object? wifiPassword = freezed,Object? isValid = null,}) {
  return _then(_UserEntity(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,semid: freezed == semid ? _self.semid : semid // ignore: cast_nullable_to_non_nullable
as String?,wifiusername: freezed == wifiusername ? _self.wifiusername : wifiusername // ignore: cast_nullable_to_non_nullable
as String?,wifiPassword: freezed == wifiPassword ? _self.wifiPassword : wifiPassword // ignore: cast_nullable_to_non_nullable
as String?,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
