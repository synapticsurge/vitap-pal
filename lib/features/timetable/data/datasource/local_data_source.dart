import 'package:vitapmate/core/shared/database/appdatabase.dart';
import 'package:vitapmate/core/utils/global_async_queue.dart';
import 'package:vitapmate/features/timetable/data/models/timetable_model.dart';
import 'package:vitapmate/features/timetable/domain/entities/timetable_entity.dart';

class LocalDataSource {
  final AppDatabase _db;
  final GlobalAsyncQueue _globalAsyncQueue;
  LocalDataSource(this._db, this._globalAsyncQueue);

  Future<TimetableEntity> getTimetable(String semid) async {
    final allRows = await _globalAsyncQueue.run(
      "fromStrorage_timetable_$semid",
      () =>
          (_db.select(_db.timetable)
            ..where((tbl) => tbl.semId.equals(semid))).get(),
    );
    return TimetableModel.toEntityFromLocal(allRows);
  }

  Future<void> saveTimetable(TimetableEntity timetable, String semid) async {
    // await (_db.delete(_db.timetable)
    //   ..where((tbl) => tbl.semId.equals(semid))).go();
    await _globalAsyncQueue.run(
      "toStroage_timetable_$semid",
      () => (_db.batch((batch) {
        batch.deleteWhere(_db.timetable, (tbl) => tbl.semId.equals(semid));
        batch.insertAll(_db.timetable, [
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
      })),
    );
  }
}
