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
        DBattendance.courseIdRow,
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

  static getFullAttendance(
    Database db,
    String semid,
    String classid,
    String cousreType,
  ) async {
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
        DBfullattendance.courseIdRow,
        DBfullattendance.courseTypeRow,
      ],
      where:
          '${DBfullattendance.semIdRow} = ?  AND ${DBfullattendance.courseIdRow} = ? AND ${DBfullattendance.courseTypeRow} = ?',
      whereArgs: [semid, classid, cousreType],
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
        DBattendance.courseIdRow: id.courseId,
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
    String courseType,
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
        DBfullattendance.courseIdRow: classid,
        DBfullattendance.semIdRow: semid,
        DBfullattendance.timeRow: unixTime,
        DBfullattendance.courseTypeRow: courseType,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await db.delete(
      DBattendance.table,
      where:
          '${DBfullattendance.semIdRow} = ? AND ${DBfullattendance.courseIdRow} = ? AND ${DBfullattendance.courseTypeRow} = ?',
      whereArgs: [semid, classid, courseType],
    );
    await batch.commit(noResult: true);
  }

  static getUniqueFullattendance(Database db, String semid) async {
    var day = await db.query(
      DBfullattendance.table,
      columns: [DBfullattendance.courseIdRow, DBfullattendance.courseTypeRow],
      where: '${DBfullattendance.semIdRow} = ?',
      whereArgs: [semid],
      distinct: true,
    );
    List<Map<String, String>> days =
        day.map((row) {
          return row.map((key, value) => MapEntry(key, value.toString()));
        }).toList();

    return days;
  }
}
