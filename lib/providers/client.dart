
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/models/client_model.dart';
import 'package:vitapmate/service/client.dart';
import 'package:vitapmate/service/vtopuser.dart';
import 'package:vitapmate/providers/user.dart';
part 'client.g.dart';

@Riverpod(keepAlive: true)
class Client extends _$Client {
  @override
  FutureOr<ClientService> build() async {
    ClientService client = ClientService(ClientModel());
    VtopUser user = await ref.read(userProvider.future);
    await client.clientLogin(user);
    return client;
  }
}