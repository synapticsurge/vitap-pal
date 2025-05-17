import 'package:vitapmate/core/rust_gen/api/vtop/client.dart';
import 'package:vitapmate/core/rust_gen/api/vtop_main.dart';
import 'package:vitapmate/core/shared/exceptions/custom_exceptions.dart';
import 'package:vitapmate/core/utils/global_async_queue.dart';
import 'package:vitapmate/features/attendance/data/models/attendance_model.dart';
import 'package:vitapmate/features/attendance/data/models/full_attendance_model.dart';
import 'package:vitapmate/features/attendance/domain/entities/attendance_entity.dart';
import 'package:vitapmate/features/attendance/domain/entities/full_attendance_entity.dart';

class RemoteDataSource {
  final Iclient _client;
  final GlobalAsyncQueue _globalAsyncQueue;
  RemoteDataSource(this._client, this._globalAsyncQueue);

  Future<FullAttendanceEntity> fetchFullAttendance(
    String semid,
    String courseType,
    String courseId,
  ) async {
    var data = await _globalAsyncQueue.run(
      "rust_Fullattendance_${semid}_${courseType}_$courseId",
      () => rustFullAttendance(
        client: _client,
        semid: semid,
        courseId: courseId,
        courseType: courseType,
      ),
    );
    if (data.$1) {
      return FullAttendanceModel.toEntityFromRemote(
        data.$3,
        semid,
        courseType,
        courseId,
      );
    }else if (data.$2 == "NE") {
      throw NoNetworkExpection(data.$2);
    }  else if (data.$2 == "VE") {
      throw VtopErrorExpection(data.$2);
    } else {
      throw Exception('Failed to fetch full attendance: ${data.$2}');
    }
  }

  Future<AttendanceEntity> fetchAttendance(String semid) async {
    var data = await _globalAsyncQueue.run(
      "rust_attendance_$semid",
      () => rustAttendance(client: _client, semid: semid),
    );
    if (data.$1) {
      return AttendanceModel.toEntityFromRemote(data.$3, semid);
    }else if (data.$2 == "NE") {
      throw NoNetworkExpection(data.$2);
    }  else if (data.$2 == "VE") {
      throw VtopErrorExpection(data.$2);
    } else {
      throw Exception('Failed to fetch attendance: ${data.$2}');
    }
  }
}
