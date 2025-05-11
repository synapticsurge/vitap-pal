import 'package:vitapmate/core/shared/user/domine/repository/user_repository.dart';
import 'package:vitapmate/core/utils/usecase.dart';

class UpdateUserSemid extends Usecase<void, void> {
  final UserRepository _userRepository;
  final String _semid;
  UpdateUserSemid(this._userRepository, this._semid);
  @override
  Future<void> call({void params}) async {
    await _userRepository.updateSemid(_semid);
  }
}
