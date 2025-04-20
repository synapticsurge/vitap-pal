import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vitapmate/providers/timetable.p.dart';

class Timetable extends ConsumerStatefulWidget {
  const Timetable({super.key});

  @override
  ConsumerState<Timetable> createState() => _TimetableState();
}

class _TimetableState extends ConsumerState<Timetable> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final timetable = ref.watch(timetableProvider);
    

    return timetable.when(
      data: (d) {
        try {
          final dropdownItems =
              d.semids!.map((item) {
                final parts = item.split(":");
                return DropdownMenuEntry<String>(
                  value: parts[1],
                  label: parts[0],
                );
              }).toList();

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Select Semester", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                DropdownMenu<String>(
                  initialSelection: selectedValue,
                  dropdownMenuEntries: dropdownItems,
                  onSelected: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
                const SizedBox(height: 24),
                Text("Selected: ${selectedValue ?? 'None'}"),
              ],
            ),
          );
        } catch (e) {
          return Text("Failed: $e");
        }
      },
      error: (e, se) => Text("Error: $e"),
      loading:
          () => Skeletonizer(
            enabled: true,
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                return const ListTile(
                  title: Text("Feature Title"),
                  subtitle: Text("Loading description..."),
                  trailing: Icon(Icons.circle),
                );
              },
            ),
          ),
    );
  }
}
