import 'package:vitapmate/features/attendance/domain/entities/attendance_entity.dart';
import 'package:vitapmate/features/attendance/domain/entities/full_attendance_entity.dart';

abstract class AttendanceRepository {
  Future<void> saveAttendanceToStoarge(AttendanceEntity attendanceEntity);
  Future<AttendanceEntity> getAttendanceFromStorage();
  Future<void> updateFullAttendance(String courseType, String courseId);
  Future<void> saveFullAttendanceToStoarge(
    FullAttendanceEntity fullattendanceEntity,
    String courseType,
    String courseId,
  );
  Future<FullAttendanceEntity> getFullAttendanceFromStorage(
    String courseType,
    String courseId,
  );
  Future<void> updateAttendance();
}
