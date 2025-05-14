import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/features/attendance/domain/entities/attendance_entity.dart';
import 'package:vitapmate/features/attendance/domain/usecase/get_attendance.dart';
import 'package:vitapmate/features/attendance/domain/usecase/update_attendance.dart';
import 'package:vitapmate/features/attendance/presentation/providers/state/attendance_repository.dart';
part 'attendance.g.dart';

@riverpod
class Attendance extends _$Attendance {
  @override
  Future<AttendanceEntity> build() async {
    var attendanceRepository = await ref.watch(
      attendanceRepositoryProvider.future,
    );
    AttendanceEntity attendance =
        await GetAttendanceUsecase(attendanceRepository).call();
    if (attendance.attendance.isEmpty) {
      attendance = await UpdateAttendanceUsecase(attendanceRepository).call();
    } else {
      Future.microtask(() async {
        try {
          await updateAttendance();
        } catch (e) {
          log("$e", level: 900);
        }
      });
    }

    return attendance;
  }

  Future<void> updateAttendance() async {
    var repo = await ref.read(attendanceRepositoryProvider.future);
    var data = await UpdateAttendanceUsecase(repo).call();
    state = AsyncData(data);
  }

}
