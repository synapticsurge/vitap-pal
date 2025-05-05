import 'package:vitapmate/features/timetable/domain/entities/timetable_entity.dart';

abstract class TimetableRepository {
  Future<TimetableEntity> getTimetableFromStorage();
  Future<void> saveTimetableToStorage({required TimetableEntity timetable});
  Future<void> updateTimetable();
}
