import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitapmate/providers/timetable.dart';

class Timetable extends ConsumerStatefulWidget {
  const Timetable({super.key});

  @override
  ConsumerState<Timetable> createState() => _TimetableState();
}

class _TimetableState extends ConsumerState<Timetable> {
  _fetchsemid() async {
    ref.read(timetableProvider.notifier).updateSemids();
  }

  _getfromstorage() async {
    ref.read(timetableProvider.notifier).getSemidsfromstorage();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: _fetchsemid, child: Text("run semid vtop ")),
        ElevatedButton(
          onPressed: _getfromstorage,
          child: Text("get from staorage"),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(timetableProvider.notifier).updateTimetable();
          },
          child: Text("run from vtop"),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(timetableProvider.notifier).getTimetablefromstorage();
          },
          child: Text("get from timetable from storage"),
        ),
      ],
    );
  }
}
