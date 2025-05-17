import 'package:vitapmate/core/rust_gen/api/vtop/client.dart';
import 'package:vitapmate/core/rust_gen/api/vtop_main.dart';
import 'package:vitapmate/core/shared/exceptions/custom_exceptions.dart';
import 'package:vitapmate/core/utils/global_async_queue.dart';
import 'package:vitapmate/features/settings/business/entities/semid_entity.dart';
import 'package:vitapmate/features/settings/data/models/semids_model.dart';

class RemoteDataSource {
  final GlobalAsyncQueue _globalAsyncQueue;
  final Iclient _client;
  RemoteDataSource(this._globalAsyncQueue, this._client);
  Future<SemidEntity> fetchSemids() async {
    var data = await _globalAsyncQueue.run(
      "rust_semidsfrom_timetabel",
      () => rustTimetableSemid(client: _client),
    );
    if (data.$1) {
      return SemidsModel.fromRemoteToEntity(data.$3);
    } else if (data.$2 == "NE") {
      throw NoNetworkExpection(data.$2);
    } else if (data.$2 == "VE") {
      throw VtopErrorExpection(data.$2);
    } else {
      throw Exception(data.$2);
    }
  }
}
