// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'full_attendance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FullAttendanceModel implements DiagnosticableTreeMixin {

 Map<String, List<Map<String, String>>> get fullAttendance;
/// Create a copy of FullAttendanceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FullAttendanceModelCopyWith<FullAttendanceModel> get copyWith => _$FullAttendanceModelCopyWithImpl<FullAttendanceModel>(this as FullAttendanceModel, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FullAttendanceModel'))
    ..add(DiagnosticsProperty('fullAttendance', fullAttendance));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FullAttendanceModel&&const DeepCollectionEquality().equals(other.fullAttendance, fullAttendance));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(fullAttendance));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FullAttendanceModel(fullAttendance: $fullAttendance)';
}


}

/// @nodoc
abstract mixin class $FullAttendanceModelCopyWith<$Res>  {
  factory $FullAttendanceModelCopyWith(FullAttendanceModel value, $Res Function(FullAttendanceModel) _then) = _$FullAttendanceModelCopyWithImpl;
@useResult
$Res call({
 Map<String, List<Map<String, String>>> fullAttendance
});




}
/// @nodoc
class _$FullAttendanceModelCopyWithImpl<$Res>
    implements $FullAttendanceModelCopyWith<$Res> {
  _$FullAttendanceModelCopyWithImpl(this._self, this._then);

  final FullAttendanceModel _self;
  final $Res Function(FullAttendanceModel) _then;

/// Create a copy of FullAttendanceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullAttendance = null,}) {
  return _then(_self.copyWith(
fullAttendance: null == fullAttendance ? _self.fullAttendance : fullAttendance // ignore: cast_nullable_to_non_nullable
as Map<String, List<Map<String, String>>>,
  ));
}

}


/// @nodoc


class _FullAttendanceModel with DiagnosticableTreeMixin implements FullAttendanceModel {
   _FullAttendanceModel({required final  Map<String, List<Map<String, String>>> fullAttendance}): _fullAttendance = fullAttendance;
  

 final  Map<String, List<Map<String, String>>> _fullAttendance;
@override Map<String, List<Map<String, String>>> get fullAttendance {
  if (_fullAttendance is EqualUnmodifiableMapView) return _fullAttendance;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fullAttendance);
}


/// Create a copy of FullAttendanceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FullAttendanceModelCopyWith<_FullAttendanceModel> get copyWith => __$FullAttendanceModelCopyWithImpl<_FullAttendanceModel>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FullAttendanceModel'))
    ..add(DiagnosticsProperty('fullAttendance', fullAttendance));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FullAttendanceModel&&const DeepCollectionEquality().equals(other._fullAttendance, _fullAttendance));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_fullAttendance));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FullAttendanceModel(fullAttendance: $fullAttendance)';
}


}

/// @nodoc
abstract mixin class _$FullAttendanceModelCopyWith<$Res> implements $FullAttendanceModelCopyWith<$Res> {
  factory _$FullAttendanceModelCopyWith(_FullAttendanceModel value, $Res Function(_FullAttendanceModel) _then) = __$FullAttendanceModelCopyWithImpl;
@override @useResult
$Res call({
 Map<String, List<Map<String, String>>> fullAttendance
});




}
/// @nodoc
class __$FullAttendanceModelCopyWithImpl<$Res>
    implements _$FullAttendanceModelCopyWith<$Res> {
  __$FullAttendanceModelCopyWithImpl(this._self, this._then);

  final _FullAttendanceModel _self;
  final $Res Function(_FullAttendanceModel) _then;

/// Create a copy of FullAttendanceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullAttendance = null,}) {
  return _then(_FullAttendanceModel(
fullAttendance: null == fullAttendance ? _self._fullAttendance : fullAttendance // ignore: cast_nullable_to_non_nullable
as Map<String, List<Map<String, String>>>,
  ));
}


}

// dart format on
