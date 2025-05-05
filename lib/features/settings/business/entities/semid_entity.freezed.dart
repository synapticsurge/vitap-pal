// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'semid_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SemidEntity implements DiagnosticableTreeMixin {

 List<SubSemidEntities> get semids;
/// Create a copy of SemidEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SemidEntityCopyWith<SemidEntity> get copyWith => _$SemidEntityCopyWithImpl<SemidEntity>(this as SemidEntity, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SemidEntity'))
    ..add(DiagnosticsProperty('semids', semids));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SemidEntity&&const DeepCollectionEquality().equals(other.semids, semids));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(semids));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SemidEntity(semids: $semids)';
}


}

/// @nodoc
abstract mixin class $SemidEntityCopyWith<$Res>  {
  factory $SemidEntityCopyWith(SemidEntity value, $Res Function(SemidEntity) _then) = _$SemidEntityCopyWithImpl;
@useResult
$Res call({
 List<SubSemidEntities> semids
});




}
/// @nodoc
class _$SemidEntityCopyWithImpl<$Res>
    implements $SemidEntityCopyWith<$Res> {
  _$SemidEntityCopyWithImpl(this._self, this._then);

  final SemidEntity _self;
  final $Res Function(SemidEntity) _then;

/// Create a copy of SemidEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? semids = null,}) {
  return _then(_self.copyWith(
semids: null == semids ? _self.semids : semids // ignore: cast_nullable_to_non_nullable
as List<SubSemidEntities>,
  ));
}

}


/// @nodoc


class _SemidEntity with DiagnosticableTreeMixin implements SemidEntity {
   _SemidEntity({required final  List<SubSemidEntities> semids}): _semids = semids;
  

 final  List<SubSemidEntities> _semids;
@override List<SubSemidEntities> get semids {
  if (_semids is EqualUnmodifiableListView) return _semids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_semids);
}


/// Create a copy of SemidEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SemidEntityCopyWith<_SemidEntity> get copyWith => __$SemidEntityCopyWithImpl<_SemidEntity>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SemidEntity'))
    ..add(DiagnosticsProperty('semids', semids));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SemidEntity&&const DeepCollectionEquality().equals(other._semids, _semids));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_semids));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SemidEntity(semids: $semids)';
}


}

/// @nodoc
abstract mixin class _$SemidEntityCopyWith<$Res> implements $SemidEntityCopyWith<$Res> {
  factory _$SemidEntityCopyWith(_SemidEntity value, $Res Function(_SemidEntity) _then) = __$SemidEntityCopyWithImpl;
@override @useResult
$Res call({
 List<SubSemidEntities> semids
});




}
/// @nodoc
class __$SemidEntityCopyWithImpl<$Res>
    implements _$SemidEntityCopyWith<$Res> {
  __$SemidEntityCopyWithImpl(this._self, this._then);

  final _SemidEntity _self;
  final $Res Function(_SemidEntity) _then;

/// Create a copy of SemidEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? semids = null,}) {
  return _then(_SemidEntity(
semids: null == semids ? _self._semids : semids // ignore: cast_nullable_to_non_nullable
as List<SubSemidEntities>,
  ));
}


}

// dart format on
