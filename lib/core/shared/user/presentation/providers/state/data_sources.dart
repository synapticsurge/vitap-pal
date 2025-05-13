import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/core/shared/user/data/datasource/local_data_source.dart';
import 'package:vitapmate/core/shared/user/data/datasource/remote_data_source.dart';
import 'package:vitapmate/core/utils/global_async_queue.dart';
part 'data_sources.g.dart';

@Riverpod(keepAlive: true)
LocalDataSource userLocalDataSource(Ref ref) {
  return LocalDataSource(FlutterSecureStorage());
}

@Riverpod(keepAlive: true)
RemoteDataSource userRemoteDataSource(Ref ref) {
  GlobalAsyncQueue queue = ref.read(globalAsyncQueueProvider.notifier);
  return RemoteDataSource(queue);
}
