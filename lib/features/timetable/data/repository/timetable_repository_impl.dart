import 'package:vitapmate/features/timetable/data/datasource/local_data_source.dart';
import 'package:vitapmate/features/timetable/data/datasource/remote_data_source.dart';
import 'package:vitapmate/features/timetable/domain/entities/timetable_entity.dart';
import 'package:vitapmate/features/timetable/domain/repository/timetable_repository.dart';

class TimetableRepositoryImpl extends TimetableRepository {
  final String semid;
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  TimetableRepositoryImpl({
    required this.semid,
    required this.remoteDataSource,
    required this.localDataSource,
  });
  @override
  Future<TimetableEntity> getTimetableFromStorage() async {
    var timetable = await localDataSource.getTimetable(semid);
    return timetable;
  }

  @override
  Future<void> saveTimetableToStorage({
    required TimetableEntity timetable,
  }) async {
    await localDataSource.saveTimetable(timetable, semid);
  }

  @override
  Future<void> updateTimetable() async {
    var timetable = await remoteDataSource.fetchTimetable(semid);
    saveTimetableToStorage(timetable: timetable);
  }
}
