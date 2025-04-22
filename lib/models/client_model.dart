import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart'; 
part 'client_model.freezed.dart';


@freezed
sealed class ClientModel with _$ClientModel {
  factory ClientModel({
    @Default(false) bool isLogin,
    @Default(false) bool isOnline,
    @Default(false) bool isVtopDown,
  }) = _ClientModel;
  
}
