import 'dart:developer';
import 'package:riverpod_annotation/riverpod_annotation.dart';
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
    UserEntity user = await ref.watch(userProvider.future);
    Iclient client = getClient();

    if (user.isValid) {
      if (user.password == null || user.username == null) {
        throw Exception(
          "No uername and password , this is not expected to happen",
        );
      } else {
        Future.microtask(() async {
          await _login(user.username!, user.password!);
        });
      }
    }
    log("new client ${client.loginactive}", level: 800);

    return client;
  }

  Future<void> _login(String username, String password) async {
    Iclient client = await future;
    var login = await ref
        .read(globalAsyncQueueProvider.notifier)
        .run(
          "rust_onstartRun_$username",
          () => onstartRun(
            iclient: client,
            username: username,
            password: password,
          ),
        );
    try {
      ref.read(appStateProvider.notifier).updatestate(login);
    } catch (e) {
      log("$e", level: 1000);
    }
  }

  Future<void> login() async {
    UserEntity user = await ref.watch(userProvider.future);
    await _login(user.username!, user.password!);
  }
}
