import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/core/constants/constants.dart';
import 'package:vitapmate/core/entities/user_entity.dart';
import 'package:vitapmate/core/rust_gen/api/vtop_main.dart';
part 'user.g.dart';

@Riverpod(keepAlive: true)
class User extends _$User {
  @override
  FutureOr<UserEntity> build() async {
    log("starting user build", level: 800);
    var storage = FlutterSecureStorage();
    var username = await storage.read(key: StorageKeys.vtopUsername);
    var password = await storage.read(key: StorageKeys.vtopPassword);
    var selsemid = await storage.read(key: StorageKeys.selectedSem);
    String? isValidStr = await storage.read(key: StorageKeys.isValid);
    var isValid = isValidStr == "true";
    log("finished user build", level: 800);
    return UserEntity(username: username, password: password, isValid: isValid,semid: selsemid);
  }

  Future<(bool, String)> updateCreds(String username, String password) async {
    var data = await future;
    log("trying to update user details", level: 800);
    final (bool, String) k = await onstartRun(
      iclient: getClient(),
      username: username,
      password: password,
    );
    var storage = FlutterSecureStorage();
    if (k.$1) {
      log("updated user details", level: 800);
      await storage.write(key: StorageKeys.vtopUsername, value: username);
      await storage.write(key: StorageKeys.vtopPassword, value: password);
      await storage.write(key: StorageKeys.isValid, value: "true");
      state = AsyncData(
        data.copyWith(isValid: true, username: username, password: password),
      );
    }
    return k;
  }

  FutureOr<void> updateValidstate(bool k) async {
    log("changing user valid state to $k", level: 800);
    var data = await future;
    var storage = FlutterSecureStorage();
    await storage.write(key: StorageKeys.isValid, value: "$k");
    state = AsyncData(data.copyWith(isValid: k));
  }
}
