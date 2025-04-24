import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'settings_model.freezed.dart';

@freezed
sealed class SettingsModel with _$SettingsModel {
  factory SettingsModel({
    String? selSemId,
    required final SharedPreferences prefs,
  }) = _SettingsModel;
}
