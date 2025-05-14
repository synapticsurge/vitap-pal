import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/features/attendance/domain/entities/full_attendance_entity.dart';
import 'package:vitapmate/features/attendance/domain/usecase/get_full_attendance.dart';
import 'package:vitapmate/features/attendance/domain/usecase/update_full_attendance.dart';
import 'package:vitapmate/features/attendance/presentation/providers/state/attendance_repository.dart';
part 'full_attendance.g.dart';

@riverpod
class FullAttendance extends _$FullAttendance {
  late String _courseType;
  late String _courseId;
  @override
  Future<FullAttendanceEntity> build(String courseType, String courseId) async {
    _courseType = courseType;
    _courseId = courseId;
    var attendanceRepository = await ref.watch(
      attendanceRepositoryProvider.future,
    );
    FullAttendanceEntity attendance =
        await GetFullAttendanceUsecase(
          attendanceRepository,
          _courseType,
          _courseId,
        ).call();
    if (attendance.attendance.isEmpty) {
      attendance =
          await UpdateFullAttendanceUsecase(
            attendanceRepository,
            _courseType,
            _courseId,
          ).call();
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
    var data =
        await UpdateFullAttendanceUsecase(repo, _courseType, _courseId).call();
    state = AsyncData(data);
  }
}
