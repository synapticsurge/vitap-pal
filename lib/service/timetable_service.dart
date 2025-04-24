import 'package:sqflite/sqflite.dart';
import 'package:vitapmate/constants.dart';

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
    List<Map<String, String>> semId,
  ) async {
    for (var id in semId) {
      await db.insert(DBsemtable.semIDTable, {
        DBsemtable.semIDrow: id[DBsemtable.semIDrow],
        DBsemtable.semNamerow: id[DBsemtable.semNamerow],
      }, conflictAlgorithm: ConflictAlgorithm.ignore);
    }
  }
}
