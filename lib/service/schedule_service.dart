import 'package:sqflite/sqflite.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/src/rust/api/vtop/types.dart';

class ScheduleService {
  static saveSchedule(
    Database db,
    String semid,
    List<RscheduleExam> exams,
  ) async {
    int unixTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    var batch = db.batch();
    for (var e in exams) {
      for (var id in e.course) {
        batch.insert(DBschedule.table, {
          DBschedule.courseCodeRow: id.courseCode,
          DBschedule.serialRow: id.serial,
          DBschedule.slotRow: id.slot,
          DBschedule.courseNameRow: id.courseName,
          DBschedule.courseTypeRow: id.courseType,
          DBschedule.courseIdRow: id.courseId,
          DBschedule.examDateRow: id.examDate,
          DBschedule.examSessionRow: id.examSession,
          DBschedule.reportingTimeRow: id.reportingTime,
          DBschedule.examTimeRow: id.examTime,
          DBschedule.venueRow: id.venue,
          DBschedule.seatLocationRow: id.seatLocation,
          DBschedule.seatNoRow: id.seatNo,
          DBschedule.examtypeRow: e.examType,
          DBschedule.semIdRow: semid,
          DBschedule.timeRow: unixTime,
        }, conflictAlgorithm: ConflictAlgorithm.replace);
      }
    }
    await db.delete(
      DBschedule.table,
      where: '${DBschedule.semIdRow} = ?',
      whereArgs: [semid],
    );
    await batch.commit(noResult: true);
  }

  static getSchedule(Database db, String semid) async {
    var schedule = await db.query(
      DBschedule.table,
      columns: [
        DBschedule.courseCodeRow,
        DBschedule.serialRow,
        DBschedule.slotRow,
        DBschedule.courseNameRow,
        DBschedule.courseTypeRow,
        DBschedule.courseIdRow,
        DBschedule.examDateRow,
        DBschedule.examSessionRow,
        DBschedule.reportingTimeRow,
        DBschedule.examTimeRow,
        DBschedule.venueRow,
        DBschedule.seatLocationRow,
        DBschedule.seatNoRow,
        DBschedule.examtypeRow,
        DBschedule.semIdRow,
        DBschedule.timeRow,
      ],
      where: '${DBschedule.semIdRow} = ?',
      whereArgs: [semid],
      orderBy: '${DBschedule.serialRow} ASC',
    );
    List<Map<String, String>> schedules =
        schedule.map((row) {
          return row.map((key, value) => MapEntry(key, value.toString()));
        }).toList();
    return schedules;
  }
}
