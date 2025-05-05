import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/core/database/appdatabase.dart';
import 'package:vitapmate/core/entities/user_entity.dart';
import 'user.dart';
part 'db.g.dart';

@Riverpod(keepAlive: true)
Future<AppDatabase> db(Ref ref) async {
  UserEntity user = await ref.watch(userProvider.future);
  log("finished db build", level: 800);
  return AppDatabase(username: user.username);
}
