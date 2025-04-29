import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vitapmate/models/attendance_model.dart';
import 'package:vitapmate/providers/app_state.dart';
import 'package:vitapmate/providers/client.dart';
import 'package:vitapmate/providers/db.dart';
import 'package:vitapmate/providers/settings.dart';
import 'package:vitapmate/service/attendance_service.dart';
import 'package:vitapmate/src/rust/api/vtop/client.dart';
import 'package:vitapmate/src/rust/api/vtop_main.dart';
part 'attendance.g.dart';

@riverpod
class Attendance extends _$Attendance {
  @override
  Future<AttendanceModel> build() async {
    var db = await ref.watch(dBProvider.future);
    var settings = await ref.watch(settingsProvider.future);
    var k = await getAttendancefromstorage(db, settings.selSemId!);
    Future.microtask(() async {});
    return AttendanceModel(attendance: k, fullAttendance: {});
  }

  Future<List<Map<String, String>>> getAttendancefromstorage(
    Database db,
    String semid,
  ) async {
    var attendance = await AttendanceService.getAttendance(db, semid);
    return attendance;
  }

  Future<List<Map<String, String>>> getFullAttendancefromstorage(
    Database db,
    String semid,
    String classid,
  ) async {
    var attendance = await AttendanceService.getFullAttendance(
      db,
      semid,
      classid,
    );
    return attendance;
  }

  Future<void> updateTimetable(
    Iclient client,
    Database db,
    String semid,
  ) async {
    var tt = await rustAttendance(client: client, semid: semid);
    ref.watch(appStateProvider.notifier).updatestate(tt);
    if (!tt.$1) return;
    await AttendanceService.saveAttendace(db, semid, tt.$3);
    print("updates attendance");
    var att = await getAttendancefromstorage(db, semid);
    var data = await future;
    if (data.attendance != att) {
      state = AsyncData(data.copyWith(attendance: att));
    }
  }

  Future updateAttendance() async {
    var db = await ref.watch(dBProvider.future);
    var settings = await ref.watch(settingsProvider.future);
    var client = await ref.watch(clientProvider.future);
    if (settings.selSemId != null) {
      var c = await rustAttendance(client: client, semid: settings.selSemId!);
      if (c.$1) {
        AttendanceService.saveAttendace(db, settings.selSemId!, c.$3);
      }
    }
  }

  Future updateFullAttendance(String classid, String courseType) async {
    var db = await ref.watch(dBProvider.future);
    var settings = await ref.watch(settingsProvider.future);
    var client = await ref.watch(clientProvider.future);
    if (settings.selSemId != null) {
      var c = await rustFullAttendance(
        client: client,
        semid: settings.selSemId!,
        courseId: classid,
        courseType: courseType,
      );
      if (c.$1) {
        AttendanceService.saveFullAttendace(
          db,
          settings.selSemId!,
          classid,
          c.$3,
        );
      }
    }
  }
}
