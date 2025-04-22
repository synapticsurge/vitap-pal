import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'features_model.freezed.dart';

enum AppFeatures { timetable, attendance, coursepage, marks, examschedule }

@freezed
sealed class FeatureFlags with _$FeatureFlags {
  factory FeatureFlags({
    required bool enabled,
    required String reason,
    required int fixed,
    required String note,
  }) = _FeatureFlags;

  factory FeatureFlags.fromJson(Map<String, dynamic> json, int buildnumber) {
    bool enabled = json["enabled"] ?? false;
    int fixed = json["fixedIn"] ?? 0;
    if (buildnumber < fixed) {
      enabled = false;
    }

    return FeatureFlags(
      enabled: enabled,
      reason: json["reason"] ?? "",
      fixed: fixed,
      note: json["note"] ?? "",
    );
  }
  factory FeatureFlags.defaultFlags() {
    return FeatureFlags(enabled: false, reason: "", fixed: 0, note: "");
  }
}

@freezed
sealed class FeaturesModel with _$FeaturesModel {
  factory FeaturesModel({required Map<AppFeatures, FeatureFlags> flags}) =
      _FeaturesModel;

  factory FeaturesModel.fromJson(Map<String, dynamic> json, int buildnumber) {
    final featureJson = json["features"];
    Map<AppFeatures, FeatureFlags> flagsmap = {};
    for (var feature in AppFeatures.values) {
      final name = feature.name;
      if (featureJson.containsKey(name)) {
        flagsmap[feature] = FeatureFlags.fromJson(
          featureJson[name],
          buildnumber,
        );
      } else {
        flagsmap[feature] = FeatureFlags.defaultFlags();
      }
    }
    return FeaturesModel(flags: flagsmap);
  }
}
