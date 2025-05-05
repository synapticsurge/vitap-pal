import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'sub_semid_entities.freezed.dart';

@freezed
sealed class SubSemidEntities with _$SubSemidEntities {
  factory SubSemidEntities({required String semName, required  String semid}) = _SubSemidEntities;
}
