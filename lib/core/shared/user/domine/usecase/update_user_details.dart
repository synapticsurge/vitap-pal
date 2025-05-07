import 'package:vitapmate/core/shared/user/domine/repository/user_repository.dart';
import 'package:vitapmate/core/utils/usecase.dart';

class UpdateUserDetails extends Usecase<void,void> {
  final UserRepository _userRepository;
  final String _username ;
  final String _password;
  UpdateUserDetails(this._userRepository,this._password,this._username);

  @override
  Future<void> call({void params}) async {
    await _userRepository.updateUserDetails(_username,_password);
  }
}
