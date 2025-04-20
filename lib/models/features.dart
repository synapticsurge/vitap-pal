import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:vitapmate/secrets.dart';

enum AppFeatures { timetable, attendance, coursepage, marks, examschedule }

class FeatureFlags {
  final bool enabled;
  final String reason;
  final int fixed;
  final String note;
  FeatureFlags({
    required this.enabled,
    required this.reason,
    required this.fixed,
    required this.note,
  });

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

class Features {
  final Map<AppFeatures, FeatureFlags> flags;
  Features(this.flags);
  static fetchFromapi() async {
    final resp = await http.get(Uri.parse(Secrets.featureAPI));
    if (resp.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(resp.body);
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return Features.fromJson(
        data,
        int.tryParse(packageInfo.buildNumber) ?? 0,
      );
    } else {
      return Features.fromJson({}, 0);
    }
  }

  factory Features.fromJson(Map<String, dynamic> json, int buildnumber) {
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
    return Features(flagsmap);
  }
}
