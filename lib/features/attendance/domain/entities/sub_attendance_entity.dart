import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'sub_attendance_entity.freezed.dart';

@freezed
sealed class SubAttendanceEntity with _$SubAttendanceEntity {
  factory SubAttendanceEntity({
    required String serial,
    required String category,
    required String courseName,
    required String courseCode,
    required String courseType,
    required String facultyDetail,
    required String classesAttended,
    required String totalClasses,
    required String attendancePercentage,
    required String attendenceFatCat,
    required String debarStatus,
    required String courseId,
    required String semid,
    required int updateTime,
  }) = _SubAttendanceEntity;
}
