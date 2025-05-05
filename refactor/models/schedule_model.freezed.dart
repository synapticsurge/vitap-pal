// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScheduleModel implements DiagnosticableTreeMixin {

 Map<String, List<Map<String, String>>> get schedule;
/// Create a copy of ScheduleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleModelCopyWith<ScheduleModel> get copyWith => _$ScheduleModelCopyWithImpl<ScheduleModel>(this as ScheduleModel, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ScheduleModel'))
    ..add(DiagnosticsProperty('schedule', schedule));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleModel&&const DeepCollectionEquality().equals(other.schedule, schedule));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(schedule));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ScheduleModel(schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class $ScheduleModelCopyWith<$Res>  {
  factory $ScheduleModelCopyWith(ScheduleModel value, $Res Function(ScheduleModel) _then) = _$ScheduleModelCopyWithImpl;
@useResult
$Res call({
 Map<String, List<Map<String, String>>> schedule
});




}
/// @nodoc
class _$ScheduleModelCopyWithImpl<$Res>
    implements $ScheduleModelCopyWith<$Res> {
  _$ScheduleModelCopyWithImpl(this._self, this._then);

  final ScheduleModel _self;
  final $Res Function(ScheduleModel) _then;

/// Create a copy of ScheduleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schedule = null,}) {
  return _then(_self.copyWith(
schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as Map<String, List<Map<String, String>>>,
  ));
}

}


/// @nodoc


class _ScheduleModel with DiagnosticableTreeMixin implements ScheduleModel {
   _ScheduleModel({required final  Map<String, List<Map<String, String>>> schedule}): _schedule = schedule;
  

 final  Map<String, List<Map<String, String>>> _schedule;
@override Map<String, List<Map<String, String>>> get schedule {
  if (_schedule is EqualUnmodifiableMapView) return _schedule;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_schedule);
}


/// Create a copy of ScheduleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleModelCopyWith<_ScheduleModel> get copyWith => __$ScheduleModelCopyWithImpl<_ScheduleModel>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ScheduleModel'))
    ..add(DiagnosticsProperty('schedule', schedule));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleModel&&const DeepCollectionEquality().equals(other._schedule, _schedule));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_schedule));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ScheduleModel(schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class _$ScheduleModelCopyWith<$Res> implements $ScheduleModelCopyWith<$Res> {
  factory _$ScheduleModelCopyWith(_ScheduleModel value, $Res Function(_ScheduleModel) _then) = __$ScheduleModelCopyWithImpl;
@override @useResult
$Res call({
 Map<String, List<Map<String, String>>> schedule
});




}
/// @nodoc
class __$ScheduleModelCopyWithImpl<$Res>
    implements _$ScheduleModelCopyWith<$Res> {
  __$ScheduleModelCopyWithImpl(this._self, this._then);

  final _ScheduleModel _self;
  final $Res Function(_ScheduleModel) _then;

/// Create a copy of ScheduleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schedule = null,}) {
  return _then(_ScheduleModel(
schedule: null == schedule ? _self._schedule : schedule // ignore: cast_nullable_to_non_nullable
as Map<String, List<Map<String, String>>>,
  ));
}


}

// dart format on
