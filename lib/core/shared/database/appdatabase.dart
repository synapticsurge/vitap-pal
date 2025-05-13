import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
part 'appdatabase.g.dart';

class SemTable extends Table {
  TextColumn get semid => text()();
  TextColumn get semName => text()();

  @override
  Set<Column> get primaryKey => {semid};
}

class Timetable extends Table {
  IntColumn get serial => integer()();
  TextColumn get day => text()();
  TextColumn get slot => text()();
  TextColumn get courseCode => text()();
  TextColumn get courseType => text()();
  TextColumn get courseName => text()();
  TextColumn get roomNo => text()();
  TextColumn get block => text()();
  TextColumn get startTime => text()();
  TextColumn get endTime => text()();
  TextColumn get semId => text().references(SemTable, #semid)();
  IntColumn get time => integer()();

  @override
  List<Set<Column>>? get uniqueKeys => [
    {semId, startTime, day},
  ];
}

class FullAttendanceTable extends Table {
  IntColumn get serial => integer()();
  TextColumn get date => text()();
  TextColumn get slot => text()();
  TextColumn get dayTime => text()();
  TextColumn get status => text()();
  TextColumn get remark => text()();
  TextColumn get courseType => text()();
  TextColumn get courseId => text()();
  TextColumn get semId => text().references(SemTable, #semid)();
  IntColumn get time => integer()();
}

class AttendanceTable extends Table {
  IntColumn get serial => integer()();
  TextColumn get category => text()();
  TextColumn get courseName => text()();
  TextColumn get courseCode => text()();
  TextColumn get courseType => text()();
  TextColumn get facultyDetail => text()();
  TextColumn get classesAttended => text()();
  TextColumn get totalClasses => text()();
  TextColumn get attendancePercentage => text()();
  TextColumn get attendenceFatCat => text()();
  TextColumn get debarStatus => text()();
  TextColumn get courseId => text()();
  TextColumn get semId => text().references(SemTable, #semid)();
  IntColumn get time => integer()();
}

@DriftDatabase(
  tables: [SemTable, Timetable, FullAttendanceTable, AttendanceTable],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase({QueryExecutor? executor, required String? username})
    : super(executor ?? _openConnection(username));

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection(String? name) {
    return driftDatabase(
      name: name ?? "NO USERNAME",
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
