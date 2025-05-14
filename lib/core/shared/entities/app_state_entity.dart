import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'app_state_entity.freezed.dart';

@freezed
sealed class AppStateEntity with _$AppStateEntity {
  factory AppStateEntity({
    @Default(false) bool loginloading,
    @Default(true) bool newtork,
    @Default(false) isLogin,
    @Default(false) vtopDown,
  }) = _AppStateEntity;
}
