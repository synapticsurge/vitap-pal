import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/providers/client.dart';
import 'package:vitapmate/providers/db.dart';
import 'package:vitapmate/service/timetable_service.dart';
import 'package:vitapmate/src/rust/api/vtop/client.dart';
import 'package:vitapmate/src/rust/api/vtop_main.dart';
part 'semid.g.dart';

@riverpod
class Semids extends _$Semids {
  @override
  Future<List<Map<String, String>>> build() async {
    var db = await ref.watch(dBProvider.future);
    var client = await ref.watch(clientProvider.future);
    Future.microtask(() async {
      await updateSemids(client, db);
    });
    return await getSemidsfromstorage(db);
  }

  Future<List<Map<String, String>>> getSemidsfromstorage(Database db) async {
    List<Map<String, String>> semids =
        await TimetableService.getTimetableSemIDs(db);
    return semids;
  }

  Future<void> updateSemids(Iclient client, Database db) async {
    var semdata = await rustTimetableSemid(client: client);
    if (!semdata.$1) return;
    List<Map<String, String>> semids = [];
    for (var i in semdata.$3) {
      Map<String, String> map = {};
      map[DBsemtable.semIDrow] = i.split(":")[1];
      map[DBsemtable.semNamerow] = i.split(":")[0];
      semids.add(map);
    }
    print(semids);
    await TimetableService.saveTimetableSemIDs(db, semids);
    var sem = await getSemidsfromstorage(db);
    state = AsyncData(sem);
  }
}
