import 'dart:developer';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/core/shared/user/presentation/providers/user.dart';
import 'package:vitapmate/features/timetable/domain/entities/timetable_entity.dart';
import 'package:vitapmate/features/timetable/domain/usecase/get_timetable.dart';
import 'package:vitapmate/features/timetable/domain/usecase/update_timetable.dart';
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
      timetable = await UpdateTimetableUsecase(timetableRepository).call();
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
    var user = await ref.read(userProvider.future);
    if (!user.isValid) return;
    var repo = await ref.read(timetableRepositoryProvider.future);
    var data = await UpdateTimetableUsecase(repo).call();
    state = AsyncData(data);
  }
}
