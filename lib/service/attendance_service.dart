import 'package:sqflite/sqflite.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/src/rust/api/vtop/types.dart';

class AttendanceService {
  static getAttendance(Database db, String semid) async {
    var att = await db.query(
      DBattendance.table,
      columns: [
        DBattendance.serialRow,
        DBattendance.categoryRow,
        DBattendance.courseNameRow,
        DBattendance.classidRow,
        DBattendance.courseTypeRow,
        DBattendance.facultyDetailRow,
        DBattendance.classesAttendedRow,
        DBattendance.totalClassesRow,
        DBattendance.attendancePercentageRow,
        DBattendance.attendenceFatCatRow,
        DBattendance.debarStatusRow,
        DBattendance.classidRow,
        DBattendance.slotRow,
        DBattendance.semIdRow,
        DBattendance.timeRow,
      ],
      where: '${DBattendance.semIdRow} = ?',
      whereArgs: [semid],
      orderBy: '${DBtimetable.serialrow} ASC',
    );
    List<Map<String, String>> attens =
        att.map((row) {
          return row.map((key, value) => MapEntry(key, value.toString()));
        }).toList();
    return attens;
  }

  static getFullAttendance(Database db, String semid, String classid) async {
    var att = await db.query(
      DBfullattendance.table,
      columns: [
        DBfullattendance.serialRow,
        DBfullattendance.dateRow,
        DBfullattendance.slotRow,
        DBfullattendance.dayTimeRow,
        DBfullattendance.statusRow,
        DBfullattendance.remarkRow,
        DBfullattendance.semIdRow,
        DBfullattendance.timeRow,
        DBfullattendance.classidRow,
      ],
      where:
          '${DBfullattendance.semIdRow} = ?  AND ${DBfullattendance.classidRow} = ?',
      whereArgs: [semid, classid],
      orderBy: '${DBfullattendance.serialRow} ASC',
    );
    List<Map<String, String>> attens =
        att.map((row) {
          return row.map((key, value) => MapEntry(key, value.toString()));
        }).toList();
    return attens;
  }

  static Future<void> saveAttendace(
    Database db,
    String semid,
    List<RAtCourse> atten,
  ) async {
    var batch = db.batch();
    int unixTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    for (var id in atten) {
      batch.insert(DBattendance.table, {
        DBattendance.serialRow: id.serial,
        DBattendance.categoryRow: id.category,
        DBattendance.courseNameRow: id.courseName,
        DBattendance.courseTypeRow: id.courseType,
        DBattendance.facultyDetailRow: id.facultyDetail,
        DBattendance.classesAttendedRow: id.classesAttended,
        DBattendance.totalClassesRow: id.totalClasses,
        DBattendance.attendancePercentageRow: id.attendancePercentage,
        DBattendance.attendenceFatCatRow: id.attendenceFatCat,
        DBattendance.debarStatusRow: id.debarStatus,
        DBattendance.classidRow: id.courseCode.split("-")[0],
        DBattendance.slotRow: id.courseCode,
        DBattendance.semIdRow: semid,
        DBattendance.timeRow: unixTime,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await db.delete(
      DBattendance.table,
      where: '${DBattendance.semIdRow} = ?',
      whereArgs: [semid],
    );
    await batch.commit(noResult: true);
  }

  static Future<void> saveFullAttendace(
    Database db,
    String semid,
    String classid,
    List<RAttendanceList> atten,
  ) async {
    var batch = db.batch();
    int unixTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    for (var id in atten) {
      batch.insert(DBfullattendance.table, {
        DBfullattendance.serialRow: id.serial,
        DBfullattendance.dateRow: id.date,
        DBfullattendance.slotRow: id.slot,
        DBfullattendance.dayTimeRow: id.dayTime,
        DBfullattendance.statusRow: id.status,
        DBfullattendance.remarkRow: id.remark,
        DBfullattendance.classidRow: classid,
        DBfullattendance.semIdRow: semid,
        DBfullattendance.timeRow: unixTime,
      });
    }
    await db.delete(
      DBattendance.table,
      where:
          '${DBfullattendance.semIdRow} = ? AND ${DBfullattendance.classidRow} = ?',
      whereArgs: [semid, classid],
    );
    await batch.commit(noResult: true);
  }
}
