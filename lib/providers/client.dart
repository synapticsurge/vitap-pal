import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/models/user_model.dart';
import 'package:vitapmate/providers/app_state.dart';
import 'package:vitapmate/providers/global_async_queue.dart';
import 'package:vitapmate/providers/user.dart';
import 'package:vitapmate/src/rust/api/vtop/client.dart';
import 'package:vitapmate/src/rust/api/vtop_main.dart';
part 'client.g.dart';

@Riverpod(keepAlive: true)
class Client extends _$Client {
  @override
  Future<Iclient> build() async {
    UserModel user = await ref.watch(userProvider.future);
    Iclient client = getClient();
    if (user.isValid) {
      var login = await ref
          .read(globalAsyncQueueProvider.notifier)
          .run(
            "rust_onstartRun_${user.username}",
            () => onstartRun(
              iclient: client,
              username: user.username ?? "ooo",
              password: user.password ?? "ooo",
            ),
          );
      if (!login.$1) {
        ref.read(appStateProvider.notifier).updatestate(login);
      } else {
        ref.read(appStateProvider.notifier).updatesucess();
      }
    }
    log("new client ${client.loginactive}", level: 800);

    return client;
  }

  Future attendance(String selSemId) async {
    var k = await ref.read(userProvider.future);
    var client = await future;
    if (!k.isValid) return;
    var c = await ref
        .watch(globalAsyncQueueProvider.notifier)
        .run(
          "rust_attendance_$selSemId",
          () => rustAttendance(client: client, semid: selSemId),
        );
    ref.read(appStateProvider.notifier).updatestate(c);
    return c;
  }

  Future fullAttendance(
    String selSemId,
    String classid,
    String courseType,
  ) async {
    var k = await ref.read(userProvider.future);
    var client = await future;
    if (!k.isValid) return;
    var c = await ref
        .watch(globalAsyncQueueProvider.notifier)
        .run(
          "rust_fullAttendance_${selSemId}_${classid}_$courseType",
          () => rustFullAttendance(
            client: client,
            semid: selSemId,
            courseId: classid,
            courseType: courseType,
          ),
        );
    ref.read(appStateProvider.notifier).updatestate(c);
    return c;
  }

  Future timetable(String selSemId) async {
    var k = await ref.read(userProvider.future);
    var client = await future;
    if (!k.isValid) return;
    var c = await ref
        .read(globalAsyncQueueProvider.notifier)
        .run(
          "rust_timetable_$selSemId",
          () => rustTimetable(client: client, semid: selSemId),
        );
    ref.read(appStateProvider.notifier).updatestate(c);
    return c;
  }

  Future timetableSemid(Iclient client) async {
    var k = await ref.read(userProvider.future);
    var client = await future;
    if (!k.isValid) return;
    var c = await ref
        .read(globalAsyncQueueProvider.notifier)
        .run("rust_timetableSemid", () => rustTimetableSemid(client: client));
    ref.read(appStateProvider.notifier).updatestate(c);
    return c;
  }

  Future examSchedule(String selSemId) async {
    var k = await ref.read(userProvider.future);
    var client = await future;
    if (!k.isValid) return;
    var c = await ref
        .read(globalAsyncQueueProvider.notifier)
        .run(
          "rust_examSchedule_$selSemId",
          () => rustExamShedule(client: client, semid: selSemId),
        );
    ref.read(appStateProvider.notifier).updatestate(c);
    return c;
  }

  Future marks(String selSemId) async {
    var k = await ref.read(userProvider.future);
    var client = await future;
    if (!k.isValid) return;
    var c = await ref
        .read(globalAsyncQueueProvider.notifier)
        .run(
          "rust_marks_$selSemId",
          () => rustMarksList(client: client, semid: selSemId),
        );
    ref.read(appStateProvider.notifier).updatestate(c);
    return c;
  }
}
