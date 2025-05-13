import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/core/shared/database/app_database.dart';
import 'package:vitapmate/core/shared/providers/client.dart';
import 'package:vitapmate/core/utils/global_async_queue.dart';
import 'package:vitapmate/features/settings/data/datasource/local_data_source.dart';
import 'package:vitapmate/features/settings/data/datasource/remote_data_source.dart';
part 'data_source.g.dart';

@riverpod
Future<LocalDataSource> semidlocalDataSource(Ref ref) async {
  var appDatabase = await ref.read(appDatabaseProvider.future);
  return LocalDataSource(
    ref.read(globalAsyncQueueProvider.notifier),
    appDatabase,
  );
}

@riverpod
Future<RemoteDataSource> semidRemoteDataSource(Ref ref) async {
  var client = await ref.watch(clientProvider.future);
  return RemoteDataSource(ref.read(globalAsyncQueueProvider.notifier), client);
}
