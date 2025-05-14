import 'package:vitapmate/core/utils/usecase.dart';
import 'package:vitapmate/features/attendance/domain/entities/full_attendance_entity.dart';
import 'package:vitapmate/features/attendance/domain/repository/attendance_repository.dart';

class GetFullAttendanceUsecase implements Usecase<FullAttendanceEntity, void> {
  final AttendanceRepository _attendanceRepository;
  final String _courseType;
  final String _courseId;
  GetFullAttendanceUsecase(this._attendanceRepository,this._courseType,this._courseId);
  @override
  Future<FullAttendanceEntity> call({void params}) async {
    var timetable = await _attendanceRepository.getFullAttendanceFromStorage(_courseType,_courseId);
    return timetable;
  }
}
