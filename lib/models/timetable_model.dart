import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'timetable_model.freezed.dart';

@freezed
sealed class TimetableModel with _$TimetableModel {
  factory TimetableModel({
    required List<Map<String, String>> timetable,
    required List<Map<String, String>> uniquedays,
  }) = _TimetableState;
}
