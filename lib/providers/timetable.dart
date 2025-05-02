import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:vitapmate/models/timetable_model.dart';
import 'package:vitapmate/providers/client.dart';
import 'package:vitapmate/providers/db.dart';
import 'package:vitapmate/providers/settings.dart';
import 'package:vitapmate/providers/app_state.dart';
import 'package:vitapmate/service/timetable_service.dart';
import 'package:vitapmate/src/rust/api/vtop_main.dart';
part 'timetable.g.dart';

@Riverpod(keepAlive: true)
class Timetable extends _$Timetable {
  @override
  Future<TimetableModel> build() async {
    var db = await ref.watch(dBProvider.future);
    var settings = await ref.watch(settingsProvider.future);
    //await TimetableService.getTimetableSemIDs(db);
    print("semid in settings ${settings.selSemId}");
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
    print("running  timetable build");
    return TimetableModel(timetable: tt, uniquedays: days);
  }

  Future<List<Map<String, String>>> getSemidsfromstorage(Database db) async {
    List<Map<String, String>> semids =
        await TimetableService.getTimetableSemIDs(db);
    return semids;
  }

  Future updateTimetable(Database db, String semid) async {
    var client = await ref.watch(clientProvider.future);
    var tt = await rustTimetable(client: client, semid: semid);
    print("rust is doine");
    ref.watch(appStateProvider.notifier).updatestate(tt);
    if (!tt.$1) return;
    await TimetableService.saveTimetable(db, tt.$3, semid);
    print("updates timtables");
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
    var db = await ref.watch(dBProvider.future);
    var settings = await ref.watch(settingsProvider.future);
    if (settings.selSemId != null) {
      print("tt update in task ");
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
      print("done");
    }
  }
}
