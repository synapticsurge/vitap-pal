import 'dart:developer';

import 'package:vitapmate/models/global_async_queue_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'global_async_queue.g.dart';

@Riverpod(keepAlive: true)
class GlobalAsyncQueue extends _$GlobalAsyncQueue {
  @override
  GlobalAsyncQueueModel build() {
    return const GlobalAsyncQueueModel();
  }

  Future<T> run<T>(String id, Future<T> Function() task) {
    final current = state.running;
    if (current.containsKey(id)) {
      log("alraedy contains $id", level: 800);
      return current[id] as Future<T>;
    }
    final future = task();
    state = state.copyWith(running: {...current, id: future});
    log("added $id  to ${state.running}", level: 800);
    future.whenComplete(() {
      final updated = Map<String, Future>.from(state.running);
      log("remving $id from $updated", level: 800);
      updated.remove(id);
      state = state.copyWith(running: updated);
    });
    return future;
  }
}
