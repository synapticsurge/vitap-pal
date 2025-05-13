import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/core/shared/database/app_database.dart';
import 'package:vitapmate/core/shared/providers/client.dart';
import 'package:vitapmate/core/utils/global_async_queue.dart';
import 'package:vitapmate/features/attendance/data/datasource/local_data_source.dart';
import 'package:vitapmate/features/attendance/data/datasource/remote_data_source.dart';
part 'data_source.g.dart';

@riverpod
Future<LocalDataSource> attendanceLocalDataSource(Ref ref) async {
  return LocalDataSource(
    await ref.read(appDatabaseProvider.future),
    ref.read(globalAsyncQueueProvider.notifier),
  );
}

@riverpod
Future<RemoteDataSource> attendanceRemoteDataSource(Ref ref) async {
  return RemoteDataSource(
    await ref.watch(clientProvider.future),
    ref.read(globalAsyncQueueProvider.notifier),
  );
}
