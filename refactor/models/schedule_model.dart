import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'schedule_model.freezed.dart';

@freezed
sealed class ScheduleModel with _$ScheduleModel {
  factory ScheduleModel({
    required Map<String, List<Map<String, String>>> schedule,
  }) = _ScheduleModel;
}
