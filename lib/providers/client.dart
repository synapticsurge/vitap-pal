import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/models/client_model.dart';
import 'package:vitapmate/models/user_model.dart';
import 'package:vitapmate/providers/user.dart';
import 'package:vitapmate/src/rust/api/vtop_main.dart';
part 'client.g.dart';

@Riverpod(keepAlive: true)
class Client extends _$Client {
  @override
  Future<ClientModel> build() async {
    ClientModel client = ClientModel(iclient: getClient());
    UserModel user = await ref.watch(userProvider.future);
    Future.microtask(() async {
      print("running  client build");
      await clientLogin(user);
    });
    return client;
  }

  Future<(bool, String)> loginWithCreds(username, password) async {
    var data = await future;
    if (username == null || password == null) {
      return (false, "NC");
    }
    var login = await onstartRun(
      iclient: data.iclient,
      username: username,
      password: password,
    );

    return login;
  }

  Future<(bool, String)> clientLogin(UserModel user) async {
    //UserModel user = await ref.read(userProvider.future);
    var data = await future;
    (bool, String) login = await loginWithCreds(user.username, user.password);

    if (!login.$1) {
      if (user.username != null &&
          user.password != null &&
          login.$2 == VtopMsgConstants.invalidCredsNameMsg) {
        await ref.read(userProvider.notifier).updateValidstate(false);
      }
    } else {
      state = AsyncData(data.copyWith(isLogin: true, isOnline: true));
    }
    await _validateInternalState(login);
    return login;
  }

  Future<void> _validateInternalState(dynamic value) async {
    var data = await future;
    if (!value.$1) {
      if (value.$2 == "NE") {
        state = AsyncData(data.copyWith(isOnline: false));
      } else if (value.$2 == "VE") {
        state = AsyncData(data.copyWith(isVtopDown: true));
      }
    }
  }

  //  Future<void> updateClient(Iclient client) async {
  //   var data = await future;
  //   state = AsyncData(
  //     data.copyWith(iclient: client, isLogin: client.loginactive),

  //   );
  // }
}
