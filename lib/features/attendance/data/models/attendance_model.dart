import 'package:vitapmate/core/rust_gen/api/vtop/types.dart';
import 'package:vitapmate/core/shared/database/appdatabase.dart';
import 'package:vitapmate/features/attendance/domain/entities/full_attendance_entity.dart';
import 'package:vitapmate/features/attendance/domain/entities/sub_full_attendance_entity.dart';

class AttendanceModel {
  static FullAttendanceEntity toEntityFromRemote(
    List<RAttendanceList> rattendancelist,
    String semid,
  ) {
    List<SubFullAttendanceEntity> sub = [];
    int unixTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    for (var i in rattendancelist) {
      var temp = SubFullAttendanceEntity(
        serial: i.serial,
        date: i.date,
        slot: i.slot,
        dayTime: i.dayTime,
        status: i.status,
        remark: i.remark,
        semid: semid,
        updateTime: unixTime,
      );
      sub.add(temp);
    }
    return FullAttendanceEntity(attendance: sub);
  }

  static FullAttendanceEntity toEntityFromLocal(List<AttendanceTableData> atten) {
    List<SubFullAttendanceEntity> sub = [];
    int unixTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    for (var i in atten) {
      var temp = SubFullAttendanceEntity(
        serial: "${i.serial}",
        date: i.date,
        slot: i.slot,
        dayTime: i.dayTime,
        status: i.status,
        remark: i.remark,
        semid: i.semId,
        updateTime: unixTime,
      );
      sub.add(temp);
    }
    return FullAttendanceEntity(attendance: sub);
  }
}
