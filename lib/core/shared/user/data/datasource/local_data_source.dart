import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vitapmate/core/constants/constants.dart';
import 'package:vitapmate/core/shared/user/domine/entities/user_entity.dart';

class LocalDataSource {
  final FlutterSecureStorage _storage;
  LocalDataSource(this._storage);
  Future<UserEntity> getUserDetailsFromStorage() async {
    var username = await _storage.read(key: StorageKeys.vtopUsername);
    var password = await _storage.read(key: StorageKeys.vtopPassword);
    var selsemid = await _storage.read(key: StorageKeys.selectedSem);
    String? isValidStr = await _storage.read(key: StorageKeys.isValid);
    var isValid = isValidStr == "true";
    return UserEntity(
      username: username,
      password: password,
      semid: selsemid,
      isValid: isValid,
    );
  }

  Future<void> saveUserdetailsToStorage(
    String username,
    String password,
  ) async {
    await _storage.write(key: StorageKeys.vtopUsername, value: username);
    await _storage.write(key: StorageKeys.vtopPassword, value: password);
    await _storage.write(key: StorageKeys.isValid, value: "true");
  }

  Future<void> saveValidStateToStorage(bool isValid) async {
    await _storage.write(key: StorageKeys.isValid, value: "$isValid");
  }
}
