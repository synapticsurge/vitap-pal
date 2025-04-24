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

 List<RTimetable> get timetable; List<Map<String, String>> get semid;
/// Create a copy of TimetableModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimetableModelCopyWith<TimetableModel> get copyWith => _$TimetableModelCopyWithImpl<TimetableModel>(this as TimetableModel, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimetableModel'))
    ..add(DiagnosticsProperty('timetable', timetable))..add(DiagnosticsProperty('semid', semid));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimetableModel&&const DeepCollectionEquality().equals(other.timetable, timetable)&&const DeepCollectionEquality().equals(other.semid, semid));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(timetable),const DeepCollectionEquality().hash(semid));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TimetableModel(timetable: $timetable, semid: $semid)';
}


}

/// @nodoc
abstract mixin class $TimetableModelCopyWith<$Res>  {
  factory $TimetableModelCopyWith(TimetableModel value, $Res Function(TimetableModel) _then) = _$TimetableModelCopyWithImpl;
@useResult
$Res call({
 List<RTimetable> timetable, List<Map<String, String>> semid
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
@pragma('vm:prefer-inline') @override $Res call({Object? timetable = null,Object? semid = null,}) {
  return _then(_self.copyWith(
timetable: null == timetable ? _self.timetable : timetable // ignore: cast_nullable_to_non_nullable
as List<RTimetable>,semid: null == semid ? _self.semid : semid // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,
  ));
}

}


/// @nodoc


class _TimetableState with DiagnosticableTreeMixin implements TimetableModel {
   _TimetableState({required final  List<RTimetable> timetable, required final  List<Map<String, String>> semid}): _timetable = timetable,_semid = semid;
  

 final  List<RTimetable> _timetable;
@override List<RTimetable> get timetable {
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


/// Create a copy of TimetableModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimetableStateCopyWith<_TimetableState> get copyWith => __$TimetableStateCopyWithImpl<_TimetableState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimetableModel'))
    ..add(DiagnosticsProperty('timetable', timetable))..add(DiagnosticsProperty('semid', semid));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimetableState&&const DeepCollectionEquality().equals(other._timetable, _timetable)&&const DeepCollectionEquality().equals(other._semid, _semid));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_timetable),const DeepCollectionEquality().hash(_semid));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TimetableModel(timetable: $timetable, semid: $semid)';
}


}

/// @nodoc
abstract mixin class _$TimetableStateCopyWith<$Res> implements $TimetableModelCopyWith<$Res> {
  factory _$TimetableStateCopyWith(_TimetableState value, $Res Function(_TimetableState) _then) = __$TimetableStateCopyWithImpl;
@override @useResult
$Res call({
 List<RTimetable> timetable, List<Map<String, String>> semid
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
@override @pragma('vm:prefer-inline') $Res call({Object? timetable = null,Object? semid = null,}) {
  return _then(_TimetableState(
timetable: null == timetable ? _self._timetable : timetable // ignore: cast_nullable_to_non_nullable
as List<RTimetable>,semid: null == semid ? _self._semid : semid // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,
  ));
}


}

// dart format on
