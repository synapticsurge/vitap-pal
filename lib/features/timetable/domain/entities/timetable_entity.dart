import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:vitapmate/features/timetable/domain/entities/sub_timetable_entity.dart';
part 'timetable_entity.freezed.dart';

@freezed
sealed class TimetableEntity with _$TimetableEntity {
  factory TimetableEntity({required List<SubTimeTableEntity> timetable}) =
      _TimetableEntity;
}
