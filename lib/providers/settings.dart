import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitapmate/models/settings_model.dart';
part 'settings.g.dart';

@riverpod
class Settings extends _$Settings {
  @override
  Future<SettingsModel> build() async {
    var prefs = await SharedPreferences.getInstance();
    log("build from settings", level: 800);
    return SettingsModel(prefs: prefs, selSemId: prefs.getString("selSemId"));
  }

  Future<void> changeSemId(String semid) async {
    var data = await future;
    await data.prefs.setString("selSemId", semid);
    state = AsyncData(data.copyWith(selSemId: semid));
    var data1 = await future;
    log('sel sem id ${data1.selSemId}', level: 800);
  }
}
