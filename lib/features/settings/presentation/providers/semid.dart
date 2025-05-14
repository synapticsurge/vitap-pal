import 'dart:developer';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/features/settings/business/entities/semid_entity.dart';
import 'package:vitapmate/features/settings/business/repository/semid_repository.dart';
import 'package:vitapmate/features/settings/business/usecase/get_semids.dart';
import 'package:vitapmate/features/settings/presentation/providers/state/semid_repository.dart';
part 'semid.g.dart';

@riverpod
class Semids extends _$Semids {
  @override
  Future<SemidEntity> build() async {
    var semidRepository = await ref.read(semidRepositoryProvider.future);
    Future.microtask(() async {
      try {
        await updatesemids();
      } catch (e) {
        log("$e", level: 900);
      }
    });
    return await GetSemidsUsecase(semidRepository).call();
  }

  Future<void> updatesemids() async {
    SemidRepository repo = await ref.read(semidRepositoryProvider.future);
    var data = await repo.updateSemids();
    state = AsyncData(data);
  }
}
