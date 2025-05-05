import 'package:vitapmate/core/database/appdatabase.dart';
import 'package:vitapmate/features/timetable/data/models/timetable_model.dart';
import 'package:vitapmate/features/timetable/domain/entities/timetable_entity.dart';

class LocalDataSource {
  final AppDatabase db;
  LocalDataSource({required this.db});

  Future<TimetableEntity> getTimetable(String semid) async {
    final allRows =
        await (db.select(db.timetable)
          ..where((tbl) => tbl.semId.equals(semid))).get();
    return TimetableModel.toEntityFromLocal(allRows);
  }

  Future<void> saveTimetable(TimetableEntity timetable, String semid) async {
    await (db.delete(db.timetable)
      ..where((tbl) => tbl.semId.equals(semid))).go();
    await (db.batch((batch) {
      batch.insertAll(db.timetable, [
        for (var i in timetable.timetable)
          TimetableCompanion.insert(
            serial: int.parse(i.serial),
            day: i.day,
            slot: i.slot,
            courseCode: i.courseCode,
            courseType: i.courseType,
            courseName: i.name,
            roomNo: i.roomNo,
            block: i.block,
            startTime: i.startTime,
            endTime: i.endTime,
            semId: i.semid,
            time: i.updateTime,
          ),
      ]);
    }));
  }
}
