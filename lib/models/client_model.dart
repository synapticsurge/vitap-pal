import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:vitapmate/src/rust/api/vtop/client.dart';
part 'client_model.freezed.dart';

@freezed
sealed class ClientModel with _$ClientModel {
  factory ClientModel({
    @Default(false) bool isLogin,
    @Default(false) bool isOnline,
    @Default(false) bool isVtopDown,
    required Iclient iclient,
  }) = _ClientModel;
}
