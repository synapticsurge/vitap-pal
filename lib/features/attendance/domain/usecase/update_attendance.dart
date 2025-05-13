import 'package:vitapmate/core/utils/usecase.dart';
import 'package:vitapmate/features/attendance/domain/entities/attendance_entity.dart';
import 'package:vitapmate/features/attendance/domain/repository/attendance_repository.dart';

class UpdateAttendanceUsecase implements Usecase<AttendanceEntity, void> {
  final AttendanceRepository _attendanceRepository;
  UpdateAttendanceUsecase(this._attendanceRepository);
  @override
  Future<AttendanceEntity> call({void params}) async {
    await _attendanceRepository.updateAttendance();
    var data = await _attendanceRepository.getAttendanceFromStorage();
    return data;
  }
}
