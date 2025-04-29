import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:vitapmate/models/timetable_model.dart';
import 'package:vitapmate/providers/client.dart';
import 'package:vitapmate/providers/db.dart';
import 'package:vitapmate/providers/settings.dart';
import 'package:vitapmate/providers/app_state.dart';
import 'package:vitapmate/service/timetable_service.dart';
import 'package:vitapmate/src/rust/api/vtop/client.dart';
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
    Future.microtask(() async {
      await completeUpdate();
    });

    var tt = await getTimetablefromstorage(db, settings.selSemId!);
    var days = await getUniqueDaysfromstorage(db, settings.selSemId!);
    print("running  timetable build");
    return TimetableModel(timetable: tt, uniquedays: days);
  }

  Future<List<Map<String, String>>> getSemidsfromstorage(Database db) async {
    List<Map<String, String>> semids =
        await TimetableService.getTimetableSemIDs(db);
    return semids;
  }

  Future<void> updateTimetable(
    Iclient client,
    Database db,
    String semid,
  ) async {
    var tt = await rustTimetable(client: client, semid: semid);
    ref.watch(appStateProvider.notifier).updatestate(tt);
    if (!tt.$1) return;
    await TimetableService.saveTimetable(db, tt.$3, semid);
    print("updates timtables");
    var timet = await getTimetablefromstorage(db, semid);
    var day = await getUniqueDaysfromstorage(db, semid);
    var data = await future;
    if (data.timetable != timet && data.uniquedays != day) {
      state = AsyncData(data.copyWith(timetable: timet, uniquedays: day));
    }
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
    var client = await ref.watch(clientProvider.future);
    if (settings.selSemId != null) {
      print("tt update in task ");
      //await updateSemids(client, db);
      await updateTimetable(client, db, settings.selSemId!);
      print("done");
    }
  }
}
