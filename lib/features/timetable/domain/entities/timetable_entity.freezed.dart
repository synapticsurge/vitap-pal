// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timetable_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimetableEntity implements DiagnosticableTreeMixin {

 List<SubTimeTableEntity> get timetable;
/// Create a copy of TimetableEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimetableEntityCopyWith<TimetableEntity> get copyWith => _$TimetableEntityCopyWithImpl<TimetableEntity>(this as TimetableEntity, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimetableEntity'))
    ..add(DiagnosticsProperty('timetable', timetable));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimetableEntity&&const DeepCollectionEquality().equals(other.timetable, timetable));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(timetable));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TimetableEntity(timetable: $timetable)';
}


}

/// @nodoc
abstract mixin class $TimetableEntityCopyWith<$Res>  {
  factory $TimetableEntityCopyWith(TimetableEntity value, $Res Function(TimetableEntity) _then) = _$TimetableEntityCopyWithImpl;
@useResult
$Res call({
 List<SubTimeTableEntity> timetable
});




}
/// @nodoc
class _$TimetableEntityCopyWithImpl<$Res>
    implements $TimetableEntityCopyWith<$Res> {
  _$TimetableEntityCopyWithImpl(this._self, this._then);

  final TimetableEntity _self;
  final $Res Function(TimetableEntity) _then;

/// Create a copy of TimetableEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timetable = null,}) {
  return _then(_self.copyWith(
timetable: null == timetable ? _self.timetable : timetable // ignore: cast_nullable_to_non_nullable
as List<SubTimeTableEntity>,
  ));
}

}


/// @nodoc


class _TimetableEntity with DiagnosticableTreeMixin implements TimetableEntity {
   _TimetableEntity({required final  List<SubTimeTableEntity> timetable}): _timetable = timetable;
  

 final  List<SubTimeTableEntity> _timetable;
@override List<SubTimeTableEntity> get timetable {
  if (_timetable is EqualUnmodifiableListView) return _timetable;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timetable);
}


/// Create a copy of TimetableEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimetableEntityCopyWith<_TimetableEntity> get copyWith => __$TimetableEntityCopyWithImpl<_TimetableEntity>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimetableEntity'))
    ..add(DiagnosticsProperty('timetable', timetable));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimetableEntity&&const DeepCollectionEquality().equals(other._timetable, _timetable));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_timetable));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TimetableEntity(timetable: $timetable)';
}


}

/// @nodoc
abstract mixin class _$TimetableEntityCopyWith<$Res> implements $TimetableEntityCopyWith<$Res> {
  factory _$TimetableEntityCopyWith(_TimetableEntity value, $Res Function(_TimetableEntity) _then) = __$TimetableEntityCopyWithImpl;
@override @useResult
$Res call({
 List<SubTimeTableEntity> timetable
});




}
/// @nodoc
class __$TimetableEntityCopyWithImpl<$Res>
    implements _$TimetableEntityCopyWith<$Res> {
  __$TimetableEntityCopyWithImpl(this._self, this._then);

  final _TimetableEntity _self;
  final $Res Function(_TimetableEntity) _then;

/// Create a copy of TimetableEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timetable = null,}) {
  return _then(_TimetableEntity(
timetable: null == timetable ? _self._timetable : timetable // ignore: cast_nullable_to_non_nullable
as List<SubTimeTableEntity>,
  ));
}


}

// dart format on
