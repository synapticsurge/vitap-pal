// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttendanceEntity implements DiagnosticableTreeMixin {

 List<SubAttendanceEntity> get attendance;
/// Create a copy of AttendanceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceEntityCopyWith<AttendanceEntity> get copyWith => _$AttendanceEntityCopyWithImpl<AttendanceEntity>(this as AttendanceEntity, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AttendanceEntity'))
    ..add(DiagnosticsProperty('attendance', attendance));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceEntity&&const DeepCollectionEquality().equals(other.attendance, attendance));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(attendance));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AttendanceEntity(attendance: $attendance)';
}


}

/// @nodoc
abstract mixin class $AttendanceEntityCopyWith<$Res>  {
  factory $AttendanceEntityCopyWith(AttendanceEntity value, $Res Function(AttendanceEntity) _then) = _$AttendanceEntityCopyWithImpl;
@useResult
$Res call({
 List<SubAttendanceEntity> attendance
});




}
/// @nodoc
class _$AttendanceEntityCopyWithImpl<$Res>
    implements $AttendanceEntityCopyWith<$Res> {
  _$AttendanceEntityCopyWithImpl(this._self, this._then);

  final AttendanceEntity _self;
  final $Res Function(AttendanceEntity) _then;

/// Create a copy of AttendanceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attendance = null,}) {
  return _then(_self.copyWith(
attendance: null == attendance ? _self.attendance : attendance // ignore: cast_nullable_to_non_nullable
as List<SubAttendanceEntity>,
  ));
}

}


/// @nodoc


class _AttendanceEntity with DiagnosticableTreeMixin implements AttendanceEntity {
   _AttendanceEntity({required final  List<SubAttendanceEntity> attendance}): _attendance = attendance;
  

 final  List<SubAttendanceEntity> _attendance;
@override List<SubAttendanceEntity> get attendance {
  if (_attendance is EqualUnmodifiableListView) return _attendance;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attendance);
}


/// Create a copy of AttendanceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceEntityCopyWith<_AttendanceEntity> get copyWith => __$AttendanceEntityCopyWithImpl<_AttendanceEntity>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AttendanceEntity'))
    ..add(DiagnosticsProperty('attendance', attendance));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceEntity&&const DeepCollectionEquality().equals(other._attendance, _attendance));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_attendance));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AttendanceEntity(attendance: $attendance)';
}


}

/// @nodoc
abstract mixin class _$AttendanceEntityCopyWith<$Res> implements $AttendanceEntityCopyWith<$Res> {
  factory _$AttendanceEntityCopyWith(_AttendanceEntity value, $Res Function(_AttendanceEntity) _then) = __$AttendanceEntityCopyWithImpl;
@override @useResult
$Res call({
 List<SubAttendanceEntity> attendance
});




}
/// @nodoc
class __$AttendanceEntityCopyWithImpl<$Res>
    implements _$AttendanceEntityCopyWith<$Res> {
  __$AttendanceEntityCopyWithImpl(this._self, this._then);

  final _AttendanceEntity _self;
  final $Res Function(_AttendanceEntity) _then;

/// Create a copy of AttendanceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attendance = null,}) {
  return _then(_AttendanceEntity(
attendance: null == attendance ? _self._attendance : attendance // ignore: cast_nullable_to_non_nullable
as List<SubAttendanceEntity>,
  ));
}


}

// dart format on
