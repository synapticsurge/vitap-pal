import 'dart:developer';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import '../models/marks_model.dart';
import 'app_state.dart';
import 'client.dart';
import 'db.dart';
import 'settings.dart';
import '../service/marks_service.dart';
import 'package:vitapmate/src/rust/api/vtop/client.dart';
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
    var marks = await ref.read(clientProvider.notifier).marks(semid);
    if (marks == null) return;
    ref.read(appStateProvider.notifier).updatestate(marks);
    if (!marks.$1) return;
    await MarksService.saveMarks(db, semid, marks.$3);
    log("updates marks", level: 800);
    var fromstorage = await getMarksFromStorage(db, semid);
    var data = await future;
    if (data.marks != fromstorage) {}
  }

  Future completeUpdate() async {
    var db = await ref.read(dBProvider.future);
    var settings = await ref.read(settingsProvider.future);
    var client = await ref.read(clientProvider.future);
    if (settings.selSemId != null) {
      log("Marks update in task ", level: 800);
      await updateMarks(client, db, settings.selSemId!);
    }
  }
}
