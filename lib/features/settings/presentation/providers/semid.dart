import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/core/providers/db.dart';
part 'semid.g.dart';


@riverpod
class Semids extends _$Semids {
  //@override
  // Future<List<Map<String, String>>> build() async {
  //   var db = await ref.watch(dbProvider.future);
  //   Future.microtask(() async {
  //     await updateSemids(db);
  //   });
  //   return await getSemidsfromstorage(db);
  // }

  // Future<List<Map<String, String>>> getSemidsfromstorage() async {
  //   List<Map<String, String>> semids =
  //       await TimetableService.getTimetableSemIDs(db);
  //   return semids;
  // }

  // Future<void> updateSemids(Database db) async {
  //   var semdata = await ref.read(clientProvider.notifier).timetableSemid();
  //   if (semdata == null) return;
  //   if (!semdata.$1) return;
  //   List<Map<String, String>> semids = [];
  //   for (var i in semdata.$3) {
  //     Map<String, String> map = {};
  //     map[DBsemtable.semIDrow] = i.split(":")[1];
  //     map[DBsemtable.semNamerow] = i.split(":")[0];
  //     semids.add(map);
  //   }
  //   await TimetableService.saveTimetableSemIDs(db, semids);
  //   var sem = await getSemidsfromstorage(db);
  //   state = AsyncData(sem);
  // }

  // Future<void> updateall() async {
  //   var db = await ref.read(dBProvider.future);
  //   await updateSemids(db);
  // }
}