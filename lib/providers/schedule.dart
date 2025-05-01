import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/models/schedule_model.dart';
import 'package:vitapmate/providers/app_state.dart';
import 'package:vitapmate/providers/client.dart';
import 'package:vitapmate/providers/db.dart';
import 'package:vitapmate/providers/settings.dart';
import 'package:vitapmate/service/schedule_service.dart';
import 'package:vitapmate/src/rust/api/vtop/client.dart';
import 'package:vitapmate/src/rust/api/vtop_main.dart';
part 'schedule.g.dart';

@riverpod
class Schedule extends _$Schedule {
  @override
  Future<ScheduleModel> build() async {
    Future.microtask(() async {
      await completeUpdate();
    });
    var db = await ref.watch(dBProvider.future);
    var settings = await ref.watch(settingsProvider.future);
    var k = await getSchedulefromstorage(db, settings.selSemId!);
    return ScheduleModel(schedule: k);
  }

  Future<Map<String, List<Map<String, String>>>> getSchedulefromstorage(
    Database db,
    String semid,
  ) async {
    var schedule = await ScheduleService.getSchedule(db, semid);
    Map<String, List<Map<String, String>>> schedules = {};
    for (var i in schedule) {
      String exam = i[DBschedule.examtypeRow];
      if (schedules.containsKey(exam)) {
        var k = schedules[exam];
        k?.add(i);
      } else {
        schedules[exam] = [i];
      }
    }
    return schedules;
  }

  Future<void> updateSchedule(Iclient client, Database db, String semid) async {
    var schedule = await rustExamShedule(client: client, semid: semid);
    ref.watch(appStateProvider.notifier).updatestate(schedule);
    if (!schedule.$1) return;
    await ScheduleService.saveSchedule(db, semid, schedule.$3);
    print("updates schedule");
    var fromstorage = await getSchedulefromstorage(db, semid);
    var data = await future;
    if (data.schedule != fromstorage) {
      state = AsyncData(data.copyWith(schedule: fromstorage));
    }
  }

  Future completeUpdate() async {
    var db = await ref.watch(dBProvider.future);
    var settings = await ref.watch(settingsProvider.future);
    var client = await ref.watch(clientProvider.future);
    if (settings.selSemId != null) {
      print("schedule update in task ");
      //await updateSemids(client, db);
      await updateSchedule(client, db, settings.selSemId!);
      print("done");
    }
  }
}
