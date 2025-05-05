import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'full_attendance_model.freezed.dart';

@freezed
sealed class FullAttendanceModel with _$FullAttendanceModel {
  factory FullAttendanceModel({
    required Map<String, List<Map<String, String>>> fullAttendance,
  }) = _FullAttendanceModel;
}
