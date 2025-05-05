import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import '../models/attendance_model.dart';
import 'client.dart';
import 'db.dart';
import 'settings.dart';
import '../service/attendance_service.dart';
part 'attendance.g.dart';

@riverpod
class Attendance extends _$Attendance {
  @override
  Future<AttendanceModel> build() async {
    var db = await ref.watch(dBProvider.future);
    var settings = await ref.watch(settingsProvider.future);
    var k = await getAttendancefromstorage(db, settings.selSemId!);
    if (k.isEmpty) {
      await updateAttendance(db, settings.selSemId);
      k = await getAttendancefromstorage(db, settings.selSemId!);
    } else {
      Future.microtask(() async {
        await completeUpdate();
      });
    }
    log("build attendence", level: 800);
    return AttendanceModel(attendance: k);
  }

  Future<List<Map<String, String>>> getAttendancefromstorage(
    Database db,
    String semid,
  ) async {
    var attendance = await AttendanceService.getAttendance(db, semid);
    print("from save ${attendance.length}");
    return attendance;
  }

  Future updateAttendance(Database db, String? selSemId) async {
    if (selSemId != null) {
      var c = await ref.read(clientProvider.notifier).attendance(selSemId);
      if (c == null) return;
      if (c.$1) {
        await AttendanceService.saveAttendace(db, selSemId, c.$3);
        print("save ${c.$3.length}");
        var k = await getAttendancefromstorage(db, selSemId);
        return k;
      }
    }
  }

  Future completeUpdate() async {
    var settings = await ref.read(settingsProvider.future);
    var db = await ref.read(dBProvider.future);
    var k = await updateAttendance(db, settings.selSemId);
    var data = await future;
    if (k == null) return;
    if (data.attendance != k) {
      state = AsyncData(data.copyWith(attendance: k));
    }
  }
}
