import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/core/shared/database/appdatabase.dart';
import 'package:vitapmate/core/shared/user/domine/entities/user_entity.dart';
import 'package:vitapmate/core/shared/user/presentation/providers/user.dart';
    part 'app_database.g.dart';

@Riverpod(keepAlive: true)
Future<AppDatabase> appDatabase(Ref ref) async {
  UserEntity user = await ref.watch(userProvider.future);
  log("finished db build", level: 800);
  return AppDatabase(username: user.username);
}
