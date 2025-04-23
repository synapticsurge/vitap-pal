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
    ref.read(timetableProvider.notifier).getfromstorage();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _fetchsemid,
          child: Text("run semid fetching "),
        ),
        ElevatedButton(
          onPressed: _getfromstorage,
          child: Text("get from staorage"),
        ),
      ],
    );
  }
}
