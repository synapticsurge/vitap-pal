import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/models/user_model.dart';
import 'package:vitapmate/providers/app_state.dart';
import 'package:vitapmate/providers/user.dart';
import 'package:vitapmate/src/rust/api/vtop/client.dart';
import 'package:vitapmate/src/rust/api/vtop_main.dart';
part 'client.g.dart';

@Riverpod(keepAlive: true)
class Client extends _$Client {
  @override
  Future<Iclient> build() async {
    UserModel user = await ref.watch(userProvider.future);
    Iclient client = getClient();
    if (user.isValid) {
      var login = await onstartRun(
        iclient: client,
        username: user.username ?? "ooo",
        password: user.password ?? "ooo",
      );
      if (!login.$1) {
        var k = login.$2;
        if (k == "NE") {
          ref.read(appStateProvider.notifier).updatenetwork(false);
        } else if (user.username != null &&
            user.password != null &&
            k == VtopMsgConstants.invalidCredsNameMsg) {
          await ref.read(userProvider.notifier).updateValidstate(false);
        } else if (k == "VE") {
          ref.read(appStateProvider.notifier).updatevtopDown(false);
        }
      } else {
        ref.read(appStateProvider.notifier).updatesucess();
      }
    }
    print("new client");
    print(client.loginactive);
    return client;
  }
}
