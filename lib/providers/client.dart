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
  ClientModel build() {
    ClientModel client = ClientModel(iclient: getClient());
    Future.microtask(() {
      clientLogin();
    });
    return client;
  }

  Future<(bool, String)> loginWithCreds(username, password) async {
    if (username == null || password == null) {
      return (false, "NC");
    }
    var login = await onstartRun(
      iclient: state.iclient,
      username: username,
      password: password,
    );

    return login;
  }

  Future<(bool, String)> clientLogin() async {
    UserModel user = await ref.read(userProvider.future);
    (bool,String) login = await loginWithCreds(user.username, user.password);

    if (!login.$1) {
      if (user.username != null &&
          user.password != null &&
          login.$2 == VtopMsgConstants.invalidCredsNameMsg) {
        await ref.read(userProvider.notifier).updateValidstate(false);
      }
    } else {
      state = state.copyWith(isLogin: true, isOnline: true);
    }
    _validateInternalState(login);
    return login;
  }


  void _validateInternalState(dynamic value) {
    if (!value.$1) {
      if (value.$2 == "NE") {
        state = state.copyWith(isOnline: false);
      } else if (value.$2 == "VE") {
        state = state.copyWith(isVtopDown: true);
      }
    }
  }
}
