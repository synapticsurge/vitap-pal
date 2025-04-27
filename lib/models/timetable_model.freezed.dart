// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timetable_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimetableModel implements DiagnosticableTreeMixin {

 List<Map<String, String>> get timetable; List<Map<String, String>> get semid; List<Map<String, String>> get uniquedays;
/// Create a copy of TimetableModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimetableModelCopyWith<TimetableModel> get copyWith => _$TimetableModelCopyWithImpl<TimetableModel>(this as TimetableModel, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimetableModel'))
    ..add(DiagnosticsProperty('timetable', timetable))..add(DiagnosticsProperty('semid', semid))..add(DiagnosticsProperty('uniquedays', uniquedays));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimetableModel&&const DeepCollectionEquality().equals(other.timetable, timetable)&&const DeepCollectionEquality().equals(other.semid, semid)&&const DeepCollectionEquality().equals(other.uniquedays, uniquedays));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(timetable),const DeepCollectionEquality().hash(semid),const DeepCollectionEquality().hash(uniquedays));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TimetableModel(timetable: $timetable, semid: $semid, uniquedays: $uniquedays)';
}


}

/// @nodoc
abstract mixin class $TimetableModelCopyWith<$Res>  {
  factory $TimetableModelCopyWith(TimetableModel value, $Res Function(TimetableModel) _then) = _$TimetableModelCopyWithImpl;
@useResult
$Res call({
 List<Map<String, String>> timetable, List<Map<String, String>> semid, List<Map<String, String>> uniquedays
});




}
/// @nodoc
class _$TimetableModelCopyWithImpl<$Res>
    implements $TimetableModelCopyWith<$Res> {
  _$TimetableModelCopyWithImpl(this._self, this._then);

  final TimetableModel _self;
  final $Res Function(TimetableModel) _then;

/// Create a copy of TimetableModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timetable = null,Object? semid = null,Object? uniquedays = null,}) {
  return _then(_self.copyWith(
timetable: null == timetable ? _self.timetable : timetable // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,semid: null == semid ? _self.semid : semid // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,uniquedays: null == uniquedays ? _self.uniquedays : uniquedays // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,
  ));
}

}


/// @nodoc


class _TimetableState with DiagnosticableTreeMixin implements TimetableModel {
   _TimetableState({required final  List<Map<String, String>> timetable, required final  List<Map<String, String>> semid, required final  List<Map<String, String>> uniquedays}): _timetable = timetable,_semid = semid,_uniquedays = uniquedays;
  

 final  List<Map<String, String>> _timetable;
@override List<Map<String, String>> get timetable {
  if (_timetable is EqualUnmodifiableListView) return _timetable;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timetable);
}

 final  List<Map<String, String>> _semid;
@override List<Map<String, String>> get semid {
  if (_semid is EqualUnmodifiableListView) return _semid;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_semid);
}

 final  List<Map<String, String>> _uniquedays;
@override List<Map<String, String>> get uniquedays {
  if (_uniquedays is EqualUnmodifiableListView) return _uniquedays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_uniquedays);
}


/// Create a copy of TimetableModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimetableStateCopyWith<_TimetableState> get copyWith => __$TimetableStateCopyWithImpl<_TimetableState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimetableModel'))
    ..add(DiagnosticsProperty('timetable', timetable))..add(DiagnosticsProperty('semid', semid))..add(DiagnosticsProperty('uniquedays', uniquedays));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimetableState&&const DeepCollectionEquality().equals(other._timetable, _timetable)&&const DeepCollectionEquality().equals(other._semid, _semid)&&const DeepCollectionEquality().equals(other._uniquedays, _uniquedays));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_timetable),const DeepCollectionEquality().hash(_semid),const DeepCollectionEquality().hash(_uniquedays));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TimetableModel(timetable: $timetable, semid: $semid, uniquedays: $uniquedays)';
}


}

/// @nodoc
abstract mixin class _$TimetableStateCopyWith<$Res> implements $TimetableModelCopyWith<$Res> {
  factory _$TimetableStateCopyWith(_TimetableState value, $Res Function(_TimetableState) _then) = __$TimetableStateCopyWithImpl;
@override @useResult
$Res call({
 List<Map<String, String>> timetable, List<Map<String, String>> semid, List<Map<String, String>> uniquedays
});




}
/// @nodoc
class __$TimetableStateCopyWithImpl<$Res>
    implements _$TimetableStateCopyWith<$Res> {
  __$TimetableStateCopyWithImpl(this._self, this._then);

  final _TimetableState _self;
  final $Res Function(_TimetableState) _then;

/// Create a copy of TimetableModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timetable = null,Object? semid = null,Object? uniquedays = null,}) {
  return _then(_TimetableState(
timetable: null == timetable ? _self._timetable : timetable // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,semid: null == semid ? _self._semid : semid // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,uniquedays: null == uniquedays ? _self._uniquedays : uniquedays // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,
  ));
}


}

// dart format on
