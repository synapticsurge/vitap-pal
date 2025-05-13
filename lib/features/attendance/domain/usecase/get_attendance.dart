import 'package:vitapmate/core/utils/usecase.dart';
import 'package:vitapmate/features/attendance/domain/entities/attendance_entity.dart';
import 'package:vitapmate/features/attendance/domain/repository/attendance_repository.dart';

class GetAttendanceUsecase implements Usecase<AttendanceEntity, void> {
  final AttendanceRepository _attendanceRepository;
  GetAttendanceUsecase(this._attendanceRepository);
  @override
  Future<AttendanceEntity> call({void params}) async {
    var timetable = await _attendanceRepository.getAttendanceFromStorage();
    return timetable;
  }
}
