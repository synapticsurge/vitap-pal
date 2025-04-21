import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/service/vtopuser.dart';
part 'user.g.dart';


@riverpod
class User  extends _$User{
   @override
  FutureOr<VtopUser> build() async {
    VtopUser user = VtopUser();
    await user.fromStorage();
    return user;
  }
  
}