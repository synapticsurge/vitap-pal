import 'package:vitapmate/core/shared/user/domine/repository/user_repository.dart';
import 'package:vitapmate/core/utils/usecase.dart';

class UpdateIsValid extends Usecase<void, void> {
  final UserRepository _userRepository;
  final bool isValid;
 
  UpdateIsValid(this._userRepository, this.isValid);

  @override
  Future<void> call({void params}) async {
    await _userRepository.updateIsValid(isValid);
  }
}
