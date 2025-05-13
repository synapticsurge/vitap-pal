import 'package:vitapmate/core/shared/database/appdatabase.dart';
import 'package:vitapmate/core/utils/global_async_queue.dart';
import 'package:vitapmate/features/attendance/data/models/attendance_model.dart';
import 'package:vitapmate/features/attendance/domain/entities/full_attendance_entity.dart';

class LocalDataSource {
  final AppDatabase _db;
  final GlobalAsyncQueue _globalAsyncQueue;
  LocalDataSource(this._db, this._globalAsyncQueue);

  Future<FullAttendanceEntity> getAttendance(String semid) async {
    final allrows = await _globalAsyncQueue.run(
      "fromStrorage_attendance_$semid",
      () =>
          (_db.select(_db.attendanceTable)
            ..where((tbl) => tbl.semId.equals(semid))).get(),
    );
    return AttendanceModel.toEntityFromLocal(allrows);
  }

  Future<void> saveAttendance(FullAttendanceEntity attendance, String semid) async {
    await _globalAsyncQueue.run(
      "toStorage_attendance_$semid",
      () => (_db.batch((batch) {
        batch.deleteWhere(
          _db.attendanceTable,
          (tbl) => tbl.semId.equals(semid),
        );
        batch.insertAll(_db.attendanceTable, [
          for (var i in attendance.attendance)
            AttendanceTableCompanion.insert(
              serial: int.parse(i.serial),
              date: i.date,
              dayTime: i.dayTime,
              remark: i.remark,
              semId: semid,
              slot: i.slot,
              status: i.status,
              time: i.updateTime,
            ),
        ]);
      })),
    );
  }
}
