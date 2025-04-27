// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppStateModel implements DiagnosticableTreeMixin {

 dynamic get isLogin; dynamic get networkUp; dynamic get vtopDown;
/// Create a copy of AppStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStateModelCopyWith<AppStateModel> get copyWith => _$AppStateModelCopyWithImpl<AppStateModel>(this as AppStateModel, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppStateModel'))
    ..add(DiagnosticsProperty('isLogin', isLogin))..add(DiagnosticsProperty('networkUp', networkUp))..add(DiagnosticsProperty('vtopDown', vtopDown));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppStateModel&&const DeepCollectionEquality().equals(other.isLogin, isLogin)&&const DeepCollectionEquality().equals(other.networkUp, networkUp)&&const DeepCollectionEquality().equals(other.vtopDown, vtopDown));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(isLogin),const DeepCollectionEquality().hash(networkUp),const DeepCollectionEquality().hash(vtopDown));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppStateModel(isLogin: $isLogin, networkUp: $networkUp, vtopDown: $vtopDown)';
}


}

/// @nodoc
abstract mixin class $AppStateModelCopyWith<$Res>  {
  factory $AppStateModelCopyWith(AppStateModel value, $Res Function(AppStateModel) _then) = _$AppStateModelCopyWithImpl;
@useResult
$Res call({
 dynamic isLogin, dynamic networkUp, dynamic vtopDown
});




}
/// @nodoc
class _$AppStateModelCopyWithImpl<$Res>
    implements $AppStateModelCopyWith<$Res> {
  _$AppStateModelCopyWithImpl(this._self, this._then);

  final AppStateModel _self;
  final $Res Function(AppStateModel) _then;

/// Create a copy of AppStateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLogin = freezed,Object? networkUp = freezed,Object? vtopDown = freezed,}) {
  return _then(_self.copyWith(
isLogin: freezed == isLogin ? _self.isLogin : isLogin // ignore: cast_nullable_to_non_nullable
as dynamic,networkUp: freezed == networkUp ? _self.networkUp : networkUp // ignore: cast_nullable_to_non_nullable
as dynamic,vtopDown: freezed == vtopDown ? _self.vtopDown : vtopDown // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// @nodoc


class _AppStateModel with DiagnosticableTreeMixin implements AppStateModel {
   _AppStateModel({this.isLogin = false, this.networkUp = false, this.vtopDown = false});
  

@override@JsonKey() final  dynamic isLogin;
@override@JsonKey() final  dynamic networkUp;
@override@JsonKey() final  dynamic vtopDown;

/// Create a copy of AppStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppStateModelCopyWith<_AppStateModel> get copyWith => __$AppStateModelCopyWithImpl<_AppStateModel>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppStateModel'))
    ..add(DiagnosticsProperty('isLogin', isLogin))..add(DiagnosticsProperty('networkUp', networkUp))..add(DiagnosticsProperty('vtopDown', vtopDown));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppStateModel&&const DeepCollectionEquality().equals(other.isLogin, isLogin)&&const DeepCollectionEquality().equals(other.networkUp, networkUp)&&const DeepCollectionEquality().equals(other.vtopDown, vtopDown));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(isLogin),const DeepCollectionEquality().hash(networkUp),const DeepCollectionEquality().hash(vtopDown));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppStateModel(isLogin: $isLogin, networkUp: $networkUp, vtopDown: $vtopDown)';
}


}

/// @nodoc
abstract mixin class _$AppStateModelCopyWith<$Res> implements $AppStateModelCopyWith<$Res> {
  factory _$AppStateModelCopyWith(_AppStateModel value, $Res Function(_AppStateModel) _then) = __$AppStateModelCopyWithImpl;
@override @useResult
$Res call({
 dynamic isLogin, dynamic networkUp, dynamic vtopDown
});




}
/// @nodoc
class __$AppStateModelCopyWithImpl<$Res>
    implements _$AppStateModelCopyWith<$Res> {
  __$AppStateModelCopyWithImpl(this._self, this._then);

  final _AppStateModel _self;
  final $Res Function(_AppStateModel) _then;

/// Create a copy of AppStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLogin = freezed,Object? networkUp = freezed,Object? vtopDown = freezed,}) {
  return _then(_AppStateModel(
isLogin: freezed == isLogin ? _self.isLogin : isLogin // ignore: cast_nullable_to_non_nullable
as dynamic,networkUp: freezed == networkUp ? _self.networkUp : networkUp // ignore: cast_nullable_to_non_nullable
as dynamic,vtopDown: freezed == vtopDown ? _self.vtopDown : vtopDown // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
