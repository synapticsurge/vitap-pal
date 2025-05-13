import 'package:vitapmate/core/utils/usecase.dart';
import 'package:vitapmate/features/timetable/domain/entities/timetable_entity.dart';
import 'package:vitapmate/features/timetable/domain/repository/timetable_repository.dart';

class UpdateTimetableUsecase implements Usecase<TimetableEntity, void> {
  final TimetableRepository _timetableRepository;
  UpdateTimetableUsecase(this._timetableRepository);
  @override
  Future<TimetableEntity> call({void params}) async {
    await _timetableRepository.updateTimetable();
    var data = await _timetableRepository.getTimetableFromStorage();
    return data;
  }
}
