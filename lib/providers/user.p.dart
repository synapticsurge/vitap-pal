import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitapmate/models/vtopuser.dart';

class UsertNotifer extends AsyncNotifier<VtopUser> {
  @override
  Future<VtopUser> build() async {
    var k = await VtopUser.fromStorage();
    return k;
  }
}

final userProvider = AsyncNotifierProvider<UsertNotifer, VtopUser>(() {
  return UsertNotifer();
});
