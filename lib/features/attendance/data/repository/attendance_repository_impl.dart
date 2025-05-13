import 'package:vitapmate/features/attendance/data/datasource/local_data_source.dart';
import 'package:vitapmate/features/attendance/data/datasource/remote_data_source.dart';
import 'package:vitapmate/features/attendance/domain/entities/attendance_entity.dart';
import 'package:vitapmate/features/attendance/domain/entities/full_attendance_entity.dart';
import 'package:vitapmate/features/attendance/domain/repository/attendance_repository.dart';

class AttendanceRepositoryImpl extends AttendanceRepository {
  LocalDataSource localDataSource;
  RemoteDataSource remoteDataSource;
  String semid;
  AttendanceRepositoryImpl({
    required this.semid,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<AttendanceEntity> getAttendanceFromStorage() async {
    var attendance = await localDataSource.getAttendance(semid);
    return attendance;
  }

  @override
  Future<FullAttendanceEntity> getFullAttendanceFromStorage(
    String courseType,
    String courseId,
  ) async {
    var attendance = await localDataSource.getFullAttendance(
      semid,
      courseType,
      courseId,
    );
    return attendance;
  }

  @override
  Future<void> saveAttendanceToStoarge(
    AttendanceEntity attendanceEntity,
  ) async {
    await localDataSource.saveAttendance(attendanceEntity, semid);
  }

  @override
  Future<void> saveFullAttendanceToStoarge(
    FullAttendanceEntity fullattendanceEntity,
    String courseType,
    String courseId,
  ) async {
    await localDataSource.saveFullAttendance(
      fullattendanceEntity,
      semid,
      courseType,
      courseId,
    );
  }

  @override
  Future<void> updateAttendance() async {
    var attendance = await remoteDataSource.fetchAttendance(semid);
    saveAttendanceToStoarge(attendance);
  }

  @override
  Future<void> updateFullAttendance(String courseType, String courseId) async {
    var attendance = await remoteDataSource.fetchFullAttendance(
      semid,
      courseType,
      courseId,
    );
    saveFullAttendanceToStoarge(attendance, courseType, courseId);
  }
}
