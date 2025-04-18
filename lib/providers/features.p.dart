import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:vitapmate/secrets.dart';
import 'package:vitapmate/models/features.dart';

class FeaturesNotifier extends AsyncNotifier<Features> {
  @override
  Future<Features> build() async {
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
}

final featuresProvider = AsyncNotifierProvider<FeaturesNotifier, Features>(() {
  return FeaturesNotifier();
});
