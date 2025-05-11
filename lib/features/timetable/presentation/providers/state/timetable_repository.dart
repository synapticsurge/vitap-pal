import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/core/shared/user/presentation/providers/user.dart';
import 'package:vitapmate/features/timetable/data/repository/timetable_repository_impl.dart';
import 'package:vitapmate/features/timetable/domain/repository/timetable_repository.dart';
import 'package:vitapmate/features/timetable/presentation/providers/state/data_source.dart';
part 'timetable_repository.g.dart';


@riverpod
Future<TimetableRepository> timetableRepository(Ref ref) async {
  return TimetableRepositoryImpl(
    semid: await ref.watch(userProvider.selectAsync((val) => val.semid!)),
    remoteDataSource: await ref.read(timetableRemoteDataSourceProvider.future),
    localDataSource: await ref.read(timetableLocalDataSourceProvider.future),
  );
}
