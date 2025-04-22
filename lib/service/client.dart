import 'package:vitapmate/constants.dart';
import 'package:vitapmate/models/client_model.dart';
import 'package:vitapmate/providers/client.dart';
import 'package:vitapmate/service/vtopuser.dart';
import 'package:vitapmate/src/rust/api/vtop/client.dart';
import 'package:vitapmate/src/rust/api/vtop_main.dart';

class ClientService {
  Iclient iclient = getClient();
  ClientModel data ;
  ClientService(this.data);
  Future<(bool, String)> clientLogin(VtopUser user) async {
    var login = await loginWithCreds(user.username, user.password);
    if (login.$2 == "NC") {
      user.nocreds = true;
    }
    if (!login.$1) {
      if (user.username != null &&
          user.password != null &&
          login.$2 == VtopMsgConstants.invalidCredsNameMsg) {
        await user.updateValidstate(false);
      }
      _validateInternalState(login);
    } else {

      data = data.copyWith(isLogin: true,isOnline: true);
    }
    return login;
  }

  Future<(bool, String)> loginWithCreds(username, password) async {
    if (username == null || password == null) {
      return (false, "NC");
    }
    var login = await onstartRun(
      iclient: iclient,
      username: username!,
      password: password!,
    );

    return login;
  }

  void _validateInternalState(dynamic state) {
    if (!state.$1) {
      if (state.$2 == "NE") {
        data = data.copyWith(isOnline: false);
      } else if (state.$2 == "VE") {
        data = data.copyWith(isVtopDown: true);
      }
    }
  }

  Future<(bool, String, List<String>)> timetableSemid() async {
    (bool, String, List<String>) k = await rustTimetableSemid(client: iclient);
    if (k.$1) {
      //dbupdate
    }
    return k;
  }
}
