// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'features_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeatureFlags implements DiagnosticableTreeMixin {

 bool get enabled; String get reason; int get fixed; String get note;
/// Create a copy of FeatureFlags
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeatureFlagsCopyWith<FeatureFlags> get copyWith => _$FeatureFlagsCopyWithImpl<FeatureFlags>(this as FeatureFlags, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FeatureFlags'))
    ..add(DiagnosticsProperty('enabled', enabled))..add(DiagnosticsProperty('reason', reason))..add(DiagnosticsProperty('fixed', fixed))..add(DiagnosticsProperty('note', note));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeatureFlags&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.fixed, fixed) || other.fixed == fixed)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,enabled,reason,fixed,note);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FeatureFlags(enabled: $enabled, reason: $reason, fixed: $fixed, note: $note)';
}


}

/// @nodoc
abstract mixin class $FeatureFlagsCopyWith<$Res>  {
  factory $FeatureFlagsCopyWith(FeatureFlags value, $Res Function(FeatureFlags) _then) = _$FeatureFlagsCopyWithImpl;
@useResult
$Res call({
 bool enabled, String reason, int fixed, String note
});




}
/// @nodoc
class _$FeatureFlagsCopyWithImpl<$Res>
    implements $FeatureFlagsCopyWith<$Res> {
  _$FeatureFlagsCopyWithImpl(this._self, this._then);

  final FeatureFlags _self;
  final $Res Function(FeatureFlags) _then;

/// Create a copy of FeatureFlags
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? reason = null,Object? fixed = null,Object? note = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,fixed: null == fixed ? _self.fixed : fixed // ignore: cast_nullable_to_non_nullable
as int,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _FeatureFlags with DiagnosticableTreeMixin implements FeatureFlags {
   _FeatureFlags({required this.enabled, required this.reason, required this.fixed, required this.note});
  

@override final  bool enabled;
@override final  String reason;
@override final  int fixed;
@override final  String note;

/// Create a copy of FeatureFlags
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeatureFlagsCopyWith<_FeatureFlags> get copyWith => __$FeatureFlagsCopyWithImpl<_FeatureFlags>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FeatureFlags'))
    ..add(DiagnosticsProperty('enabled', enabled))..add(DiagnosticsProperty('reason', reason))..add(DiagnosticsProperty('fixed', fixed))..add(DiagnosticsProperty('note', note));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeatureFlags&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.fixed, fixed) || other.fixed == fixed)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,enabled,reason,fixed,note);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FeatureFlags(enabled: $enabled, reason: $reason, fixed: $fixed, note: $note)';
}


}

/// @nodoc
abstract mixin class _$FeatureFlagsCopyWith<$Res> implements $FeatureFlagsCopyWith<$Res> {
  factory _$FeatureFlagsCopyWith(_FeatureFlags value, $Res Function(_FeatureFlags) _then) = __$FeatureFlagsCopyWithImpl;
@override @useResult
$Res call({
 bool enabled, String reason, int fixed, String note
});




}
/// @nodoc
class __$FeatureFlagsCopyWithImpl<$Res>
    implements _$FeatureFlagsCopyWith<$Res> {
  __$FeatureFlagsCopyWithImpl(this._self, this._then);

  final _FeatureFlags _self;
  final $Res Function(_FeatureFlags) _then;

/// Create a copy of FeatureFlags
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? reason = null,Object? fixed = null,Object? note = null,}) {
  return _then(_FeatureFlags(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,fixed: null == fixed ? _self.fixed : fixed // ignore: cast_nullable_to_non_nullable
as int,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$FeaturesModel implements DiagnosticableTreeMixin {

 Map<AppFeatures, FeatureFlags> get flags;
/// Create a copy of FeaturesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeaturesModelCopyWith<FeaturesModel> get copyWith => _$FeaturesModelCopyWithImpl<FeaturesModel>(this as FeaturesModel, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FeaturesModel'))
    ..add(DiagnosticsProperty('flags', flags));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeaturesModel&&const DeepCollectionEquality().equals(other.flags, flags));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(flags));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FeaturesModel(flags: $flags)';
}


}

/// @nodoc
abstract mixin class $FeaturesModelCopyWith<$Res>  {
  factory $FeaturesModelCopyWith(FeaturesModel value, $Res Function(FeaturesModel) _then) = _$FeaturesModelCopyWithImpl;
@useResult
$Res call({
 Map<AppFeatures, FeatureFlags> flags
});




}
/// @nodoc
class _$FeaturesModelCopyWithImpl<$Res>
    implements $FeaturesModelCopyWith<$Res> {
  _$FeaturesModelCopyWithImpl(this._self, this._then);

  final FeaturesModel _self;
  final $Res Function(FeaturesModel) _then;

/// Create a copy of FeaturesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flags = null,}) {
  return _then(_self.copyWith(
flags: null == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as Map<AppFeatures, FeatureFlags>,
  ));
}

}


/// @nodoc


class _FeaturesModel with DiagnosticableTreeMixin implements FeaturesModel {
   _FeaturesModel({required final  Map<AppFeatures, FeatureFlags> flags}): _flags = flags;
  

 final  Map<AppFeatures, FeatureFlags> _flags;
@override Map<AppFeatures, FeatureFlags> get flags {
  if (_flags is EqualUnmodifiableMapView) return _flags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_flags);
}


/// Create a copy of FeaturesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeaturesModelCopyWith<_FeaturesModel> get copyWith => __$FeaturesModelCopyWithImpl<_FeaturesModel>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FeaturesModel'))
    ..add(DiagnosticsProperty('flags', flags));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeaturesModel&&const DeepCollectionEquality().equals(other._flags, _flags));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_flags));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FeaturesModel(flags: $flags)';
}


}

/// @nodoc
abstract mixin class _$FeaturesModelCopyWith<$Res> implements $FeaturesModelCopyWith<$Res> {
  factory _$FeaturesModelCopyWith(_FeaturesModel value, $Res Function(_FeaturesModel) _then) = __$FeaturesModelCopyWithImpl;
@override @useResult
$Res call({
 Map<AppFeatures, FeatureFlags> flags
});




}
/// @nodoc
class __$FeaturesModelCopyWithImpl<$Res>
    implements _$FeaturesModelCopyWith<$Res> {
  __$FeaturesModelCopyWithImpl(this._self, this._then);

  final _FeaturesModel _self;
  final $Res Function(_FeaturesModel) _then;

/// Create a copy of FeaturesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flags = null,}) {
  return _then(_FeaturesModel(
flags: null == flags ? _self._flags : flags // ignore: cast_nullable_to_non_nullable
as Map<AppFeatures, FeatureFlags>,
  ));
}


}

// dart format on
