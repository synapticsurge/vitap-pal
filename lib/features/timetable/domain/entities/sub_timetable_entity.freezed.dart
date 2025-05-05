// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_timetable_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubTimeTableEntity implements DiagnosticableTreeMixin {

 String get serial; String get day; String get slot; String get courseCode; String get courseType; String get roomNo; String get block; String get startTime; String get endTime; String get name; String get semid; int get updateTime;
/// Create a copy of SubTimeTableEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubTimeTableEntityCopyWith<SubTimeTableEntity> get copyWith => _$SubTimeTableEntityCopyWithImpl<SubTimeTableEntity>(this as SubTimeTableEntity, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SubTimeTableEntity'))
    ..add(DiagnosticsProperty('serial', serial))..add(DiagnosticsProperty('day', day))..add(DiagnosticsProperty('slot', slot))..add(DiagnosticsProperty('courseCode', courseCode))..add(DiagnosticsProperty('courseType', courseType))..add(DiagnosticsProperty('roomNo', roomNo))..add(DiagnosticsProperty('block', block))..add(DiagnosticsProperty('startTime', startTime))..add(DiagnosticsProperty('endTime', endTime))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('semid', semid))..add(DiagnosticsProperty('updateTime', updateTime));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubTimeTableEntity&&(identical(other.serial, serial) || other.serial == serial)&&(identical(other.day, day) || other.day == day)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.courseCode, courseCode) || other.courseCode == courseCode)&&(identical(other.courseType, courseType) || other.courseType == courseType)&&(identical(other.roomNo, roomNo) || other.roomNo == roomNo)&&(identical(other.block, block) || other.block == block)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.name, name) || other.name == name)&&(identical(other.semid, semid) || other.semid == semid)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime));
}


@override
int get hashCode => Object.hash(runtimeType,serial,day,slot,courseCode,courseType,roomNo,block,startTime,endTime,name,semid,updateTime);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SubTimeTableEntity(serial: $serial, day: $day, slot: $slot, courseCode: $courseCode, courseType: $courseType, roomNo: $roomNo, block: $block, startTime: $startTime, endTime: $endTime, name: $name, semid: $semid, updateTime: $updateTime)';
}


}

/// @nodoc
abstract mixin class $SubTimeTableEntityCopyWith<$Res>  {
  factory $SubTimeTableEntityCopyWith(SubTimeTableEntity value, $Res Function(SubTimeTableEntity) _then) = _$SubTimeTableEntityCopyWithImpl;
@useResult
$Res call({
 String serial, String day, String slot, String courseCode, String courseType, String roomNo, String block, String startTime, String endTime, String name, String semid, int updateTime
});




}
/// @nodoc
class _$SubTimeTableEntityCopyWithImpl<$Res>
    implements $SubTimeTableEntityCopyWith<$Res> {
  _$SubTimeTableEntityCopyWithImpl(this._self, this._then);

  final SubTimeTableEntity _self;
  final $Res Function(SubTimeTableEntity) _then;

/// Create a copy of SubTimeTableEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serial = null,Object? day = null,Object? slot = null,Object? courseCode = null,Object? courseType = null,Object? roomNo = null,Object? block = null,Object? startTime = null,Object? endTime = null,Object? name = null,Object? semid = null,Object? updateTime = null,}) {
  return _then(_self.copyWith(
serial: null == serial ? _self.serial : serial // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as String,courseCode: null == courseCode ? _self.courseCode : courseCode // ignore: cast_nullable_to_non_nullable
as String,courseType: null == courseType ? _self.courseType : courseType // ignore: cast_nullable_to_non_nullable
as String,roomNo: null == roomNo ? _self.roomNo : roomNo // ignore: cast_nullable_to_non_nullable
as String,block: null == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,semid: null == semid ? _self.semid : semid // ignore: cast_nullable_to_non_nullable
as String,updateTime: null == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _SubTimeTableEntity with DiagnosticableTreeMixin implements SubTimeTableEntity {
   _SubTimeTableEntity({required this.serial, required this.day, required this.slot, required this.courseCode, required this.courseType, required this.roomNo, required this.block, required this.startTime, required this.endTime, required this.name, required this.semid, required this.updateTime});
  

@override final  String serial;
@override final  String day;
@override final  String slot;
@override final  String courseCode;
@override final  String courseType;
@override final  String roomNo;
@override final  String block;
@override final  String startTime;
@override final  String endTime;
@override final  String name;
@override final  String semid;
@override final  int updateTime;

/// Create a copy of SubTimeTableEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubTimeTableEntityCopyWith<_SubTimeTableEntity> get copyWith => __$SubTimeTableEntityCopyWithImpl<_SubTimeTableEntity>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SubTimeTableEntity'))
    ..add(DiagnosticsProperty('serial', serial))..add(DiagnosticsProperty('day', day))..add(DiagnosticsProperty('slot', slot))..add(DiagnosticsProperty('courseCode', courseCode))..add(DiagnosticsProperty('courseType', courseType))..add(DiagnosticsProperty('roomNo', roomNo))..add(DiagnosticsProperty('block', block))..add(DiagnosticsProperty('startTime', startTime))..add(DiagnosticsProperty('endTime', endTime))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('semid', semid))..add(DiagnosticsProperty('updateTime', updateTime));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubTimeTableEntity&&(identical(other.serial, serial) || other.serial == serial)&&(identical(other.day, day) || other.day == day)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.courseCode, courseCode) || other.courseCode == courseCode)&&(identical(other.courseType, courseType) || other.courseType == courseType)&&(identical(other.roomNo, roomNo) || other.roomNo == roomNo)&&(identical(other.block, block) || other.block == block)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.name, name) || other.name == name)&&(identical(other.semid, semid) || other.semid == semid)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime));
}


@override
int get hashCode => Object.hash(runtimeType,serial,day,slot,courseCode,courseType,roomNo,block,startTime,endTime,name,semid,updateTime);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SubTimeTableEntity(serial: $serial, day: $day, slot: $slot, courseCode: $courseCode, courseType: $courseType, roomNo: $roomNo, block: $block, startTime: $startTime, endTime: $endTime, name: $name, semid: $semid, updateTime: $updateTime)';
}


}

/// @nodoc
abstract mixin class _$SubTimeTableEntityCopyWith<$Res> implements $SubTimeTableEntityCopyWith<$Res> {
  factory _$SubTimeTableEntityCopyWith(_SubTimeTableEntity value, $Res Function(_SubTimeTableEntity) _then) = __$SubTimeTableEntityCopyWithImpl;
@override @useResult
$Res call({
 String serial, String day, String slot, String courseCode, String courseType, String roomNo, String block, String startTime, String endTime, String name, String semid, int updateTime
});




}
/// @nodoc
class __$SubTimeTableEntityCopyWithImpl<$Res>
    implements _$SubTimeTableEntityCopyWith<$Res> {
  __$SubTimeTableEntityCopyWithImpl(this._self, this._then);

  final _SubTimeTableEntity _self;
  final $Res Function(_SubTimeTableEntity) _then;

/// Create a copy of SubTimeTableEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serial = null,Object? day = null,Object? slot = null,Object? courseCode = null,Object? courseType = null,Object? roomNo = null,Object? block = null,Object? startTime = null,Object? endTime = null,Object? name = null,Object? semid = null,Object? updateTime = null,}) {
  return _then(_SubTimeTableEntity(
serial: null == serial ? _self.serial : serial // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as String,courseCode: null == courseCode ? _self.courseCode : courseCode // ignore: cast_nullable_to_non_nullable
as String,courseType: null == courseType ? _self.courseType : courseType // ignore: cast_nullable_to_non_nullable
as String,roomNo: null == roomNo ? _self.roomNo : roomNo // ignore: cast_nullable_to_non_nullable
as String,block: null == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,semid: null == semid ? _self.semid : semid // ignore: cast_nullable_to_non_nullable
as String,updateTime: null == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
