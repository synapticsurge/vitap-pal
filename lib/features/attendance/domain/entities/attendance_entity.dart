import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:vitapmate/features/attendance/domain/entities/sub_attendance_entity.dart';
part 'attendance_entity.freezed.dart';

@freezed
sealed class AttendanceEntity with _$AttendanceEntity {
  factory AttendanceEntity({required List<SubAttendanceEntity> attendance}) =
      _AttendanceEntity;
}
