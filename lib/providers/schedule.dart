import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/models/schedule_model.dart';
import 'package:vitapmate/providers/client.dart';
import 'package:vitapmate/providers/db.dart';
import 'package:vitapmate/providers/settings.dart';
import 'package:vitapmate/service/schedule_service.dart';
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

  Future<void> updateSchedule(Database db, String semid) async {
    var schedule = await ref.watch(clientProvider.notifier).examSchedule(semid);
    if (schedule == null) return;
    if (!schedule.$1) return;
    await ScheduleService.saveSchedule(db, semid, schedule.$3);
    log("updates schedule", level: 800);
    var fromstorage = await getSchedulefromstorage(db, semid);
    var data = await future;
    if (data.schedule != fromstorage) {
      state = AsyncData(data.copyWith(schedule: fromstorage));
    }
  }

  Future completeUpdate() async {
    var db = await ref.watch(dBProvider.future);
    var settings = await ref.watch(settingsProvider.future);
    if (settings.selSemId != null) {
      log("schedule update in task ", level: 800);
      //await updateSemids(client, db);
      await updateSchedule(db, settings.selSemId!);
    }
  }
}
