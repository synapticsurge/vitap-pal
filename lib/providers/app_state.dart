import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/models/state_model.dart';
part 'app_state.g.dart';

@Riverpod(keepAlive: true)
class AppState extends _$AppState {
  @override
  AppStateModel build() {
    return AppStateModel();
  }

  updateisLogin(bool val) {
    state = state.copyWith(isLogin: val);
  }

  updatenetwork(bool val) {
    state = state.copyWith(networkUp: val);
  }

  updatevtopDown(bool val) {
    state = state.copyWith(vtopDown: val);
  }

  updatesucess() {
    state = state.copyWith(vtopDown: false, networkUp: true, isLogin: true);
  }

  updatestate(dynamic data) {
    if (!data.$1) {
      if (data.$2 == "NE") {
        updatenetwork(false);
      } else if (data.$2 == "VE") {
        updatevtopDown(true);
      }
    } else {
      updatesucess();
    }
  }
}
