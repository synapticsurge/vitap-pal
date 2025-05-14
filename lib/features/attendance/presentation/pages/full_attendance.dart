import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitapmate/core/constants/constants.dart';
import 'package:vitapmate/features/attendance/presentation/pages/attendance_page.dart';
import 'package:vitapmate/features/attendance/presentation/providers/full_attendance.dart';

class FullAttendance extends ConsumerStatefulWidget {
  final String courseId;
  final String courseType;
  final bool exp;
  const FullAttendance({
    super.key,
    required this.courseId,
    required this.courseType,
    required this.exp,
  });

  @override
  ConsumerState<FullAttendance> createState() => _FullAttendanceState();
}

class _FullAttendanceState extends ConsumerState<FullAttendance> {
  @override
  Widget build(BuildContext context) {
     if (!widget.exp) {
          return Loadingsket();
        }
    var c = ref.watch(
      FullAttendanceProvider(widget.courseType, widget.courseId),
    );
    return c.when(
      data: (p) {
        var data = p.attendance;
       

        if (data.isEmpty) {
          return SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            child: Loadingsket(),
          );
        }

        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: double.infinity,
            minWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height / 3,
          ),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DataTable(
                  decoration: BoxDecoration(),
                  dividerThickness: 0,
                  border: TableBorder.all(
                    color: AppColors.textColor,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),

                  columns: [
                    DataColumn(label: Text("")),
                    DataColumn(label: Text("Date")),
                    DataColumn(label: Text("Status")),
                    DataColumn(label: Text("Time")),
                    DataColumn(label: Text("Slot")),
                    DataColumn(label: Text("Remark")),
                  ],
                  rows: [
                    for (var i in data)
                      DataRow(
                        cells: [
                          DataCell(Text(i.serial)),
                          DataCell(Text(i.date)),
                          DataCell(Text(i.status)),
                          DataCell(Text(i.dayTime)),
                          DataCell(Text(i.slot)),
                          DataCell(Text(i.remark)),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      error: (e, se) => Text("$e"),
      loading:
          () => SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            child: Loadingsket(),
          ),
    );
  }
}
