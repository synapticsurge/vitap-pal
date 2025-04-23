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
        await db.execute("""
 CREATE TABLE ${DBNames.semidTable}(semId TEXT PRIMARY KEY , semName TEXT); 
 CREATE TABLE ${DBNames.timetableTable}(serial INTEGER,day TEXT,slot TEXT,courseCode TEXT , courseType TEXT , roomNo TEXT , block TEXT , startTime TEXT , endTime TEXT,semId TEXT FOREGIGN KEY );
""");
      },
    );
    return database;
  }
}
