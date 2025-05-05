import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'sub_timetable_entity.freezed.dart';

@freezed
sealed class SubTimeTableEntity with _$SubTimeTableEntity {
  factory SubTimeTableEntity({
    required String serial,
    required String day,
    required String slot,
    required String courseCode,
    required String courseType,
    required String roomNo,
    required String block,
    required String startTime,
    required String endTime,
    required String name,
    required String semid,
    required int updateTime,
  }) = _SubTimeTableEntity;
}
