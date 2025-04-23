import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/models/user_model.dart';
import 'package:vitapmate/src/rust/api/vtop/client.dart';
import 'package:vitapmate/src/rust/api/vtop_main.dart';
part 'user.g.dart';

@Riverpod(keepAlive: true)
class User extends _$User {
  @override
  FutureOr<UserModel> build() async {
    UserModel user = UserModel(storage: FlutterSecureStorage());
    var username = await user.storage.read(key: StorageKeys.vtopUsername);
    var password = await user.storage.read(key: StorageKeys.vtopPassword);
    String? isValidStr = await user.storage.read(key: StorageKeys.isValid);
    var isValid = isValidStr == "true";
    var initialLoad =
        (username == null && password == null && isValidStr == null);
    user = user.copyWith(
      initialLoad: initialLoad,
      isValid: isValid,
      loading: false,
      username: username,
      password: password,
    );
    return user;
  }

  Future<(bool, String)> updateCreds(String username, String password) async {
    var data = await future;
    Iclient newclient = getClient();
    final (bool, String) k = await onstartRun(
      iclient: newclient,
      username: username,
      password: password,
    );
    if (k.$1) {
      await data.storage.write(key: StorageKeys.vtopUsername, value: username);
      await data.storage.write(key: StorageKeys.vtopPassword, value: password);
      await data.storage.write(key: StorageKeys.isValid, value: "true");
      state = AsyncData(
        data.copyWith(
          isValid: true,
          initialLoad: false,
          username: username,
          password: password,
        ),
      );
    }
    return k;
  }

  FutureOr<void> updateValidstate(bool k) async {
    var data = await future;
    await data.storage.write(key: StorageKeys.isValid, value: "$k");
    state = AsyncData(data.copyWith(isValid: k));
  }
}
