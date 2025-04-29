import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:vitapmate/src/rust/api/vtop/types.dart';
part 'attendance_model.freezed.dart';

@freezed
sealed class AttendanceModel with _$AttendanceModel {
  factory AttendanceModel({
    required List<RAtCourse> attendance,
    required Map<String, List<RAttendanceList>> fullAttendance,
  }) = _AttendanceModel;
}
