import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vitapmate/models/marks_model.dart';
import 'package:vitapmate/providers/app_state.dart';
import 'package:vitapmate/providers/client.dart';
import 'package:vitapmate/providers/db.dart';
import 'package:vitapmate/providers/settings.dart';
import 'package:vitapmate/service/marks_service.dart';
import 'package:vitapmate/src/rust/api/vtop/client.dart';
import 'package:vitapmate/src/rust/api/vtop_main.dart';
part 'marks.g.dart';

@riverpod
class Marks extends _$Marks {
  @override
  Future<MarksModel> build() async {
    Future.microtask(() async {
      await completeUpdate();
    });
    var db = await ref.watch(dBProvider.future);
    var settings = await ref.watch(settingsProvider.future);
    var k = await getMarksFromStorage(db, settings.selSemId!);
    return MarksModel(marks: k);
  }

  Future<List<Map<String, String>>> getMarksFromStorage(
    Database db,
    String semid,
  ) async {
    var marks = await MarksService.getMarks(db, semid);
    return marks;
  }

  Future<void> updateMarks(Iclient client, Database db, String semid) async {
    var marks = await rustMarksList(client: client, semid: semid);
    ref.watch(appStateProvider.notifier).updatestate(marks);
    if (!marks.$1) return;
    await MarksService.saveMarks(db, semid, marks.$3);
    print("updates marks");
    var fromstorage = await getMarksFromStorage(db, semid);
    var data = await future;
    if (data.marks != fromstorage) {}
  }

  Future completeUpdate() async {
    var db = await ref.watch(dBProvider.future);
    var settings = await ref.watch(settingsProvider.future);
    var client = await ref.watch(clientProvider.future);
    if (settings.selSemId != null) {
      print("Marks update in task ");
      //await updateSemids(client, db);
      await updateMarks(client, db, settings.selSemId!);
      print("done");
    }
  }
}
