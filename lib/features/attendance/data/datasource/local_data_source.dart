import 'package:drift/drift.dart';
import 'package:vitapmate/core/shared/database/appdatabase.dart';
import 'package:vitapmate/core/utils/global_async_queue.dart';
import 'package:vitapmate/features/attendance/data/models/attendance_model.dart';
import 'package:vitapmate/features/attendance/data/models/full_attendance_model.dart';
import 'package:vitapmate/features/attendance/domain/entities/attendance_entity.dart';
import 'package:vitapmate/features/attendance/domain/entities/full_attendance_entity.dart';

class LocalDataSource {
  final AppDatabase _db;
  final GlobalAsyncQueue _globalAsyncQueue;
  LocalDataSource(this._db, this._globalAsyncQueue);

  Future<FullAttendanceEntity> getFullAttendance(
    String semid,
    String courseType,
    String courseId,
  ) async {
    final allrows = await _globalAsyncQueue.run(
      "fromStrorage_fullattendance_$semid",
      () =>
          (_db.select(_db.fullAttendanceTable)..where(
            (tbl) =>
                tbl.semId.equals(semid) &
                tbl.courseId.equals(courseId) &
                tbl.courseType.equals(courseType),
          )).get(),
    );
    return FullAttendanceModel.toEntityFromLocal(allrows, courseType, courseId);
  }

  Future<void> saveFullAttendance(
    FullAttendanceEntity attendance,
    String semid,
    String courseType,
    String courseId,
  ) async {
    await _globalAsyncQueue.run(
      "toStorage_fullattendance_$semid",
      () => (_db.batch((batch) {
        batch.deleteWhere(
          _db.fullAttendanceTable,
          (tbl) =>
              tbl.semId.equals(semid) &
              tbl.courseId.equals(courseId) &
              tbl.courseType.equals(courseType),
        );
        batch.insertAll(_db.fullAttendanceTable, [
          for (var i in attendance.attendance)
            FullAttendanceTableCompanion.insert(
              serial: int.parse(i.serial),
              date: i.date,
              dayTime: i.dayTime,
              remark: i.remark,
              semId: semid,
              slot: i.slot,
              status: i.status,
              time: i.updateTime,
              courseId: courseId,
              courseType: courseType,
            ),
        ]);
      })),
    );
  }

  Future<void> saveAttendance(AttendanceEntity attendance, String semid) async {
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
              category: i.category,
              courseName: i.courseName,
              courseCode: i.courseCode,
              courseType: i.courseType,
              facultyDetail: i.facultyDetail,
              classesAttended: i.classesAttended,
              totalClasses: i.totalClasses,
              attendancePercentage: i.attendancePercentage,
              attendenceFatCat: i.attendenceFatCat,
              debarStatus: i.debarStatus,
              courseId: i.courseId,
              semId: i.semid,
              time: i.updateTime,
            ),
        ]);
      })),
    );
  }

  Future<AttendanceEntity> getAttendance(String semid) async {
    final allrow = await _globalAsyncQueue.run(
      "fromStorage_attendance_$semid",
      () =>
          (_db.select(_db.attendanceTable)
            ..where((tbl) => tbl.semId.equals(semid))).get(),
    );
    return AttendanceModel.toEntityFromLocal(allrow);
  }
}
