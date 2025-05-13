// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_full_attendance_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubFullAttendanceEntity implements DiagnosticableTreeMixin {

 String get serial; String get date; String get slot; String get dayTime; String get status; String get remark; String get semid; int get updateTime;
/// Create a copy of SubFullAttendanceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubFullAttendanceEntityCopyWith<SubFullAttendanceEntity> get copyWith => _$SubFullAttendanceEntityCopyWithImpl<SubFullAttendanceEntity>(this as SubFullAttendanceEntity, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SubFullAttendanceEntity'))
    ..add(DiagnosticsProperty('serial', serial))..add(DiagnosticsProperty('date', date))..add(DiagnosticsProperty('slot', slot))..add(DiagnosticsProperty('dayTime', dayTime))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('remark', remark))..add(DiagnosticsProperty('semid', semid))..add(DiagnosticsProperty('updateTime', updateTime));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubFullAttendanceEntity&&(identical(other.serial, serial) || other.serial == serial)&&(identical(other.date, date) || other.date == date)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.dayTime, dayTime) || other.dayTime == dayTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.remark, remark) || other.remark == remark)&&(identical(other.semid, semid) || other.semid == semid)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime));
}


@override
int get hashCode => Object.hash(runtimeType,serial,date,slot,dayTime,status,remark,semid,updateTime);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SubFullAttendanceEntity(serial: $serial, date: $date, slot: $slot, dayTime: $dayTime, status: $status, remark: $remark, semid: $semid, updateTime: $updateTime)';
}


}

/// @nodoc
abstract mixin class $SubFullAttendanceEntityCopyWith<$Res>  {
  factory $SubFullAttendanceEntityCopyWith(SubFullAttendanceEntity value, $Res Function(SubFullAttendanceEntity) _then) = _$SubFullAttendanceEntityCopyWithImpl;
@useResult
$Res call({
 String serial, String date, String slot, String dayTime, String status, String remark, String semid, int updateTime
});




}
/// @nodoc
class _$SubFullAttendanceEntityCopyWithImpl<$Res>
    implements $SubFullAttendanceEntityCopyWith<$Res> {
  _$SubFullAttendanceEntityCopyWithImpl(this._self, this._then);

  final SubFullAttendanceEntity _self;
  final $Res Function(SubFullAttendanceEntity) _then;

/// Create a copy of SubFullAttendanceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serial = null,Object? date = null,Object? slot = null,Object? dayTime = null,Object? status = null,Object? remark = null,Object? semid = null,Object? updateTime = null,}) {
  return _then(_self.copyWith(
serial: null == serial ? _self.serial : serial // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as String,dayTime: null == dayTime ? _self.dayTime : dayTime // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,remark: null == remark ? _self.remark : remark // ignore: cast_nullable_to_non_nullable
as String,semid: null == semid ? _self.semid : semid // ignore: cast_nullable_to_non_nullable
as String,updateTime: null == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _SubFullAttendanceEntity with DiagnosticableTreeMixin implements SubFullAttendanceEntity {
   _SubFullAttendanceEntity({required this.serial, required this.date, required this.slot, required this.dayTime, required this.status, required this.remark, required this.semid, required this.updateTime});
  

@override final  String serial;
@override final  String date;
@override final  String slot;
@override final  String dayTime;
@override final  String status;
@override final  String remark;
@override final  String semid;
@override final  int updateTime;

/// Create a copy of SubFullAttendanceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubFullAttendanceEntityCopyWith<_SubFullAttendanceEntity> get copyWith => __$SubFullAttendanceEntityCopyWithImpl<_SubFullAttendanceEntity>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SubFullAttendanceEntity'))
    ..add(DiagnosticsProperty('serial', serial))..add(DiagnosticsProperty('date', date))..add(DiagnosticsProperty('slot', slot))..add(DiagnosticsProperty('dayTime', dayTime))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('remark', remark))..add(DiagnosticsProperty('semid', semid))..add(DiagnosticsProperty('updateTime', updateTime));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubFullAttendanceEntity&&(identical(other.serial, serial) || other.serial == serial)&&(identical(other.date, date) || other.date == date)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.dayTime, dayTime) || other.dayTime == dayTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.remark, remark) || other.remark == remark)&&(identical(other.semid, semid) || other.semid == semid)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime));
}


@override
int get hashCode => Object.hash(runtimeType,serial,date,slot,dayTime,status,remark,semid,updateTime);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SubFullAttendanceEntity(serial: $serial, date: $date, slot: $slot, dayTime: $dayTime, status: $status, remark: $remark, semid: $semid, updateTime: $updateTime)';
}


}

/// @nodoc
abstract mixin class _$SubFullAttendanceEntityCopyWith<$Res> implements $SubFullAttendanceEntityCopyWith<$Res> {
  factory _$SubFullAttendanceEntityCopyWith(_SubFullAttendanceEntity value, $Res Function(_SubFullAttendanceEntity) _then) = __$SubFullAttendanceEntityCopyWithImpl;
@override @useResult
$Res call({
 String serial, String date, String slot, String dayTime, String status, String remark, String semid, int updateTime
});




}
/// @nodoc
class __$SubFullAttendanceEntityCopyWithImpl<$Res>
    implements _$SubFullAttendanceEntityCopyWith<$Res> {
  __$SubFullAttendanceEntityCopyWithImpl(this._self, this._then);

  final _SubFullAttendanceEntity _self;
  final $Res Function(_SubFullAttendanceEntity) _then;

/// Create a copy of SubFullAttendanceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serial = null,Object? date = null,Object? slot = null,Object? dayTime = null,Object? status = null,Object? remark = null,Object? semid = null,Object? updateTime = null,}) {
  return _then(_SubFullAttendanceEntity(
serial: null == serial ? _self.serial : serial // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as String,dayTime: null == dayTime ? _self.dayTime : dayTime // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,remark: null == remark ? _self.remark : remark // ignore: cast_nullable_to_non_nullable
as String,semid: null == semid ? _self.semid : semid // ignore: cast_nullable_to_non_nullable
as String,updateTime: null == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
