import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'marks_model.freezed.dart';

@freezed
sealed class MarksModel with _$MarksModel {
  factory MarksModel({required List<Map<String, String>> marks}) = _MarksModel;
}
