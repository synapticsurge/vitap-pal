import 'package:vitapmate/core/shared/database/appdatabase.dart';
import 'package:vitapmate/core/utils/global_async_queue.dart';
import 'package:vitapmate/features/settings/business/entities/semid_entity.dart';
import 'package:vitapmate/features/settings/data/models/semids_model.dart';

class LocalDataSource {
  final AppDatabase _appDatabase;
  final GlobalAsyncQueue _globalAsyncQueue;
  LocalDataSource(this._globalAsyncQueue,this._appDatabase,);

  Future<SemidEntity> getSemidsFromStorage() async {
    List<SemTableData> data =
        await _globalAsyncQueue.run("get_semids_storage", ()=>_appDatabase.select(_appDatabase.semTable).get());
    return SemidsModel.fromLocalToEntity(data);
  }

  Future<void> saveSemidsToStorage(SemidEntity semid) async {
      await _globalAsyncQueue.run("toStriage_timetable_$semid", ()=>(_appDatabase.batch((batch) {
      batch.deleteAll(_appDatabase.semTable);
      batch.insertAll(_appDatabase.semTable, [
        for (var i in semid.semids)
          SemTableCompanion.insert(
            semName: i.semName,
            semid:  i.semid
          ),
      ]);
    })));
  }
}
