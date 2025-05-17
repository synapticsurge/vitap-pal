import 'package:vitapmate/core/rust_gen/api/vtop_main.dart';
import 'package:vitapmate/core/utils/global_async_queue.dart';

class RemoteDataSource {
  final GlobalAsyncQueue _globalAsyncQueue;
  RemoteDataSource(this._globalAsyncQueue);
  Future<(bool, String)> getUserDataValidityFromVtop(
    String username,
    String password,
  ) async {
    return await _globalAsyncQueue.run(
      "usercredsvaliditycheck_$username",
      () => onstartRun(
        iclient: getClient(),
        username: username,
        password: password,
        isValid: true
      ),
    );
  }
}
