import 'package:vitapmate/core/shared/user/domine/entities/user_entity.dart';

abstract class UserRepository {
  Future<void> updateUserDetails(String username, String password);
  Future<UserEntity> getUserDetails();
  Future<void> updateSemid(String semid);
  Future<void> updateIsValid(bool isValid);
}
