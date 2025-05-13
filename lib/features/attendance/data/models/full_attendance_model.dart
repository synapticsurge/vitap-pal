import 'package:vitapmate/core/rust_gen/api/vtop/types.dart';
import 'package:vitapmate/core/shared/database/appdatabase.dart';
import 'package:vitapmate/features/attendance/domain/entities/full_attendance_entity.dart';
import 'package:vitapmate/features/attendance/domain/entities/sub_full_attendance_entity.dart';

class FullAttendanceModel {
  static FullAttendanceEntity toEntityFromRemote(
    List<RAttendanceList> rattendancelist,
    String courseType,
    String courseId,
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
    return FullAttendanceEntity(
      attendance: sub,
      courseId: courseId,
      courseType: courseType,
    );
  }

  static FullAttendanceEntity toEntityFromLocal(
    List<FullAttendanceTableData> atten,
    String courseType,
    String courseId,
  ) {
    List<SubFullAttendanceEntity> sub = [];
    for (var i in atten) {
      var temp = SubFullAttendanceEntity(
        serial: "${i.serial}",
        date: i.date,
        slot: i.slot,
        dayTime: i.dayTime,
        status: i.status,
        remark: i.remark,
        semid: i.semId,
        updateTime: i.time,
      );
      sub.add(temp);
    }

    return FullAttendanceEntity(
      attendance: sub,
      courseId: courseId,
      courseType: courseType,
    );
  }
}
