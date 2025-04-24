import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/constants.dart';
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
    print("running  timetable build");
    Future.microtask(() async {
      await updateSemids();
      await getfromstorage();
    });
    return TimetableModel(semid: [], timetable: []);
  }

  Future<void> updateSemids() async {
    var db = await ref.read(dBProvider.future);
    var client = await ref.read(clientProvider.future);
    var data = await future;
    if (!client.isLogin) return;
    var semdata = await rustTimetableSemid(client: client.iclient);
    if (!semdata.$1) return;
    List<Map<String, String>> semids = [];
    for (var i in semdata.$3) {
      Map<String, String> map = {};
      map[DBsemtable.semIDrow] = i.split(":")[1];
      map[DBsemtable.semNamerow] = i.split(":")[0];
      semids.add(map);
    }

    await TimetableService.saveTimetableSemIDs(db, semids);
    state = AsyncData(data.copyWith(semid: semids));
  }

  Future<void> getfromstorage() async {
    var db = await ref.read(dBProvider.future);
    List<Map<String, String>> semids =
        await TimetableService.getTimetableSemIDs(db);
    var data = await future;
    state = AsyncData(data.copyWith(semid: semids));
  }
}
