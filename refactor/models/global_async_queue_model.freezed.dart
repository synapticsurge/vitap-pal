// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_async_queue_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GlobalAsyncQueueModel implements DiagnosticableTreeMixin {

 Map<String, Future> get running;
/// Create a copy of GlobalAsyncQueueModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GlobalAsyncQueueModelCopyWith<GlobalAsyncQueueModel> get copyWith => _$GlobalAsyncQueueModelCopyWithImpl<GlobalAsyncQueueModel>(this as GlobalAsyncQueueModel, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GlobalAsyncQueueModel'))
    ..add(DiagnosticsProperty('running', running));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GlobalAsyncQueueModel&&const DeepCollectionEquality().equals(other.running, running));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(running));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GlobalAsyncQueueModel(running: $running)';
}


}

/// @nodoc
abstract mixin class $GlobalAsyncQueueModelCopyWith<$Res>  {
  factory $GlobalAsyncQueueModelCopyWith(GlobalAsyncQueueModel value, $Res Function(GlobalAsyncQueueModel) _then) = _$GlobalAsyncQueueModelCopyWithImpl;
@useResult
$Res call({
 Map<String, Future> running
});




}
/// @nodoc
class _$GlobalAsyncQueueModelCopyWithImpl<$Res>
    implements $GlobalAsyncQueueModelCopyWith<$Res> {
  _$GlobalAsyncQueueModelCopyWithImpl(this._self, this._then);

  final GlobalAsyncQueueModel _self;
  final $Res Function(GlobalAsyncQueueModel) _then;

/// Create a copy of GlobalAsyncQueueModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? running = null,}) {
  return _then(_self.copyWith(
running: null == running ? _self.running : running // ignore: cast_nullable_to_non_nullable
as Map<String, Future>,
  ));
}

}


/// @nodoc


class _GlobalAsyncQueueMode with DiagnosticableTreeMixin implements GlobalAsyncQueueModel {
  const _GlobalAsyncQueueMode({final  Map<String, Future> running = const {}}): _running = running;
  

 final  Map<String, Future> _running;
@override@JsonKey() Map<String, Future> get running {
  if (_running is EqualUnmodifiableMapView) return _running;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_running);
}


/// Create a copy of GlobalAsyncQueueModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GlobalAsyncQueueModeCopyWith<_GlobalAsyncQueueMode> get copyWith => __$GlobalAsyncQueueModeCopyWithImpl<_GlobalAsyncQueueMode>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GlobalAsyncQueueModel'))
    ..add(DiagnosticsProperty('running', running));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GlobalAsyncQueueMode&&const DeepCollectionEquality().equals(other._running, _running));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_running));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GlobalAsyncQueueModel(running: $running)';
}


}

/// @nodoc
abstract mixin class _$GlobalAsyncQueueModeCopyWith<$Res> implements $GlobalAsyncQueueModelCopyWith<$Res> {
  factory _$GlobalAsyncQueueModeCopyWith(_GlobalAsyncQueueMode value, $Res Function(_GlobalAsyncQueueMode) _then) = __$GlobalAsyncQueueModeCopyWithImpl;
@override @useResult
$Res call({
 Map<String, Future> running
});




}
/// @nodoc
class __$GlobalAsyncQueueModeCopyWithImpl<$Res>
    implements _$GlobalAsyncQueueModeCopyWith<$Res> {
  __$GlobalAsyncQueueModeCopyWithImpl(this._self, this._then);

  final _GlobalAsyncQueueMode _self;
  final $Res Function(_GlobalAsyncQueueMode) _then;

/// Create a copy of GlobalAsyncQueueModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? running = null,}) {
  return _then(_GlobalAsyncQueueMode(
running: null == running ? _self._running : running // ignore: cast_nullable_to_non_nullable
as Map<String, Future>,
  ));
}


}

// dart format on
