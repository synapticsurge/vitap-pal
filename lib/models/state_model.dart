import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'state_model.freezed.dart';

@freezed
sealed class AppStateModel with _$AppStateModel {
  factory AppStateModel({
    @Default(false) isLogin,
    @Default(false) networkUp,
    @Default(false) vtopDown,
  }) = _AppStateModel;
}
