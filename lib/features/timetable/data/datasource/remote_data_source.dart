import 'package:vitapmate/core/rust_gen/api/vtop/client.dart';
import 'package:vitapmate/core/rust_gen/api/vtop_main.dart';
import 'package:vitapmate/features/timetable/data/models/timetable_model.dart';
import 'package:vitapmate/features/timetable/domain/entities/timetable_entity.dart';

class RemoteDataSource {
  final Iclient client;
  RemoteDataSource({required this.client});

  Future<TimetableEntity> fetchTimetable(String semid) async {
    var data = await rustTimetable(client: client, semid: semid);
    if (data.$1) {
      return TimetableModel.toEntityFromRemote(data.$3,semid);
    } else {
      throw Exception('Failed to fetch timetable: ${data.$2}');
    }
  }

}
