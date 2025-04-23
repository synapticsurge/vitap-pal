import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vitapmate/src/rust/api/vtop/types.dart';
import 'package:flutter/foundation.dart';
part 'timetable_model.freezed.dart';

@freezed
sealed class TimetableModel with _$TimetableModel {
  factory TimetableModel({
    required List<Timetable> timetable,
    required Map<String, String> semid,
  }) = _TimetableState;
}
