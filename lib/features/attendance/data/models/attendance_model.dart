import 'package:vitapmate/core/rust_gen/api/vtop/types.dart';
import 'package:vitapmate/core/shared/database/appdatabase.dart';
import 'package:vitapmate/features/attendance/domain/entities/attendance_entity.dart';
import 'package:vitapmate/features/attendance/domain/entities/sub_attendance_entity.dart';

class AttendanceModel {
  static AttendanceEntity toEntityFromRemote(
    List<RAtCourse> atten,
    String semid,
  ) {
    List<SubAttendanceEntity> sub = [];
    int unixTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    for (var i in atten) {
      var temp = SubAttendanceEntity(
        serial: i.serial,
        category: i.category,
        courseName: i.courseName,
        courseCode: i.courseCode,
        courseType: i.courseType,
        facultyDetail: i.facultyDetail,
        classesAttended: i.classesAttended,
        totalClasses: i.totalClasses,
        attendancePercentage: i.attendancePercentage,
        attendenceFatCat: i.attendenceFatCat,
        debarStatus: i.debarStatus,
        courseId: i.courseId,
        semid: semid,
        updateTime: unixTime,
      );
      sub.add(temp);
    }
    return AttendanceEntity(attendance: sub);
  }

  static AttendanceEntity toEntityFromLocal(List<AttendanceTableData> atten) {
    List<SubAttendanceEntity> sub = [];
    for (var i in atten) {
      var temp = SubAttendanceEntity(
        serial: "${i.serial}",
        category: i.category,
        courseName: i.courseName,
        courseCode: i.courseCode,
        courseType: i.courseType,
        facultyDetail: i.facultyDetail,
        classesAttended: i.classesAttended,
        totalClasses: i.totalClasses,
        attendancePercentage: i.attendancePercentage,
        attendenceFatCat: i.attendenceFatCat,
        debarStatus: i.debarStatus,
        courseId: i.courseId,
        semid: i.semId,
        updateTime: i.time,
      );
      sub.add(temp);
    }
    return AttendanceEntity(attendance: sub);
  }
}
