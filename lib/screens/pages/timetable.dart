import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Timetable extends ConsumerStatefulWidget {
  const Timetable({super.key});

  @override
  ConsumerState<Timetable> createState() => _TimetableState();
}

class _TimetableState extends ConsumerState<Timetable> {
@override
  Widget build(BuildContext context) {
    return const Text("timetable");
  }
}
