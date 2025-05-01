import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitapmate/providers/attendance.dart';
import 'package:vitapmate/providers/marks.dart';
import 'package:vitapmate/providers/schedule.dart';

class Attendance extends ConsumerWidget {
  const Attendance({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    updateatt() async {
      ref.read(attendanceProvider.notifier).updateAttendance();
    }

    ref.watch(attendanceProvider);
    printatt() async {
      var k = await ref.read(attendanceProvider.future);
      print(k);
    }

    updatemar() async {
      ref.read(marksProvider.notifier).completeUpdate();
    }

    printmar() async {
      var k = await ref.read(marksProvider.future);
      print(k);
    }

    updatesch() async {
      ref.read(scheduleProvider.notifier).completeUpdate();
    }

    printsch() async {
      var k = await ref.read(scheduleProvider.future);
      print(k);
    }

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(attendanceProvider.notifier).updateAttendance();
      },
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Text("attendance"),
            ElevatedButton(
              onPressed: updateatt,
              child: Text("Update attendance"),
            ),
            ElevatedButton(onPressed: printatt, child: Text("get att")),
            ElevatedButton(onPressed: printmar, child: Text("get marks")),
            ElevatedButton(onPressed: updatemar, child: Text("Update marks")),

            ElevatedButton(
              onPressed: updatesch,
              child: Text("Update schedule"),
            ),
            ElevatedButton(onPressed: printsch, child: Text("get schedule")),
          ],
        ),
      ),
    );
  }
}
