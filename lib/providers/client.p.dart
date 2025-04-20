import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitapmate/models/client.dart';
import 'package:vitapmate/models/vtopuser.dart';
import 'package:vitapmate/providers/user.p.dart';

class ClientNotifier extends AsyncNotifier<Client> {
  @override
  FutureOr<Client> build() async {
    Client client = Client();
    VtopUser user = await ref.read(userProvider.future);
    await client.clientLogin(user);
    return client;
  }
}

final clinetProvider = AsyncNotifierProvider<ClientNotifier, Client>(() {
  return ClientNotifier();
});
