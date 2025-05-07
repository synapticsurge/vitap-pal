import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/core/shared/entities/app_state_entity.dart';
part 'app_state.g.dart';

@Riverpod(keepAlive: true)
class AppState extends _$AppState {
  @override
  AppStateEntity build() {
    log("finished build of appstate");
    return AppStateEntity();
  }

  updatestate(data) {
    if (!data.$1) {
      if (data.$2 == "NE") {
        state = state.copyWith(newtork: false);
      } else if (data.$2 == "VE") {
        state = state.copyWith(vtopDown: true);
      }
    } else {
      state = state.copyWith(isLogin: true, newtork: true, vtopDown: false);
    }
  }
}
