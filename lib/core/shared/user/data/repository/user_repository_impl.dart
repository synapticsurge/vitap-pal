import 'package:vitapmate/core/shared/user/data/datasource/local_data_source.dart';
import 'package:vitapmate/core/shared/user/data/datasource/remote_data_source.dart';
import 'package:vitapmate/core/shared/user/domine/entities/user_entity.dart';
import 'package:vitapmate/core/shared/user/domine/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final LocalDataSource _localDataSource;
  final RemoteDataSource _remoteDataSource;
  UserRepositoryImpl(this._localDataSource, this._remoteDataSource);
  @override
  Future<UserEntity> getUserDetails() async {
    return await _localDataSource.getUserDetailsFromStorage();
  }

  @override
  Future<void> updateUserDetails(String username, String password) async {
    var data = await _remoteDataSource.getUserDataValidityFromVtop(
      username,
      password,
    );
    if (data.$1) {
      _localDataSource.saveUserdetailsToStorage(username, password);
    } else {
      throw Exception(data.$2);
    }
  }

  @override
  Future<void> updateSemid(String semid) async {
    await _localDataSource.saveUserSemid(semid);
  }

  @override
  Future<void> updateIsValid(bool isValid) async {
   await _localDataSource.saveValidStateToStorage(isValid);
  }
}
