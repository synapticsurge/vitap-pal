// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_attendance_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubAttendanceEntity implements DiagnosticableTreeMixin {

 String get serial; String get category; String get courseName; String get courseCode; String get courseType; String get facultyDetail; String get classesAttended; String get totalClasses; String get attendancePercentage; String get attendenceFatCat; String get debarStatus; String get courseId; String get semid; int get updateTime;
/// Create a copy of SubAttendanceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubAttendanceEntityCopyWith<SubAttendanceEntity> get copyWith => _$SubAttendanceEntityCopyWithImpl<SubAttendanceEntity>(this as SubAttendanceEntity, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SubAttendanceEntity'))
    ..add(DiagnosticsProperty('serial', serial))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('courseName', courseName))..add(DiagnosticsProperty('courseCode', courseCode))..add(DiagnosticsProperty('courseType', courseType))..add(DiagnosticsProperty('facultyDetail', facultyDetail))..add(DiagnosticsProperty('classesAttended', classesAttended))..add(DiagnosticsProperty('totalClasses', totalClasses))..add(DiagnosticsProperty('attendancePercentage', attendancePercentage))..add(DiagnosticsProperty('attendenceFatCat', attendenceFatCat))..add(DiagnosticsProperty('debarStatus', debarStatus))..add(DiagnosticsProperty('courseId', courseId))..add(DiagnosticsProperty('semid', semid))..add(DiagnosticsProperty('updateTime', updateTime));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubAttendanceEntity&&(identical(other.serial, serial) || other.serial == serial)&&(identical(other.category, category) || other.category == category)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.courseCode, courseCode) || other.courseCode == courseCode)&&(identical(other.courseType, courseType) || other.courseType == courseType)&&(identical(other.facultyDetail, facultyDetail) || other.facultyDetail == facultyDetail)&&(identical(other.classesAttended, classesAttended) || other.classesAttended == classesAttended)&&(identical(other.totalClasses, totalClasses) || other.totalClasses == totalClasses)&&(identical(other.attendancePercentage, attendancePercentage) || other.attendancePercentage == attendancePercentage)&&(identical(other.attendenceFatCat, attendenceFatCat) || other.attendenceFatCat == attendenceFatCat)&&(identical(other.debarStatus, debarStatus) || other.debarStatus == debarStatus)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.semid, semid) || other.semid == semid)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime));
}


@override
int get hashCode => Object.hash(runtimeType,serial,category,courseName,courseCode,courseType,facultyDetail,classesAttended,totalClasses,attendancePercentage,attendenceFatCat,debarStatus,courseId,semid,updateTime);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SubAttendanceEntity(serial: $serial, category: $category, courseName: $courseName, courseCode: $courseCode, courseType: $courseType, facultyDetail: $facultyDetail, classesAttended: $classesAttended, totalClasses: $totalClasses, attendancePercentage: $attendancePercentage, attendenceFatCat: $attendenceFatCat, debarStatus: $debarStatus, courseId: $courseId, semid: $semid, updateTime: $updateTime)';
}


}

/// @nodoc
abstract mixin class $SubAttendanceEntityCopyWith<$Res>  {
  factory $SubAttendanceEntityCopyWith(SubAttendanceEntity value, $Res Function(SubAttendanceEntity) _then) = _$SubAttendanceEntityCopyWithImpl;
@useResult
$Res call({
 String serial, String category, String courseName, String courseCode, String courseType, String facultyDetail, String classesAttended, String totalClasses, String attendancePercentage, String attendenceFatCat, String debarStatus, String courseId, String semid, int updateTime
});




}
/// @nodoc
class _$SubAttendanceEntityCopyWithImpl<$Res>
    implements $SubAttendanceEntityCopyWith<$Res> {
  _$SubAttendanceEntityCopyWithImpl(this._self, this._then);

  final SubAttendanceEntity _self;
  final $Res Function(SubAttendanceEntity) _then;

/// Create a copy of SubAttendanceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serial = null,Object? category = null,Object? courseName = null,Object? courseCode = null,Object? courseType = null,Object? facultyDetail = null,Object? classesAttended = null,Object? totalClasses = null,Object? attendancePercentage = null,Object? attendenceFatCat = null,Object? debarStatus = null,Object? courseId = null,Object? semid = null,Object? updateTime = null,}) {
  return _then(_self.copyWith(
serial: null == serial ? _self.serial : serial // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,courseName: null == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String,courseCode: null == courseCode ? _self.courseCode : courseCode // ignore: cast_nullable_to_non_nullable
as String,courseType: null == courseType ? _self.courseType : courseType // ignore: cast_nullable_to_non_nullable
as String,facultyDetail: null == facultyDetail ? _self.facultyDetail : facultyDetail // ignore: cast_nullable_to_non_nullable
as String,classesAttended: null == classesAttended ? _self.classesAttended : classesAttended // ignore: cast_nullable_to_non_nullable
as String,totalClasses: null == totalClasses ? _self.totalClasses : totalClasses // ignore: cast_nullable_to_non_nullable
as String,attendancePercentage: null == attendancePercentage ? _self.attendancePercentage : attendancePercentage // ignore: cast_nullable_to_non_nullable
as String,attendenceFatCat: null == attendenceFatCat ? _self.attendenceFatCat : attendenceFatCat // ignore: cast_nullable_to_non_nullable
as String,debarStatus: null == debarStatus ? _self.debarStatus : debarStatus // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,semid: null == semid ? _self.semid : semid // ignore: cast_nullable_to_non_nullable
as String,updateTime: null == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _SubAttendanceEntity with DiagnosticableTreeMixin implements SubAttendanceEntity {
   _SubAttendanceEntity({required this.serial, required this.category, required this.courseName, required this.courseCode, required this.courseType, required this.facultyDetail, required this.classesAttended, required this.totalClasses, required this.attendancePercentage, required this.attendenceFatCat, required this.debarStatus, required this.courseId, required this.semid, required this.updateTime});
  

@override final  String serial;
@override final  String category;
@override final  String courseName;
@override final  String courseCode;
@override final  String courseType;
@override final  String facultyDetail;
@override final  String classesAttended;
@override final  String totalClasses;
@override final  String attendancePercentage;
@override final  String attendenceFatCat;
@override final  String debarStatus;
@override final  String courseId;
@override final  String semid;
@override final  int updateTime;

/// Create a copy of SubAttendanceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubAttendanceEntityCopyWith<_SubAttendanceEntity> get copyWith => __$SubAttendanceEntityCopyWithImpl<_SubAttendanceEntity>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SubAttendanceEntity'))
    ..add(DiagnosticsProperty('serial', serial))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('courseName', courseName))..add(DiagnosticsProperty('courseCode', courseCode))..add(DiagnosticsProperty('courseType', courseType))..add(DiagnosticsProperty('facultyDetail', facultyDetail))..add(DiagnosticsProperty('classesAttended', classesAttended))..add(DiagnosticsProperty('totalClasses', totalClasses))..add(DiagnosticsProperty('attendancePercentage', attendancePercentage))..add(DiagnosticsProperty('attendenceFatCat', attendenceFatCat))..add(DiagnosticsProperty('debarStatus', debarStatus))..add(DiagnosticsProperty('courseId', courseId))..add(DiagnosticsProperty('semid', semid))..add(DiagnosticsProperty('updateTime', updateTime));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubAttendanceEntity&&(identical(other.serial, serial) || other.serial == serial)&&(identical(other.category, category) || other.category == category)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.courseCode, courseCode) || other.courseCode == courseCode)&&(identical(other.courseType, courseType) || other.courseType == courseType)&&(identical(other.facultyDetail, facultyDetail) || other.facultyDetail == facultyDetail)&&(identical(other.classesAttended, classesAttended) || other.classesAttended == classesAttended)&&(identical(other.totalClasses, totalClasses) || other.totalClasses == totalClasses)&&(identical(other.attendancePercentage, attendancePercentage) || other.attendancePercentage == attendancePercentage)&&(identical(other.attendenceFatCat, attendenceFatCat) || other.attendenceFatCat == attendenceFatCat)&&(identical(other.debarStatus, debarStatus) || other.debarStatus == debarStatus)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.semid, semid) || other.semid == semid)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime));
}


@override
int get hashCode => Object.hash(runtimeType,serial,category,courseName,courseCode,courseType,facultyDetail,classesAttended,totalClasses,attendancePercentage,attendenceFatCat,debarStatus,courseId,semid,updateTime);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SubAttendanceEntity(serial: $serial, category: $category, courseName: $courseName, courseCode: $courseCode, courseType: $courseType, facultyDetail: $facultyDetail, classesAttended: $classesAttended, totalClasses: $totalClasses, attendancePercentage: $attendancePercentage, attendenceFatCat: $attendenceFatCat, debarStatus: $debarStatus, courseId: $courseId, semid: $semid, updateTime: $updateTime)';
}


}

/// @nodoc
abstract mixin class _$SubAttendanceEntityCopyWith<$Res> implements $SubAttendanceEntityCopyWith<$Res> {
  factory _$SubAttendanceEntityCopyWith(_SubAttendanceEntity value, $Res Function(_SubAttendanceEntity) _then) = __$SubAttendanceEntityCopyWithImpl;
@override @useResult
$Res call({
 String serial, String category, String courseName, String courseCode, String courseType, String facultyDetail, String classesAttended, String totalClasses, String attendancePercentage, String attendenceFatCat, String debarStatus, String courseId, String semid, int updateTime
});




}
/// @nodoc
class __$SubAttendanceEntityCopyWithImpl<$Res>
    implements _$SubAttendanceEntityCopyWith<$Res> {
  __$SubAttendanceEntityCopyWithImpl(this._self, this._then);

  final _SubAttendanceEntity _self;
  final $Res Function(_SubAttendanceEntity) _then;

/// Create a copy of SubAttendanceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serial = null,Object? category = null,Object? courseName = null,Object? courseCode = null,Object? courseType = null,Object? facultyDetail = null,Object? classesAttended = null,Object? totalClasses = null,Object? attendancePercentage = null,Object? attendenceFatCat = null,Object? debarStatus = null,Object? courseId = null,Object? semid = null,Object? updateTime = null,}) {
  return _then(_SubAttendanceEntity(
serial: null == serial ? _self.serial : serial // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,courseName: null == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String,courseCode: null == courseCode ? _self.courseCode : courseCode // ignore: cast_nullable_to_non_nullable
as String,courseType: null == courseType ? _self.courseType : courseType // ignore: cast_nullable_to_non_nullable
as String,facultyDetail: null == facultyDetail ? _self.facultyDetail : facultyDetail // ignore: cast_nullable_to_non_nullable
as String,classesAttended: null == classesAttended ? _self.classesAttended : classesAttended // ignore: cast_nullable_to_non_nullable
as String,totalClasses: null == totalClasses ? _self.totalClasses : totalClasses // ignore: cast_nullable_to_non_nullable
as String,attendancePercentage: null == attendancePercentage ? _self.attendancePercentage : attendancePercentage // ignore: cast_nullable_to_non_nullable
as String,attendenceFatCat: null == attendenceFatCat ? _self.attendenceFatCat : attendenceFatCat // ignore: cast_nullable_to_non_nullable
as String,debarStatus: null == debarStatus ? _self.debarStatus : debarStatus // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,semid: null == semid ? _self.semid : semid // ignore: cast_nullable_to_non_nullable
as String,updateTime: null == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
