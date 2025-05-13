import 'dart:developer';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/features/timetable/domain/entities/timetable_entity.dart';
import 'package:vitapmate/features/timetable/domain/usecase/get_timetable.dart';
import 'package:vitapmate/features/timetable/presentation/providers/state/timetable_repository.dart';
part 'timetable.g.dart';

@riverpod
class Timetable extends _$Timetable {
  @override
  Future<TimetableEntity> build() async {
    var timetableRepository = await ref.watch(
      timetableRepositoryProvider.future,
    );
    TimetableEntity timetable =
        await GetTimetableUsecase(timetableRepository).call();
    if (timetable.timetable.isEmpty) {
      var repo = await ref.watch(timetableRepositoryProvider.future);
      await repo.updateTimetable();
      timetable = await repo.getTimetableFromStorage();
    } else {
      Future.microtask(() async {
        try {
          await updateTimetable();
        } catch (e) {
          log("$e", level: 900);
        }
      });
    }

    return timetable;
  }

  Future<void> updateTimetable() async {
    var repo = await ref.read(timetableRepositoryProvider.future);
    await repo.updateTimetable();
    var data = await repo.getTimetableFromStorage();
    state = AsyncData(data);
  }
}
