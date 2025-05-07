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

@DriftDatabase(tables: [SemTable, Timetable])
class AppDatabase extends _$AppDatabase {
  AppDatabase({QueryExecutor? executor, required String? username})
    : super(executor ?? _openConnection(username));

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection(String? name) {
    return driftDatabase(
      name: name ?? "NO USERNAME",
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}
