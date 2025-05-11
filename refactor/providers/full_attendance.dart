import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vitapmate/core/constants/constants.dart';
import '../models/full_attendance_model.dart';
import 'client.dart';
import 'db.dart';
import 'settings.dart';
import '../service/attendance_service.dart';
part 'full_attendance.g.dart';

@Riverpod(keepAlive: true)
class FullAttendance extends _$FullAttendance {
  @override
  Future<FullAttendanceModel> build() async {
    var db = await ref.watch(dBProvider.future);
    var settings = await ref.watch(settingsProvider.future);
    var k = await buildDataFromdb(db, settings.selSemId!);

    return FullAttendanceModel(fullAttendance: k);
  }

  Future<Map<String, List<Map<String, String>>>> buildDataFromdb(
    Database db,
    semid,
  ) async {
    var np = await AttendanceService.getUniqueFullattendance(db, semid);
    Map<String, List<Map<String, String>>> k = {};
    for (var i in np) {
      var courseid = i[DBfullattendance.courseIdRow];
      var coursetype = i[DBfullattendance.courseTypeRow];
      var temp = await getFullAttendancefromstorage(
        db,
        semid,
        courseid,
        coursetype,
      );
      k["$courseid.$coursetype"] = temp;
    }
    return k;
  }

  Future<List<Map<String, String>>> getFullAttendancefromstorage(
    Database db,
    String semid,
    String classid,
    String courseType,
  ) async {
    var attendance = await AttendanceService.getFullAttendance(
      db,
      semid,
      classid,
      courseType,
    );
    return attendance;
  }

  Future updateFullAttendance(String classid, String courseType) async {
    var db = await ref.read(dBProvider.future);
    var settings = await ref.read(settingsProvider.future);
    if (settings.selSemId != null) {
      var c = await ref
          .read(clientProvider.notifier)
          .fullAttendance(settings.selSemId!, classid.trim(), courseType);
      if (c.$1) {
        await AttendanceService.saveFullAttendace(
          db,
          settings.selSemId!,
          classid,
          courseType,
          c.$3,
        );
      }
      var at = await getFullAttendancefromstorage(
        db,
        settings.selSemId!,
        classid,
        courseType,
      );
      if (at.isEmpty) return;
      var data = await future;
      var save = Map<String, List<Map<String, String>>>.from(
        data.fullAttendance,
      );
      save["$classid.$courseType"] = at;
      state = AsyncData(data.copyWith(fullAttendance: save));
    }
  }
}
