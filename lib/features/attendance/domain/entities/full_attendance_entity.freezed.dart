// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'full_attendance_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FullAttendanceEntity implements DiagnosticableTreeMixin {

 List<SubFullAttendanceEntity> get attendance; String get courseType; dynamic get courseId;
/// Create a copy of FullAttendanceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FullAttendanceEntityCopyWith<FullAttendanceEntity> get copyWith => _$FullAttendanceEntityCopyWithImpl<FullAttendanceEntity>(this as FullAttendanceEntity, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FullAttendanceEntity'))
    ..add(DiagnosticsProperty('attendance', attendance))..add(DiagnosticsProperty('courseType', courseType))..add(DiagnosticsProperty('courseId', courseId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FullAttendanceEntity&&const DeepCollectionEquality().equals(other.attendance, attendance)&&(identical(other.courseType, courseType) || other.courseType == courseType)&&const DeepCollectionEquality().equals(other.courseId, courseId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(attendance),courseType,const DeepCollectionEquality().hash(courseId));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FullAttendanceEntity(attendance: $attendance, courseType: $courseType, courseId: $courseId)';
}


}

/// @nodoc
abstract mixin class $FullAttendanceEntityCopyWith<$Res>  {
  factory $FullAttendanceEntityCopyWith(FullAttendanceEntity value, $Res Function(FullAttendanceEntity) _then) = _$FullAttendanceEntityCopyWithImpl;
@useResult
$Res call({
 List<SubFullAttendanceEntity> attendance, String courseType, dynamic courseId
});




}
/// @nodoc
class _$FullAttendanceEntityCopyWithImpl<$Res>
    implements $FullAttendanceEntityCopyWith<$Res> {
  _$FullAttendanceEntityCopyWithImpl(this._self, this._then);

  final FullAttendanceEntity _self;
  final $Res Function(FullAttendanceEntity) _then;

/// Create a copy of FullAttendanceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attendance = null,Object? courseType = null,Object? courseId = freezed,}) {
  return _then(_self.copyWith(
attendance: null == attendance ? _self.attendance : attendance // ignore: cast_nullable_to_non_nullable
as List<SubFullAttendanceEntity>,courseType: null == courseType ? _self.courseType : courseType // ignore: cast_nullable_to_non_nullable
as String,courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// @nodoc


class _FullAttendanceEntity with DiagnosticableTreeMixin implements FullAttendanceEntity {
   _FullAttendanceEntity({required final  List<SubFullAttendanceEntity> attendance, required this.courseType, required this.courseId}): _attendance = attendance;
  

 final  List<SubFullAttendanceEntity> _attendance;
@override List<SubFullAttendanceEntity> get attendance {
  if (_attendance is EqualUnmodifiableListView) return _attendance;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attendance);
}

@override final  String courseType;
@override final  dynamic courseId;

/// Create a copy of FullAttendanceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FullAttendanceEntityCopyWith<_FullAttendanceEntity> get copyWith => __$FullAttendanceEntityCopyWithImpl<_FullAttendanceEntity>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FullAttendanceEntity'))
    ..add(DiagnosticsProperty('attendance', attendance))..add(DiagnosticsProperty('courseType', courseType))..add(DiagnosticsProperty('courseId', courseId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FullAttendanceEntity&&const DeepCollectionEquality().equals(other._attendance, _attendance)&&(identical(other.courseType, courseType) || other.courseType == courseType)&&const DeepCollectionEquality().equals(other.courseId, courseId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_attendance),courseType,const DeepCollectionEquality().hash(courseId));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FullAttendanceEntity(attendance: $attendance, courseType: $courseType, courseId: $courseId)';
}


}

/// @nodoc
abstract mixin class _$FullAttendanceEntityCopyWith<$Res> implements $FullAttendanceEntityCopyWith<$Res> {
  factory _$FullAttendanceEntityCopyWith(_FullAttendanceEntity value, $Res Function(_FullAttendanceEntity) _then) = __$FullAttendanceEntityCopyWithImpl;
@override @useResult
$Res call({
 List<SubFullAttendanceEntity> attendance, String courseType, dynamic courseId
});




}
/// @nodoc
class __$FullAttendanceEntityCopyWithImpl<$Res>
    implements _$FullAttendanceEntityCopyWith<$Res> {
  __$FullAttendanceEntityCopyWithImpl(this._self, this._then);

  final _FullAttendanceEntity _self;
  final $Res Function(_FullAttendanceEntity) _then;

/// Create a copy of FullAttendanceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attendance = null,Object? courseType = null,Object? courseId = freezed,}) {
  return _then(_FullAttendanceEntity(
attendance: null == attendance ? _self._attendance : attendance // ignore: cast_nullable_to_non_nullable
as List<SubFullAttendanceEntity>,courseType: null == courseType ? _self.courseType : courseType // ignore: cast_nullable_to_non_nullable
as String,courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
