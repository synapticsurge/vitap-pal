import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/models/user_model.dart';
import 'package:vitapmate/providers/user.dart';
part 'db.g.dart';

@Riverpod(keepAlive: true)
class DB extends _$DB {
  @override
  Future<Database> build() async {
    var databasesPath = await getDatabasesPath();
    UserModel user = await ref.watch(userProvider.future);
    String path = join(databasesPath, '${user.username ?? "NO_USERNAME"}.db');
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE ${DBsemtable.semIDTable}(${DBsemtable.semIDrow} TEXT PRIMARY KEY , ${DBsemtable.semNamerow} TEXT)",
        );
        await db.execute(
          " CREATE TABLE ${DBtimetable.timetabelTable}(${DBtimetable.serialrow} INTEGER,${DBtimetable.dayrow}  TEXT,${DBtimetable.slotrow}  TEXT,${DBtimetable.courseCoderow}  TEXT , ${DBtimetable.courseTyperow}  TEXT , ${DBtimetable.roomNorow}  TEXT , ${DBtimetable.blockrow}  TEXT , ${DBtimetable.startTimerow}  TEXT , ${DBtimetable.endTimerow}  TEXT, ${DBtimetable.semIdrow}  TEXT , FOREIGN KEY (${DBtimetable.semIdrow}) REFERENCES ${DBsemtable.semIDTable}(${DBsemtable.semIDrow}), UNIQUE (${DBtimetable.semIdrow} , ${DBtimetable.startTimerow} , ${DBtimetable.dayrow} ) )",
        );
      },
    );
    return database;
  }
}
