import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/core/shared/user/data/repository/user_repository_impl.dart';
import 'package:vitapmate/core/shared/user/presentation/providers/state/data_sources.dart';
part 'user_repository.g.dart';

@Riverpod(keepAlive: true)
UserRepositoryImpl userRepositoryImpl(Ref ref) {
  return UserRepositoryImpl(
    ref.watch(userLocalDataSourceProvider),
    ref.watch(userRemoteDataSourceProvider),
  );
}
