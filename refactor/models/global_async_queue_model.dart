import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'global_async_queue_model.freezed.dart';

@freezed
sealed class GlobalAsyncQueueModel with _$GlobalAsyncQueueModel {
  const factory GlobalAsyncQueueModel({
    @Default({}) Map<String, Future> running,
  }) = _GlobalAsyncQueueMode;
}
