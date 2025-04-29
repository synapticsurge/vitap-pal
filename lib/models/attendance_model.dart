import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'attendance_model.freezed.dart';

@freezed
sealed class AttendanceModel with _$AttendanceModel {
  factory AttendanceModel({
    required List<Map<String, String>> attendance,
    required Map<String, List<Map<String, String>>> fullAttendance,
  }) = _AttendanceModel;
}
