import 'package:vitapmate/models/client.dart';
import 'package:vitapmate/src/rust/api/vtop/client.dart';
import 'package:vitapmate/src/rust/api/vtop/types.dart';
import 'package:vitapmate/src/rust/api/vtop_main.dart';

class TimetableList {
  List<String> semids = [];
  List<Timetable> timetable = [];
  Iclient client;

  TimetableList(this.client);
  fetchFromVtop({String? passSemid}) async {
    if (passSemid == null) {
      if (semids.isNotEmpty) {
        String sem = semids[0].split(":")[1];
        (bool, String, List<Timetable>) k = await rustTimetable(
          client: client,
          semid: sem,
        );
        if (k.$1) {
          timetable = k.$3;
        }
      }
    } else {
      (bool, String, List<Timetable>) k = await rustTimetable(
        client: client,
        semid: passSemid,
      );
      if (k.$1) {
        timetable = k.$3;
      }
    }
  }

  fetchsemid() async {
    (bool, String, List<String>) k = await rustTimetableSemid(client: client);
    if (k.$1) {
      semids = k.$3;
    }
  }
}
