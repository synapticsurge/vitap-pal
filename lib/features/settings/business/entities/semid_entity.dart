import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:vitapmate/features/settings/business/entities/sub_semid_entities.dart';
part 'semid_entity.freezed.dart';

@freezed
sealed class SemidEntity with _$SemidEntity {
  factory SemidEntity({required List<SubSemidEntities> semids}) = _SemidEntity;
}
