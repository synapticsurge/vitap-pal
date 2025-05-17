import 'dart:developer';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/core/constants/constants.dart';
import 'package:vitapmate/core/shared/user/domine/entities/user_entity.dart';
import 'package:vitapmate/core/rust_gen/api/vtop/client.dart';
import 'package:vitapmate/core/shared/user/presentation/providers/user.dart';
import 'app_state.dart';
import '../../utils/global_async_queue.dart';

import 'package:vitapmate/core/rust_gen/api/vtop_main.dart';
part 'client.g.dart';

@Riverpod(keepAlive: true)
class Client extends _$Client {
  @override
  Future<Iclient> build() async {
    String? username = await ref.watch(
      userProvider.selectAsync((val) => val.username),
    );
    String? password = await ref.watch(
      userProvider.selectAsync((val) => val.password),
    );
    bool isValid = await ref.watch(
      userProvider.selectAsync((val) => val.isValid),
    );
    Iclient client = getClient();

    if (isValid) {
      if (password == null || username == null) {
        throw Exception(
          "No uername and password , this is not expected to happen",
        );
      } else {
        Future.microtask(() async {
          await _login(username, password, isValid);
        });
      }
    }
    log("new client ${client.loginactive}", level: 800);

    return client;
  }

  Future<void> _login(String username, String password, bool isValid) async {
    Iclient client = await future;
    ref.read(appStateProvider.notifier).updateLoading(true);
    var login = await ref
        .read(globalAsyncQueueProvider.notifier)
        .run(
          "rust_onstartRun_$username",
          () => onstartRun(
            iclient: client,
            username: username,
            password: password,
            isValid: isValid,
          ),
        );
    ref.read(appStateProvider.notifier).updateLoading(false);
    ref.read(appStateProvider.notifier).updatestate(login);
    _checkLoginData(login);
  }

  Future<void> login() async {
    UserEntity user = await ref.watch(userProvider.future);
    await _login(user.username!, user.password!, user.isValid);
  }

  Future<void> _checkLoginData((bool, String) data) async {
    if (data.$1) true;
    if (VtopMsgConstants.invalidCredsNameMsg.contains(data.$2.toLowerCase())) {
      Iclient client = await future;
      await client.clientSetValid(val: false);
      await ref.read(userProvider.notifier).updateIsValid(false);
    }
  }
}
