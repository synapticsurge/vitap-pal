import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/models/attendance_model.dart';
import 'package:vitapmate/providers/db.dart';
import 'package:vitapmate/providers/settings.dart';
part 'attendance.g.dart';

@riverpod
class Attendance extends _$Attendance {
  @override
  Future<AttendanceModel> build() async {
    var db = await ref.watch(dBProvider.future);
    var settings = await ref.watch(settingsProvider.future);
    return AttendanceModel(attendance: [], fullAttendance: {});
  }
}
