import 'package:sqflite/sqflite.dart';
import 'package:vitapmate/constants.dart';

class AttendanceService {
  static Future<List> getAttendance(Database db, String semid) async {
    var att = await db.query(
      DBattendance.table,
      columns: [
        DBattendance.serialRow,
        DBattendance.categoryRow,
        DBattendance.courseNameRow,
        DBattendance.courseCodeRow,
        DBattendance.courseTypeRow,
        DBattendance.facultyDetailRow,
        DBattendance.classesAttendedRow,
        DBattendance.totalClassesRow,
        DBattendance.attendancePercentageRow,
        DBattendance.attendenceFatCatRow,
        DBattendance.debarStatusRow,
        DBattendance.courseIdRow,
        DBattendance.semIdRow,
        DBattendance.timeRow,
      ],
      where: '${DBattendance.semIdRow} = ?',
      whereArgs: [semid],
    );
    return att.map((row) {
      return row.map((key, value) => MapEntry(key, value.toString()));
    }).toList();
  }

  static Future<List> getFullAttendance(
    Database db,
    String semid,
    String classid,
  ) async {
    var att = await db.query(
      DBfullattendance.table,
      columns: [
        DBfullattendance.serialRow,
        DBfullattendance.dateRow,
        DBfullattendance.slotRowRow,
        DBfullattendance.dayTimeRow,
        DBfullattendance.statusRow,
        DBfullattendance.remarkRow,
        DBfullattendance.semIdRow,
        DBfullattendance.timeRow,
        DBfullattendance.classIdRow,
      ],
      where:
          '${DBfullattendance.semIdRow} = ?  AND ${DBfullattendance.classIdRow} = ?',
      whereArgs: [semid, classid],
      orderBy: '${DBfullattendance.serialRow} ASC',
    );
    return att.map((row) {
      return row.map((key, value) => MapEntry(key, value.toString()));
    }).toList();
  }
}
