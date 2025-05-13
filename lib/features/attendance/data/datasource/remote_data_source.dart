import 'package:vitapmate/core/rust_gen/api/vtop/client.dart';
import 'package:vitapmate/core/rust_gen/api/vtop_main.dart';
import 'package:vitapmate/core/utils/global_async_queue.dart';
import 'package:vitapmate/features/attendance/data/models/attendance_model.dart';
import 'package:vitapmate/features/attendance/domain/entities/full_attendance_entity.dart';

class RemoteDataSource {
    final Iclient _client;
  final GlobalAsyncQueue _globalAsyncQueue;
  RemoteDataSource(this._client, this._globalAsyncQueue);


  Future<FullAttendanceEntity> fetchAttendance(String semid) async {
    var data = await _globalAsyncQueue.run(
      "rust_attendance_$semid",
      () => rustFullAttendance(client: _client, semid: semid,courseId: "kd",courseType: ""));
    if (data.$1) {
      return AttendanceModel.toEntityFromRemote(data.$3, semid);
    } else {
      throw Exception('Failed to fetch attendance: ${data.$2}');
    }
  }
}

