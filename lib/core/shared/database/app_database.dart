import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/core/shared/database/appdatabase.dart';
import 'package:vitapmate/core/shared/user/presentation/providers/user.dart';
    part 'app_database.g.dart';

@Riverpod(keepAlive: true)
Future<AppDatabase> appDatabase(Ref ref) async {
  String? username = await ref.watch(userProvider.selectAsync((val)=>val.username));
  log("finished db build", level: 800);
  return AppDatabase(username: username);
}
