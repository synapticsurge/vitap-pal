import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'user_entity.freezed.dart';

@freezed
sealed class UserEntity with _$UserEntity {
  factory UserEntity({
    required String? username,
    required String? password,
    String? semid,
    String? wifiusername,
    String? wifiPassword,
    @Default(false) bool isValid,
  }) = _UserEntity;
}
