import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vitapmate/models/attendance_model.dart';
import 'package:vitapmate/providers/client.dart';
import 'package:vitapmate/providers/db.dart';
import 'package:vitapmate/providers/settings.dart';
import 'package:vitapmate/service/attendance_service.dart';
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
    return attendance;
  }

  // Future<List<Map<String, String>>> getFullAttendancefromstorage(
  //   Database db,
  //   String semid,
  //   String classid,
  // ) async {
  //   var attendance = await AttendanceService.getFullAttendance(
  //     db,
  //     semid,
  //     classid,
  //   );
  //   return attendance;
  // }

  Future updateAttendance(Database db, String? selSemId) async {
    if (selSemId != null) {
      var c = await ref.watch(clientProvider.notifier).attendance(selSemId);
      if (c == null) return;
      if (c.$1) {
        await AttendanceService.saveAttendace(db, selSemId, c.$3);
        var k = await getAttendancefromstorage(db, selSemId);
        return k;
      }
    }
  }

  Future completeUpdate() async {
    var settings = await ref.watch(settingsProvider.future);
    var db = await ref.watch(dBProvider.future);
    var k = await updateAttendance(db, settings.selSemId);
    var data = await future;
    if (data.attendance != k && k != null) {
      state = AsyncData(data.copyWith(attendance: k));
    }
  }

  // Future updateFullAttendance(String classid, String courseType) async {
  //   var db = await ref.watch(dBProvider.future);
  //   var settings = await ref.watch(settingsProvider.future);
  //   if (settings.selSemId != null) {
  //     var c = await ref
  //         .watch(clientProvider.notifier)
  //         .fullAttendance(settings.selSemId!, classid.trim(), courseType);
  //     print(c);
  //     if (c.$1) {
  //       print(c.$3[0]);
  //       await AttendanceService.saveFullAttendace(
  //         db,
  //         settings.selSemId!,
  //         classid,
  //         c.$3,
  //       );
  //     }
  //     var at = await getFullAttendancefromstorage(
  //       db,
  //       settings.selSemId!,
  //       classid,
  //     );
  //     var data = await future;
  //     var save = Map<String, List<Map<String, String>>>.from(
  //       data.fullAttendance,
  //     );
  //     save[classid] = at;
  //     print(save);
  //     state = AsyncData(data.copyWith(fullAttendance: save));
  //   }
  // }
}
