import 'package:sqflite/sqflite.dart';
import 'package:vitapmate/core/constants/constants.dart';
import 'package:vitapmate/src/rust/api/vtop/types.dart';

class MarksService {
  static saveMarks(Database db, String semid, List<RMarksCourse> marks) async {
    int unixTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final batch = db.batch();
    for (var id in marks) {
      for (var m in id.marks) {
        batch.insert(DBmarks.table, {
          DBmarks.serialRow: id.serial,
          DBmarks.coursecodeRow: id.coursecode,
          DBmarks.coursetitleRow: id.coursetitle,
          DBmarks.coursetypeRow: id.coursetype,
          DBmarks.faculityRow: id.faculity,
          DBmarks.slotRow: id.slot,
          DBmarks.marksRow: m,
          DBmarks.semIdRow: semid,
          DBmarks.timeRow: unixTime,
        }, conflictAlgorithm: ConflictAlgorithm.replace);
      }
    }
    await db.delete(
      DBmarks.table,
      where: '${DBmarks.semIdRow} = ?',
      whereArgs: [semid],
    );
    await batch.commit(noResult: true);
  }

  static getMarks(Database db, String semid) async {
    var mark = await db.query(
      DBmarks.table,
      columns: [
        DBmarks.serialRow,
        DBmarks.coursecodeRow,
        DBmarks.coursetitleRow,
        DBmarks.coursetypeRow,
        DBmarks.faculityRow,
        DBmarks.slotRow,
        DBmarks.marksRow,
        DBmarks.semIdRow,
        DBmarks.timeRow,
      ],
      where: '${DBmarks.semIdRow} = ?',
      whereArgs: [semid],
    );
    List<Map<String, String>> marks =
        mark.map((row) {
          return row.map((key, value) => MapEntry(key, value.toString()));
        }).toList();
    return marks;
  }
}
