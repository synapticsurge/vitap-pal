// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppStateEntity implements DiagnosticableTreeMixin {

 bool get newtork; dynamic get isLogin; dynamic get vtopDown;
/// Create a copy of AppStateEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStateEntityCopyWith<AppStateEntity> get copyWith => _$AppStateEntityCopyWithImpl<AppStateEntity>(this as AppStateEntity, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppStateEntity'))
    ..add(DiagnosticsProperty('newtork', newtork))..add(DiagnosticsProperty('isLogin', isLogin))..add(DiagnosticsProperty('vtopDown', vtopDown));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppStateEntity&&(identical(other.newtork, newtork) || other.newtork == newtork)&&const DeepCollectionEquality().equals(other.isLogin, isLogin)&&const DeepCollectionEquality().equals(other.vtopDown, vtopDown));
}


@override
int get hashCode => Object.hash(runtimeType,newtork,const DeepCollectionEquality().hash(isLogin),const DeepCollectionEquality().hash(vtopDown));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppStateEntity(newtork: $newtork, isLogin: $isLogin, vtopDown: $vtopDown)';
}


}

/// @nodoc
abstract mixin class $AppStateEntityCopyWith<$Res>  {
  factory $AppStateEntityCopyWith(AppStateEntity value, $Res Function(AppStateEntity) _then) = _$AppStateEntityCopyWithImpl;
@useResult
$Res call({
 bool newtork, dynamic isLogin, dynamic vtopDown
});




}
/// @nodoc
class _$AppStateEntityCopyWithImpl<$Res>
    implements $AppStateEntityCopyWith<$Res> {
  _$AppStateEntityCopyWithImpl(this._self, this._then);

  final AppStateEntity _self;
  final $Res Function(AppStateEntity) _then;

/// Create a copy of AppStateEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? newtork = null,Object? isLogin = freezed,Object? vtopDown = freezed,}) {
  return _then(_self.copyWith(
newtork: null == newtork ? _self.newtork : newtork // ignore: cast_nullable_to_non_nullable
as bool,isLogin: freezed == isLogin ? _self.isLogin : isLogin // ignore: cast_nullable_to_non_nullable
as dynamic,vtopDown: freezed == vtopDown ? _self.vtopDown : vtopDown // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// @nodoc


class _AppStateEntity with DiagnosticableTreeMixin implements AppStateEntity {
   _AppStateEntity({this.newtork = true, this.isLogin = false, this.vtopDown = false});
  

@override@JsonKey() final  bool newtork;
@override@JsonKey() final  dynamic isLogin;
@override@JsonKey() final  dynamic vtopDown;

/// Create a copy of AppStateEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppStateEntityCopyWith<_AppStateEntity> get copyWith => __$AppStateEntityCopyWithImpl<_AppStateEntity>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppStateEntity'))
    ..add(DiagnosticsProperty('newtork', newtork))..add(DiagnosticsProperty('isLogin', isLogin))..add(DiagnosticsProperty('vtopDown', vtopDown));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppStateEntity&&(identical(other.newtork, newtork) || other.newtork == newtork)&&const DeepCollectionEquality().equals(other.isLogin, isLogin)&&const DeepCollectionEquality().equals(other.vtopDown, vtopDown));
}


@override
int get hashCode => Object.hash(runtimeType,newtork,const DeepCollectionEquality().hash(isLogin),const DeepCollectionEquality().hash(vtopDown));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppStateEntity(newtork: $newtork, isLogin: $isLogin, vtopDown: $vtopDown)';
}


}

/// @nodoc
abstract mixin class _$AppStateEntityCopyWith<$Res> implements $AppStateEntityCopyWith<$Res> {
  factory _$AppStateEntityCopyWith(_AppStateEntity value, $Res Function(_AppStateEntity) _then) = __$AppStateEntityCopyWithImpl;
@override @useResult
$Res call({
 bool newtork, dynamic isLogin, dynamic vtopDown
});




}
/// @nodoc
class __$AppStateEntityCopyWithImpl<$Res>
    implements _$AppStateEntityCopyWith<$Res> {
  __$AppStateEntityCopyWithImpl(this._self, this._then);

  final _AppStateEntity _self;
  final $Res Function(_AppStateEntity) _then;

/// Create a copy of AppStateEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? newtork = null,Object? isLogin = freezed,Object? vtopDown = freezed,}) {
  return _then(_AppStateEntity(
newtork: null == newtork ? _self.newtork : newtork // ignore: cast_nullable_to_non_nullable
as bool,isLogin: freezed == isLogin ? _self.isLogin : isLogin // ignore: cast_nullable_to_non_nullable
as dynamic,vtopDown: freezed == vtopDown ? _self.vtopDown : vtopDown // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
