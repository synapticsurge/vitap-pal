import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitapmate/models/vtopuser.dart';

class UserNotifer extends AsyncNotifier<VtopUser> {
  @override
  FutureOr<VtopUser> build() async {
    VtopUser user = VtopUser();
    await user.fromStorage();
    return user;
  }
}

final userProvider = AsyncNotifierProvider<UserNotifer, VtopUser>(() {
  return UserNotifer();
});
