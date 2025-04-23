import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/models/timetable_model.dart';
import 'package:vitapmate/providers/client.dart';
import 'package:vitapmate/providers/db.dart';
import 'package:vitapmate/service/timetable_service.dart';
import 'package:vitapmate/src/rust/api/vtop_main.dart';
part 'timetable.g.dart';

@Riverpod(keepAlive: true)
class Timetable extends _$Timetable {
  @override
  Future<TimetableModel> build() async {
    var db = await ref.watch(dBProvider.future);
    await TimetableService.getTimetableSemIDs(db);
    return TimetableModel(semid: {}, timetable: []);
  }

  Future<void> updateSemids() async {
    var db = await ref.read(dBProvider.future);
    var client = await ref.read(clientProvider.future);
    if (!client.isLogin) return;
    var data = await rustTimetableSemid(client: client.iclient);
    if (!data.$1) return;
    Map<String, String> maps = {};
    for (var i in data.$3) {
      maps[i.split(":")[1]] = i.split(":")[0];
    }
    TimetableService.saveTimetableSemIDs(db, maps);
  }

  Future<void> getfromstorage() async {
    var db = await ref.read(dBProvider.future);
    await TimetableService.getTimetableSemIDs(db);
  }
}
