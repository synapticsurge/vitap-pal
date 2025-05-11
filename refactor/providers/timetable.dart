import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqlite_api.dart';
import '../models/timetable_model.dart';
import 'client.dart';
import 'db.dart';
import 'settings.dart';
import '../service/timetable_service.dart';
part 'timetable.g.dart';

@Riverpod(keepAlive: true)
class Timetable extends _$Timetable {
  @override
  Future<TimetableModel> build() async {
    var db = await ref.watch(dBProvider.future);
    var settings = await ref.watch(settingsProvider.future);
    //await TimetableService.getTimetableSemIDs(db);
    log("semid in settings ${settings.selSemId}", level: 800);
    var tt = await getTimetablefromstorage(db, settings.selSemId!);
    var days = await getUniqueDaysfromstorage(db, settings.selSemId!);
    if (tt.isEmpty) {
      await updateTimetable(db, settings.selSemId!);
      tt = await getTimetablefromstorage(db, settings.selSemId!);
      days = await getUniqueDaysfromstorage(db, settings.selSemId!);
    } else {
      Future.microtask(() async {
        await completeUpdate();
      });
    }
    log("running  timetable build", level: 800);
    return TimetableModel(timetable: tt, uniquedays: days);
  }

  Future<List<Map<String, String>>> getSemidsfromstorage(Database db) async {
    List<Map<String, String>> semids =
        await TimetableService.getTimetableSemIDs(db);
    return semids;
  }

  Future updateTimetable(Database db, String semid) async {
    var tt = await ref.read(clientProvider.notifier).timetable(semid);
    if (tt == null) return;
    if (!tt.$1) return;
    await TimetableService.saveTimetable(db, tt.$3, semid);
    log("updates timtables", level: 800);
    var timet = await getTimetablefromstorage(db, semid);
    var day = await getUniqueDaysfromstorage(db, semid);
    return (timet, day);
  }

  Future<List<Map<String, String>>> getTimetablefromstorage(
    Database db,
    String semid,
  ) async {
    var timetable = await TimetableService.getTimetable(db: db, semid: semid);
    return timetable;
  }

  Future<List<Map<String, String>>> getUniqueDaysfromstorage(
    Database db,
    String semid,
  ) async {
    var days = await TimetableService.getUniquedays(db, semid);

    return days;
  }

  Future completeUpdate() async {
    var db = await ref.read(dBProvider.future);
    var settings = await ref.read(settingsProvider.future);
    if (settings.selSemId != null) {
      log("tt update in task ", level: 800);
      //await updateSemids(client, db);
      var updateddata = await updateTimetable(db, settings.selSemId!);
      if (updateddata == (null, null) || updateddata == null) return;
      var data = await future;
      if (data.timetable != updateddata.$1 &&
          data.uniquedays != updateddata.$2) {
        state = AsyncData(
          data.copyWith(timetable: updateddata.$1, uniquedays: updateddata.$2),
        );
      }
    }
  }
}
