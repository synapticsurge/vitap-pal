import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/models/client.dart';

class VtopUser {
  String? username;
  String? password;
  bool loading = true;
  bool isValid = false;
  bool initialLoad = false;

  VtopUser({
    this.username,
    this.password,
    this.loading = true,
    this.isValid = false,
    this.initialLoad = false,
  });

  static Future<VtopUser> fromStorage() async {
    final storage = FlutterSecureStorage();
    String? username = await storage.read(key: StorageKeys.vtopUsername);
    String? password = await storage.read(key: StorageKeys.vtopPassword);
    String? isValidStr = await storage.read(key: StorageKeys.isValid);
    bool isValid = isValidStr == "true";
    bool initialLoad =
        (username == null && password == null && isValidStr == null);
    return VtopUser(
      username: username,
      password: password,
      isValid: isValid,
      initialLoad: initialLoad,
      loading: false,
    );
  }

  Future<(bool, String)> update(String username, String password) async {
    final (bool, String) k = await Client().loginWithCreds(username, password);
    if (k.$1) {
      final storage = FlutterSecureStorage();
      await storage.write(key: StorageKeys.vtopUsername, value: username);
      await storage.write(key: StorageKeys.vtopPassword, value: password);
      await storage.write(key: StorageKeys.isValid, value: "true");
      this.username = username;
      this.password = password;
      isValid = true;
    }
    return k;
  }

  Future<void> updateValidstate(bool k) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: StorageKeys.isValid, value: "$k");
    isValid = k;
  }
}
