import 'package:vitapmate/core/shared/database/appdatabase.dart';
import 'package:vitapmate/core/rust_gen/api/vtop/types.dart';
import 'package:vitapmate/features/timetable/domain/entities/sub_timetable_entity.dart';
import 'package:vitapmate/features/timetable/domain/entities/timetable_entity.dart';

class TimetableModel {
  static toEntityFromRemote(List<RTimetable> rtimetable,String semid) {
    List<SubTimeTableEntity> sub = [];
    int unixTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    for (var i in rtimetable) {
      var temp = SubTimeTableEntity(
        block: i.block,
        courseCode: i.courseCode,
        courseType: i.courseType,
        day: i.day,
        endTime: i.endTime,
        name: i.name,
        roomNo: i.roomNo,
        serial: i.serial,
        slot: i.slot,
        startTime: i.startTime,
        semid: semid ,
        updateTime: unixTime
      );
      sub.add(temp);
    }
    return TimetableEntity(timetable: sub);
  }
  static toEntityFromLocal(List<TimetableData> rtimetable) {
    List<SubTimeTableEntity> sub = [];
    int unixTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    for (var i in rtimetable) {
      var temp = SubTimeTableEntity(
        block: i.block,
        courseCode: i.courseCode,
        courseType: i.courseType,
        day: i.day,
        endTime: i.endTime,
        name: i.courseName,
        roomNo: i.roomNo,
        serial: "${i.serial}",
        slot: i.slot,
        startTime: i.startTime,
        semid: i.semId ,
        updateTime: unixTime
      );
      sub.add(temp);
    }
    return TimetableEntity(timetable: sub);
  }
}
