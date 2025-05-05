// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_semid_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubSemidEntities implements DiagnosticableTreeMixin {

 String get semName; String get semid;
/// Create a copy of SubSemidEntities
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubSemidEntitiesCopyWith<SubSemidEntities> get copyWith => _$SubSemidEntitiesCopyWithImpl<SubSemidEntities>(this as SubSemidEntities, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SubSemidEntities'))
    ..add(DiagnosticsProperty('semName', semName))..add(DiagnosticsProperty('semid', semid));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubSemidEntities&&(identical(other.semName, semName) || other.semName == semName)&&(identical(other.semid, semid) || other.semid == semid));
}


@override
int get hashCode => Object.hash(runtimeType,semName,semid);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SubSemidEntities(semName: $semName, semid: $semid)';
}


}

/// @nodoc
abstract mixin class $SubSemidEntitiesCopyWith<$Res>  {
  factory $SubSemidEntitiesCopyWith(SubSemidEntities value, $Res Function(SubSemidEntities) _then) = _$SubSemidEntitiesCopyWithImpl;
@useResult
$Res call({
 String semName, String semid
});




}
/// @nodoc
class _$SubSemidEntitiesCopyWithImpl<$Res>
    implements $SubSemidEntitiesCopyWith<$Res> {
  _$SubSemidEntitiesCopyWithImpl(this._self, this._then);

  final SubSemidEntities _self;
  final $Res Function(SubSemidEntities) _then;

/// Create a copy of SubSemidEntities
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? semName = null,Object? semid = null,}) {
  return _then(_self.copyWith(
semName: null == semName ? _self.semName : semName // ignore: cast_nullable_to_non_nullable
as String,semid: null == semid ? _self.semid : semid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _SubSemidEntities with DiagnosticableTreeMixin implements SubSemidEntities {
   _SubSemidEntities({required this.semName, required this.semid});
  

@override final  String semName;
@override final  String semid;

/// Create a copy of SubSemidEntities
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubSemidEntitiesCopyWith<_SubSemidEntities> get copyWith => __$SubSemidEntitiesCopyWithImpl<_SubSemidEntities>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SubSemidEntities'))
    ..add(DiagnosticsProperty('semName', semName))..add(DiagnosticsProperty('semid', semid));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubSemidEntities&&(identical(other.semName, semName) || other.semName == semName)&&(identical(other.semid, semid) || other.semid == semid));
}


@override
int get hashCode => Object.hash(runtimeType,semName,semid);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SubSemidEntities(semName: $semName, semid: $semid)';
}


}

/// @nodoc
abstract mixin class _$SubSemidEntitiesCopyWith<$Res> implements $SubSemidEntitiesCopyWith<$Res> {
  factory _$SubSemidEntitiesCopyWith(_SubSemidEntities value, $Res Function(_SubSemidEntities) _then) = __$SubSemidEntitiesCopyWithImpl;
@override @useResult
$Res call({
 String semName, String semid
});




}
/// @nodoc
class __$SubSemidEntitiesCopyWithImpl<$Res>
    implements _$SubSemidEntitiesCopyWith<$Res> {
  __$SubSemidEntitiesCopyWithImpl(this._self, this._then);

  final _SubSemidEntities _self;
  final $Res Function(_SubSemidEntities) _then;

/// Create a copy of SubSemidEntities
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? semName = null,Object? semid = null,}) {
  return _then(_SubSemidEntities(
semName: null == semName ? _self.semName : semName // ignore: cast_nullable_to_non_nullable
as String,semid: null == semid ? _self.semid : semid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
