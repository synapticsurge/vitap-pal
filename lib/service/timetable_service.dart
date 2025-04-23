import 'package:sqflite/sqflite.dart';
import 'package:vitapmate/constants.dart';

class TimetableService {
  static getTimetableSemIDs(Database db) async {
    var sem = await db.query(DBNames.semidTable, columns: ['semId', 'semName']);
    print(sem);
    return sem;
  }

  static saveTimetableSemIDs(Database db, Map<String, String> semId) async {
    //db.delete(DBNames.semidTable);
    semId.forEach((key, value) async {
      await db.insert(DBNames.semidTable, {
        'semID': key,
        'semName': value,
      }, conflictAlgorithm: ConflictAlgorithm.ignore);
    });
  }
}
