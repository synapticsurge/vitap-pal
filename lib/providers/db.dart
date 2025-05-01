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
          """CREATE TABLE ${DBsemtable.semIDTable}(${DBsemtable.semIDrow} TEXT PRIMARY KEY , ${DBsemtable.semNamerow} TEXT)""",
        );
        await db.execute(
          """ CREATE TABLE ${DBtimetable.timetabelTable}(${DBtimetable.serialrow} INTEGER,${DBtimetable.dayrow}  TEXT,${DBtimetable.slotrow}  TEXT,${DBtimetable.courseCoderow}  TEXT , ${DBtimetable.courseTyperow}  TEXT , ${DBtimetable.courseName}  TEXT , ${DBtimetable.roomNorow}  TEXT , ${DBtimetable.blockrow}  TEXT , ${DBtimetable.startTimerow}  TEXT , ${DBtimetable.endTimerow}  TEXT, ${DBtimetable.semIdrow}  TEXT , ${DBtimetable.timeRow} INT,FOREIGN KEY (${DBtimetable.semIdrow}) REFERENCES ${DBsemtable.semIDTable}(${DBsemtable.semIDrow}), UNIQUE (${DBtimetable.semIdrow} , ${DBtimetable.startTimerow} , ${DBtimetable.dayrow} ) )""",
        );
        await db.execute(
          """ CREATE TABLE ${DBattendance.table}(${DBattendance.serialRow} INTEGER,${DBattendance.categoryRow}  TEXT,${DBattendance.courseNameRow}  TEXT,${DBattendance.courseTypeRow}  TEXT , ${DBattendance.facultyDetailRow}  TEXT , ${DBattendance.classesAttendedRow}  TEXT , ${DBattendance.totalClassesRow}  TEXT , ${DBattendance.attendancePercentageRow}  TEXT , ${DBattendance.attendenceFatCatRow}  TEXT , ${DBattendance.debarStatusRow}  TEXT, ${DBattendance.classidRow}  TEXT,${DBattendance.slotRow} TEXT ,${DBattendance.semIdRow} TEXT , ${DBattendance.timeRow} INT,FOREIGN KEY (${DBattendance.semIdRow}) REFERENCES ${DBsemtable.semIDTable}(${DBsemtable.semIDrow}), UNIQUE (${DBattendance.semIdRow} , ${DBattendance.classidRow}) )""",
        );
        await db.execute(
          """ CREATE TABLE ${DBfullattendance.table}(${DBfullattendance.serialRow} INTEGER  , ${DBfullattendance.dateRow} TEXT,${DBfullattendance.slotRow} TEXT  , ${DBfullattendance.dayTimeRow} TEXT,${DBfullattendance.statusRow} TEXT  ,${DBfullattendance.remarkRow} TEXT  , ${DBfullattendance.semIdRow} TEXT,${DBfullattendance.timeRow} INT  , ${DBfullattendance.classidRow} TEXT,FOREIGN KEY (${DBfullattendance.semIdRow}) REFERENCES ${DBsemtable.semIDTable}(${DBsemtable.semIDrow}), UNIQUE (${DBfullattendance.semIdRow} ,${DBfullattendance.dateRow},${DBfullattendance.timeRow}, ${DBfullattendance.classidRow}))""",
        );
        await db.execute(
          """CREATE TABLE ${DBmarks.table} (${DBmarks.serialRow} INTEGER ,${DBmarks.coursecodeRow} TEXT,${DBmarks.coursetitleRow} TEXT,${DBmarks.coursetypeRow} TEXT,${DBmarks.faculityRow} TEXT,${DBmarks.slotRow} TEXT,${DBmarks.marksRow} TEXT,${DBmarks.semIdRow} TEXT,${DBmarks.timeRow} INTEGER,FOREIGN KEY (${DBmarks.semIdRow}) REFERENCES ${DBsemtable.semIDTable}(${DBsemtable.semIDrow}),UNIQUE (${DBmarks.semIdRow},${DBmarks.marksRow},${DBmarks.coursecodeRow}))""",
        );
        await db.execute(
          """CREATE TABLE ${DBschedule.table} (${DBschedule.serialRow} INTEGER ,${DBschedule.slotRow} TEXT,${DBschedule.courseNameRow} TEXT,${DBschedule.courseCodeRow} TEXT,${DBschedule.courseTypeRow} TEXT,${DBschedule.courseIdRow} TEXT,${DBschedule.examDateRow} TEXT,${DBschedule.examSessionRow} TEXT,${DBschedule.reportingTimeRow} TEXT,${DBschedule.examTimeRow} TEXT,${DBschedule.venueRow} TEXT,${DBschedule.seatLocationRow} TEXT,${DBschedule.seatNoRow} TEXT,${DBschedule.examtypeRow} TEXT,${DBschedule.semIdRow} TEXT,${DBschedule.timeRow} INTEGER,FOREIGN KEY (${DBschedule.semIdRow}) REFERENCES ${DBsemtable.semIDTable}(${DBsemtable.semIDrow}),UNIQUE (${DBschedule.semIdRow},${DBschedule.courseIdRow},${DBschedule.examtypeRow},${DBschedule.examDateRow}))""",
        );
      },
    );
    print("build db");
    return database;
  }
}
