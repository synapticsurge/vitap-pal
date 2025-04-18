import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitapmate/models/client.dart';
import 'package:vitapmate/providers/user.p.dart';

class ClientNotifer extends AsyncNotifier<Client> {
  @override
  Future<Client> build() async {
    final userAsync = ref.watch(userProvider);

    return userAsync.when(
      loading: () {
        return Client();
      },
      error: (err, stack) {
        throw Exception("Error loading user data: $err");
      },

      data: (user) {
        var client = Client();
        client.clientLogin(user);
        return client;
      },
    );
  }
}

final clientProvider = AsyncNotifierProvider<ClientNotifer, Client>(() {
  return ClientNotifer();
});
