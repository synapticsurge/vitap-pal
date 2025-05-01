import 'package:sqflite/sqflite.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/src/rust/api/vtop/types.dart';

class TimetableService {
  static getTimetableSemIDs(Database db) async {
    var sem = await db.query(
      DBsemtable.semIDTable,
      columns: [DBsemtable.semIDrow, DBsemtable.semNamerow],
    );
    List<Map<String, String>> sems =
        sem.map((row) {
          return row.map((key, value) => MapEntry(key, value.toString()));
        }).toList();
    // print(sems);
    return sems;
  }

  static saveTimetableSemIDs(
    Database db,
    List<Map<String, String>> semIds,
  ) async {
    final batch = db.batch();
    for (var id in semIds) {
      batch.insert(DBsemtable.semIDTable, {
        DBsemtable.semIDrow: id[DBsemtable.semIDrow],
        DBsemtable.semNamerow: id[DBsemtable.semNamerow],
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    }

    await batch.commit(noResult: true);
  }

  static getTimetable({required Database db, required String semid}) async {
    var timetable = await db.query(
      DBtimetable.timetabelTable,
      columns: [
        DBtimetable.serialrow,
        DBtimetable.dayrow,
        DBtimetable.slotrow,
        DBtimetable.courseCoderow,
        DBtimetable.courseTyperow,
        DBtimetable.courseName,
        DBtimetable.roomNorow,
        DBtimetable.blockrow,
        DBtimetable.startTimerow,
        DBtimetable.endTimerow,
        DBtimetable.semIdrow,
        DBtimetable.timeRow,
      ],
      where: '${DBtimetable.semIdrow} = ?',
      whereArgs: [semid],
      orderBy: '${DBtimetable.startTimerow} ASC',
    );
    List<Map<String, String>> timetables =
        timetable.map((row) {
          return row.map((key, value) => MapEntry(key, value.toString()));
        }).toList();
    //print(timetables);
    return timetables;
  }

  static getUniquedays(Database db, String semid) async {
    var day = await db.query(
      DBtimetable.timetabelTable,
      columns: [DBtimetable.dayrow],
      where: '${DBtimetable.semIdrow} = ?',
      whereArgs: [semid],
      distinct: true,
    );
    List<Map<String, String>> days =
        day.map((row) {
          return row.map((key, value) => MapEntry(key, value.toString()));
        }).toList();
    //print(days);

    return days;
  }

  static saveTimetable(
    Database db,
    List<RTimetable> timetable,
    String semID,
  ) async {
    int unixTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final batch = db.batch();
    for (var id in timetable) {
      batch.insert(DBtimetable.timetabelTable, {
        DBtimetable.serialrow: id.serial,
        DBtimetable.dayrow: id.day,
        DBtimetable.slotrow: id.slot,
        DBtimetable.courseCoderow: id.courseCode,
        DBtimetable.courseTyperow: id.courseType,
        DBtimetable.courseName: id.name,
        DBtimetable.roomNorow: id.roomNo,
        DBtimetable.blockrow: id.block,
        DBtimetable.startTimerow: id.startTime,
        DBtimetable.endTimerow: id.endTime,
        DBtimetable.semIdrow: semID,
        DBtimetable.timeRow: unixTime,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await db.delete(
      DBtimetable.timetabelTable,
      where: '${DBtimetable.semIdrow} = ?',
      whereArgs: [semID],
    );
    await batch.commit(noResult: true);
  }
}
