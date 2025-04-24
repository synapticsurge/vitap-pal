import 'package:sqflite/sqflite.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/src/rust/api/vtop/types.dart';

class TimetableService {
  static getTimetableSemIDs(Database db) async {
    var sem = await db.query(
      DBsemtable.semIDTable,
      columns: [DBsemtable.semIDrow, DBsemtable.semNamerow],
    );
    sem =
        sem.map((row) {
          return row.map((key, value) => MapEntry(key, value.toString()));
        }).toList();
    return sem;
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

  static getTimetable(Database db, String semid) async {
    var timetable = await db.query(
      DBtimetable.timetabelTable,
      columns: [
        DBtimetable.serialrow,
        DBtimetable.dayrow,
        DBtimetable.slotrow,
        DBtimetable.courseCoderow,
        DBtimetable.courseTyperow,
        DBtimetable.roomNorow,
        DBtimetable.blockrow,
        DBtimetable.startTimerow,
        DBtimetable.endTimerow,
        DBtimetable.semIdrow,
      ],
      where: '${DBtimetable.semIdrow} = ?',
      whereArgs: [semid],
    );
  

    return timetable;
  }

  static saveTimetable(
    Database db,
    List<RTimetable> timetable,
    String semID,
  ) async {
    final batch = db.batch();
    for (var id in timetable) {
      batch.insert(DBtimetable.timetabelTable, {
        DBtimetable.serialrow: id.serial,
        DBtimetable.dayrow: id.day,
        DBtimetable.slotrow: id.slot,
        DBtimetable.courseCoderow: id.courseCode,
        DBtimetable.courseTyperow: id.courseType,
        DBtimetable.roomNorow: id.roomNo,
        DBtimetable.blockrow: id.block,
        DBtimetable.startTimerow: id.startTime,
        DBtimetable.endTimerow: id.endTime,
        DBtimetable.semIdrow: semID,
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
