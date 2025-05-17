import 'dart:developer';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/core/shared/user/domine/entities/user_entity.dart';
import 'package:vitapmate/core/shared/user/domine/usecase/get_user_details.dart';
import 'package:vitapmate/core/shared/user/domine/usecase/update_is_valid.dart';
import 'package:vitapmate/core/shared/user/domine/usecase/update_user_details.dart';
import 'package:vitapmate/core/shared/user/domine/usecase/update_user_semid.dart';
import 'package:vitapmate/core/shared/user/presentation/providers/state/user_repository.dart';
part 'user.g.dart';

@Riverpod(keepAlive: true)
class User extends _$User {
  @override
  Future<UserEntity> build() async {
    log("build of user enity");
    UserEntity user =
        await GetUserDetails(ref.watch(userRepositoryImplProvider)).call();
    return user;
  }

  Future<void> updateUserDetails(String username, String password) async {
    await UpdateUserDetails(
      ref.watch(userRepositoryImplProvider),
      username,
      password,
    ).call();
    var data = await future;
    state = AsyncData(
      data.copyWith(username: username, password: password, isValid: true),
    );
  }

  Future<void> updateSemid(String semid) async {
    await UpdateUserSemid(ref.watch(userRepositoryImplProvider), semid).call();
    var data = await future;
    state = AsyncData(data.copyWith(semid: semid));
  }

  Future<void> updateIsValid(bool isvalid) async {
    await UpdateIsValid(ref.watch(userRepositoryImplProvider), isvalid).call();
       var data = await future;
    state = AsyncData(data.copyWith(isValid: isvalid));
  }
}
