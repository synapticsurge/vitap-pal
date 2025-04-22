import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/models/client_model.dart';
import 'package:vitapmate/service/client.dart';

class VtopUser {
  String? username;
  String? password;
  bool loading = true;
  bool isValid = false;
  bool initialLoad = false;
  bool nocreds = false;
  final storage = FlutterSecureStorage();
  VtopUser({
    this.username,
    this.password,
    this.loading = true,
    this.isValid = false,
    this.initialLoad = false,
  });

  Future<void> fromStorage() async {
    username = await storage.read(key: StorageKeys.vtopUsername);
    password = await storage.read(key: StorageKeys.vtopPassword);
    String? isValidStr = await storage.read(key: StorageKeys.isValid);
    isValid = isValidStr == "true";
    initialLoad = (username == null && password == null && isValidStr == null);
  }

  Future<(bool, String)> update(String username, String password) async {
    final (bool, String) k = await ClientService(ClientModel()).loginWithCreds(username, password);
    if (k.$1) {
      await storage.write(key: StorageKeys.vtopUsername, value: username);
      await storage.write(key: StorageKeys.vtopPassword, value: password);
      await storage.write(key: StorageKeys.isValid, value: "true");
      this.username = username;
      this.password = password;
      isValid = true;
      initialLoad = false;
    }
    return k;
  }

  Future<void> updateValidstate(bool k) async {
    await storage.write(key: StorageKeys.isValid, value: "$k");
    isValid = k;
  }
}
