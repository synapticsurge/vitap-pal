// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClientModel implements DiagnosticableTreeMixin {

 bool get isLogin; bool get isOnline; bool get isVtopDown; bool get firstload; Iclient get iclient;
/// Create a copy of ClientModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientModelCopyWith<ClientModel> get copyWith => _$ClientModelCopyWithImpl<ClientModel>(this as ClientModel, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ClientModel'))
    ..add(DiagnosticsProperty('isLogin', isLogin))..add(DiagnosticsProperty('isOnline', isOnline))..add(DiagnosticsProperty('isVtopDown', isVtopDown))..add(DiagnosticsProperty('firstload', firstload))..add(DiagnosticsProperty('iclient', iclient));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientModel&&(identical(other.isLogin, isLogin) || other.isLogin == isLogin)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.isVtopDown, isVtopDown) || other.isVtopDown == isVtopDown)&&(identical(other.firstload, firstload) || other.firstload == firstload)&&(identical(other.iclient, iclient) || other.iclient == iclient));
}


@override
int get hashCode => Object.hash(runtimeType,isLogin,isOnline,isVtopDown,firstload,iclient);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ClientModel(isLogin: $isLogin, isOnline: $isOnline, isVtopDown: $isVtopDown, firstload: $firstload, iclient: $iclient)';
}


}

/// @nodoc
abstract mixin class $ClientModelCopyWith<$Res>  {
  factory $ClientModelCopyWith(ClientModel value, $Res Function(ClientModel) _then) = _$ClientModelCopyWithImpl;
@useResult
$Res call({
 bool isLogin, bool isOnline, bool isVtopDown, bool firstload, Iclient iclient
});




}
/// @nodoc
class _$ClientModelCopyWithImpl<$Res>
    implements $ClientModelCopyWith<$Res> {
  _$ClientModelCopyWithImpl(this._self, this._then);

  final ClientModel _self;
  final $Res Function(ClientModel) _then;

/// Create a copy of ClientModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLogin = null,Object? isOnline = null,Object? isVtopDown = null,Object? firstload = null,Object? iclient = null,}) {
  return _then(_self.copyWith(
isLogin: null == isLogin ? _self.isLogin : isLogin // ignore: cast_nullable_to_non_nullable
as bool,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,isVtopDown: null == isVtopDown ? _self.isVtopDown : isVtopDown // ignore: cast_nullable_to_non_nullable
as bool,firstload: null == firstload ? _self.firstload : firstload // ignore: cast_nullable_to_non_nullable
as bool,iclient: null == iclient ? _self.iclient : iclient // ignore: cast_nullable_to_non_nullable
as Iclient,
  ));
}

}


/// @nodoc


class _ClientModel with DiagnosticableTreeMixin implements ClientModel {
   _ClientModel({this.isLogin = false, this.isOnline = false, this.isVtopDown = false, this.firstload = true, required this.iclient});
  

@override@JsonKey() final  bool isLogin;
@override@JsonKey() final  bool isOnline;
@override@JsonKey() final  bool isVtopDown;
@override@JsonKey() final  bool firstload;
@override final  Iclient iclient;

/// Create a copy of ClientModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientModelCopyWith<_ClientModel> get copyWith => __$ClientModelCopyWithImpl<_ClientModel>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ClientModel'))
    ..add(DiagnosticsProperty('isLogin', isLogin))..add(DiagnosticsProperty('isOnline', isOnline))..add(DiagnosticsProperty('isVtopDown', isVtopDown))..add(DiagnosticsProperty('firstload', firstload))..add(DiagnosticsProperty('iclient', iclient));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientModel&&(identical(other.isLogin, isLogin) || other.isLogin == isLogin)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.isVtopDown, isVtopDown) || other.isVtopDown == isVtopDown)&&(identical(other.firstload, firstload) || other.firstload == firstload)&&(identical(other.iclient, iclient) || other.iclient == iclient));
}


@override
int get hashCode => Object.hash(runtimeType,isLogin,isOnline,isVtopDown,firstload,iclient);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ClientModel(isLogin: $isLogin, isOnline: $isOnline, isVtopDown: $isVtopDown, firstload: $firstload, iclient: $iclient)';
}


}

/// @nodoc
abstract mixin class _$ClientModelCopyWith<$Res> implements $ClientModelCopyWith<$Res> {
  factory _$ClientModelCopyWith(_ClientModel value, $Res Function(_ClientModel) _then) = __$ClientModelCopyWithImpl;
@override @useResult
$Res call({
 bool isLogin, bool isOnline, bool isVtopDown, bool firstload, Iclient iclient
});




}
/// @nodoc
class __$ClientModelCopyWithImpl<$Res>
    implements _$ClientModelCopyWith<$Res> {
  __$ClientModelCopyWithImpl(this._self, this._then);

  final _ClientModel _self;
  final $Res Function(_ClientModel) _then;

/// Create a copy of ClientModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLogin = null,Object? isOnline = null,Object? isVtopDown = null,Object? firstload = null,Object? iclient = null,}) {
  return _then(_ClientModel(
isLogin: null == isLogin ? _self.isLogin : isLogin // ignore: cast_nullable_to_non_nullable
as bool,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,isVtopDown: null == isVtopDown ? _self.isVtopDown : isVtopDown // ignore: cast_nullable_to_non_nullable
as bool,firstload: null == firstload ? _self.firstload : firstload // ignore: cast_nullable_to_non_nullable
as bool,iclient: null == iclient ? _self.iclient : iclient // ignore: cast_nullable_to_non_nullable
as Iclient,
  ));
}


}

// dart format on
