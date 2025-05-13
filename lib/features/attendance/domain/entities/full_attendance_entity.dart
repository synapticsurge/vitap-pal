import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:vitapmate/features/attendance/domain/entities/sub_full_attendance_entity.dart';
part 'full_attendance_entity.freezed.dart';

@freezed
sealed class FullAttendanceEntity with _$FullAttendanceEntity {
  factory FullAttendanceEntity({required List<SubFullAttendanceEntity> attendance}) = _FullAttendanceEntity;
}
