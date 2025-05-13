import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'sub_full_attendance_entity.freezed.dart';

@freezed
sealed class SubFullAttendanceEntity with _$SubFullAttendanceEntity {
  factory SubFullAttendanceEntity({
    required String serial,
    required String date,
    required String slot,
    required String dayTime,
    required String status,
    required String remark,
    required String semid,
    required int updateTime,
  }) = _SubFullAttendanceEntity;
}
