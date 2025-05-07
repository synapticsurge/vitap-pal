import 'package:vitapmate/core/shared/user/domine/entities/user_entity.dart';
import 'package:vitapmate/core/shared/user/domine/repository/user_repository.dart';
import 'package:vitapmate/core/utils/usecase.dart';

class GetUserDetails extends Usecase<UserEntity, void> {
  final UserRepository _userRepository;
  GetUserDetails(this._userRepository);
  @override
  Future<UserEntity> call({void params}) async {
    return await _userRepository.getUserDetails();
  }
}
