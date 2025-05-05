// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marks_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MarksModel implements DiagnosticableTreeMixin {

 List<Map<String, String>> get marks;
/// Create a copy of MarksModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarksModelCopyWith<MarksModel> get copyWith => _$MarksModelCopyWithImpl<MarksModel>(this as MarksModel, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MarksModel'))
    ..add(DiagnosticsProperty('marks', marks));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarksModel&&const DeepCollectionEquality().equals(other.marks, marks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(marks));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MarksModel(marks: $marks)';
}


}

/// @nodoc
abstract mixin class $MarksModelCopyWith<$Res>  {
  factory $MarksModelCopyWith(MarksModel value, $Res Function(MarksModel) _then) = _$MarksModelCopyWithImpl;
@useResult
$Res call({
 List<Map<String, String>> marks
});




}
/// @nodoc
class _$MarksModelCopyWithImpl<$Res>
    implements $MarksModelCopyWith<$Res> {
  _$MarksModelCopyWithImpl(this._self, this._then);

  final MarksModel _self;
  final $Res Function(MarksModel) _then;

/// Create a copy of MarksModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? marks = null,}) {
  return _then(_self.copyWith(
marks: null == marks ? _self.marks : marks // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,
  ));
}

}


/// @nodoc


class _MarksModel with DiagnosticableTreeMixin implements MarksModel {
   _MarksModel({required final  List<Map<String, String>> marks}): _marks = marks;
  

 final  List<Map<String, String>> _marks;
@override List<Map<String, String>> get marks {
  if (_marks is EqualUnmodifiableListView) return _marks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_marks);
}


/// Create a copy of MarksModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarksModelCopyWith<_MarksModel> get copyWith => __$MarksModelCopyWithImpl<_MarksModel>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MarksModel'))
    ..add(DiagnosticsProperty('marks', marks));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarksModel&&const DeepCollectionEquality().equals(other._marks, _marks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_marks));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MarksModel(marks: $marks)';
}


}

/// @nodoc
abstract mixin class _$MarksModelCopyWith<$Res> implements $MarksModelCopyWith<$Res> {
  factory _$MarksModelCopyWith(_MarksModel value, $Res Function(_MarksModel) _then) = __$MarksModelCopyWithImpl;
@override @useResult
$Res call({
 List<Map<String, String>> marks
});




}
/// @nodoc
class __$MarksModelCopyWithImpl<$Res>
    implements _$MarksModelCopyWith<$Res> {
  __$MarksModelCopyWithImpl(this._self, this._then);

  final _MarksModel _self;
  final $Res Function(_MarksModel) _then;

/// Create a copy of MarksModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? marks = null,}) {
  return _then(_MarksModel(
marks: null == marks ? _self._marks : marks // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,
  ));
}


}

// dart format on
