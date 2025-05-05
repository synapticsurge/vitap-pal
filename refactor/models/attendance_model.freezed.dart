// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttendanceModel implements DiagnosticableTreeMixin {

 List<Map<String, String>> get attendance;
/// Create a copy of AttendanceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceModelCopyWith<AttendanceModel> get copyWith => _$AttendanceModelCopyWithImpl<AttendanceModel>(this as AttendanceModel, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AttendanceModel'))
    ..add(DiagnosticsProperty('attendance', attendance));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceModel&&const DeepCollectionEquality().equals(other.attendance, attendance));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(attendance));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AttendanceModel(attendance: $attendance)';
}


}

/// @nodoc
abstract mixin class $AttendanceModelCopyWith<$Res>  {
  factory $AttendanceModelCopyWith(AttendanceModel value, $Res Function(AttendanceModel) _then) = _$AttendanceModelCopyWithImpl;
@useResult
$Res call({
 List<Map<String, String>> attendance
});




}
/// @nodoc
class _$AttendanceModelCopyWithImpl<$Res>
    implements $AttendanceModelCopyWith<$Res> {
  _$AttendanceModelCopyWithImpl(this._self, this._then);

  final AttendanceModel _self;
  final $Res Function(AttendanceModel) _then;

/// Create a copy of AttendanceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attendance = null,}) {
  return _then(_self.copyWith(
attendance: null == attendance ? _self.attendance : attendance // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,
  ));
}

}


/// @nodoc


class _AttendanceModel with DiagnosticableTreeMixin implements AttendanceModel {
   _AttendanceModel({required final  List<Map<String, String>> attendance}): _attendance = attendance;
  

 final  List<Map<String, String>> _attendance;
@override List<Map<String, String>> get attendance {
  if (_attendance is EqualUnmodifiableListView) return _attendance;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attendance);
}


/// Create a copy of AttendanceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceModelCopyWith<_AttendanceModel> get copyWith => __$AttendanceModelCopyWithImpl<_AttendanceModel>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AttendanceModel'))
    ..add(DiagnosticsProperty('attendance', attendance));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceModel&&const DeepCollectionEquality().equals(other._attendance, _attendance));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_attendance));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AttendanceModel(attendance: $attendance)';
}


}

/// @nodoc
abstract mixin class _$AttendanceModelCopyWith<$Res> implements $AttendanceModelCopyWith<$Res> {
  factory _$AttendanceModelCopyWith(_AttendanceModel value, $Res Function(_AttendanceModel) _then) = __$AttendanceModelCopyWithImpl;
@override @useResult
$Res call({
 List<Map<String, String>> attendance
});




}
/// @nodoc
class __$AttendanceModelCopyWithImpl<$Res>
    implements _$AttendanceModelCopyWith<$Res> {
  __$AttendanceModelCopyWithImpl(this._self, this._then);

  final _AttendanceModel _self;
  final $Res Function(_AttendanceModel) _then;

/// Create a copy of AttendanceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attendance = null,}) {
  return _then(_AttendanceModel(
attendance: null == attendance ? _self._attendance : attendance // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,
  ));
}


}

// dart format on
