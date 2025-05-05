import 'dart:developer';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/core/entities/user_entity.dart';
import 'package:vitapmate/core/rust_gen/api/vtop/client.dart';
import 'app_state.dart';
import '../utils/global_async_queue.dart';
import 'user.dart';
import 'package:vitapmate/core/rust_gen/api/vtop_main.dart';
part 'client.g.dart';

@Riverpod(keepAlive: true)
class Client extends _$Client {
  @override
  Future<Iclient> build() async {
    UserEntity user = await ref.watch(userProvider.future);
    Iclient client = getClient();
    if (user.isValid) {
      if (user.password == null || user.username == null) {
        throw Exception("No uername and password , this is not expected to happen");
      }
      var login = await ref
          .read(globalAsyncQueueProvider.notifier)
          .run(
            "rust_onstartRun_${user.username}",
            () => onstartRun(
              iclient: client,
              username: user.username!,
              password: user.password!,
            ),
          );
      ref.read(appStateProvider.notifier).updatestate(login);
    }
    log("new client ${client.loginactive}", level: 800);

    return client;
  }

  //   Future attendance(String selSemId) async {
  //     var k = await ref.read(userProvider.future);
  //     var client = await future;
  //     if (!k.isValid) throw Exception("user details are in valid");
  //     var c = await ref
  //         .read(globalAsyncQueueProvider.notifier)
  //         .run(
  //           "rust_attendance_$selSemId",
  //           () => rustAttendance(client: client, semid: selSemId),
  //         );
  //     ref.read(appStateProvider.notifier).updatestate(c);
  //     return c;
  //   }

  //   Future fullAttendance(
  //     String selSemId,
  //     String classid,
  //     String courseType,
  //   ) async {
  //     var k = await ref.read(userProvider.future);
  //     var client = await future;
  //     if (!k.isValid) throw Exception("user details are in valid");
  //     var c = await ref
  //         .watch(globalAsyncQueueProvider.notifier)
  //         .run(
  //           "rust_fullAttendance_${selSemId}_${classid}_$courseType",
  //           () => rustFullAttendance(
  //             client: client,
  //             semid: selSemId,
  //             courseId: classid,
  //             courseType: courseType,
  //           ),
  //         );
  //     ref.read(appStateProvider.notifier).updatestate(c);
  //     return c;
  //   }

  //   Future timetable(String selSemId) async {
  //     var k = await ref.read(userProvider.future);
  //     var client = await future;
  //     if (!k.isValid) throw Exception("user details are in valid");
  //     var c = await ref
  //         .read(globalAsyncQueueProvider.notifier)
  //         .run(
  //           "rust_timetable_$selSemId",
  //           () => rustTimetable(client: client, semid: selSemId),
  //         );
  //     ref.read(appStateProvider.notifier).updatestate(c);
  //     return c;
  //   }

  //   Future timetableSemid() async {
  //     var k = await ref.read(userProvider.future);
  //     var client = await future;
  //     if (!k.isValid) throw Exception("user details are in valid");
  //     var c = await ref
  //         .read(globalAsyncQueueProvider.notifier)
  //         .run("rust_timetableSemid", () => rustTimetableSemid(client: client));
  //     ref.read(appStateProvider.notifier).updatestate(c);
  //     return c;
  //   }

  //   Future examSchedule(String selSemId) async {
  //     var k = await ref.read(userProvider.future);
  //     var client = await future;
  //    if (!k.isValid) throw Exception("user details are in valid");
  //     var c = await ref
  //         .read(globalAsyncQueueProvider.notifier)
  //         .run(
  //           "rust_examSchedule_$selSemId",
  //           () => rustExamShedule(client: client, semid: selSemId),
  //         );
  //     ref.read(appStateProvider.notifier).updatestate(c);
  //     return c;
  //   }

  //   Future marks(String selSemId) async {
  //     var k = await ref.read(userProvider.future);
  //     var client = await future;
  //     if (!k.isValid) throw Exception("user details are in valid");
  //     var c = await ref
  //         .read(globalAsyncQueueProvider.notifier)
  //         .run(
  //           "rust_marks_$selSemId",
  //           () => rustMarksList(client: client, semid: selSemId),
  //         );
  //     ref.read(appStateProvider.notifier).updatestate(c);
  //     return c;
  //   }
}
