import 'package:vitapmate/core/utils/usecase.dart';
import 'package:vitapmate/features/timetable/domain/entities/timetable_entity.dart';
import 'package:vitapmate/features/timetable/domain/repository/timetable_repository.dart';

class GetTimetableUsecase implements Usecase<TimetableEntity, void> {
  final TimetableRepository _timetableRepository;
  GetTimetableUsecase(this._timetableRepository);
  @override
  Future<TimetableEntity> call({void params}) async {
    var timetable = await _timetableRepository.getTimetableFromStorage();
    return timetable;
  }
}
