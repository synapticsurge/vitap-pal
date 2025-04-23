import 'package:sqflite/sqflite.dart';
import 'package:vitapmate/constants.dart';

class TimetableService {
  static getTimetableSemIDs(Database db) async {
    var sem = await db.query(
      DBsemtable.semIDTable,
      columns: ['semId', 'semName'],
    );
    print(sem);
    return sem;
  }

  static saveTimetableSemIDs(
    Database db,
    List<Map<String, String>> semId,
  ) async {
    for (var id in semId) {
      await db.insert(DBsemtable.semIDTable, {
        'semID': id[DBsemtable.semIDrow],
        'semName': id[DBsemtable.semNamerow],
      }, conflictAlgorithm: ConflictAlgorithm.ignore);
    }
  }
}
