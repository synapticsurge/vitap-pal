import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:vitapmate/secrets.dart';
import 'package:vitapmate/models/features_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'features.g.dart';

@Riverpod(keepAlive: true)
class Features extends _$Features {
  @override
  Future<FeaturesModel> build() async {
    final resp = await http.get(Uri.parse(Secrets.featureAPI));
    if (resp.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(resp.body);
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return FeaturesModel.fromJson(
        data,
        int.tryParse(packageInfo.buildNumber) ?? 0,
      );
    } else {
      return FeaturesModel.fromJson({}, 0);
    }
  }
}
