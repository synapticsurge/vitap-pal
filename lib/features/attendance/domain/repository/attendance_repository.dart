import 'package:vitapmate/features/attendance/domain/entities/full_attendance_entity.dart';

abstract class AttendanceRepository {
  Future<void> saveAttendanceToStoarge(FullAttendanceEntity fullattendanceEntity);
  Future<FullAttendanceEntity> getAttendanceFromStorage();
  Future<void> updateFullAttendance();
}
