import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vitapmate/core/constants/constants.dart';

import 'package:vitapmate/core/shared/exceptions/custom_exceptions.dart';
import 'package:vitapmate/features/attendance/presentation/pages/full_attendance.dart';
import 'package:vitapmate/features/attendance/presentation/providers/attendance.dart';
import 'package:vitapmate/features/attendance/presentation/widgets/expnasion_cutsom_plane.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Attendance();
  }
}

class Attendance extends ConsumerStatefulWidget {
  const Attendance({super.key});

  @override
  ConsumerState<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends ConsumerState<Attendance> {
  late List<bool> _isopen = [];
  void _showSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(behavior: SnackBarBehavior.floating, content: Text(message)),
    );
  }

  Widget _showerror(String msg) {
    return RefreshIndicator(
      onRefresh: () async {
        await _reload();
      },
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height-200,
          child: 
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: msg,
                      style: TextStyle(color: AppColors.primary, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          
        ),
      ),
    );
  }

  Future<void> _reload() async {
    try {
      await ref.read(attendanceProvider.notifier).updateAttendance();
    } on NoNetworkExpection catch (e) {
      log("$e", level: 800);

      _showSnackBar(
        "Oops! No internet right now. Give it another try when you're back online.",
      );
    } on VtopErrorExpection catch (e) {
      log("$e", level: 800);

      _showSnackBar("Oops! It looks like Vtop is down right now.");
    } catch (e) {
      log("$e", level: 900);
      _showSnackBar("$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    var k = ref.watch(attendanceProvider);
    log("build page in att ", level: 800);
    return k.when(
      data: (data) {
        if (data.attendance.isEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              await _reload();
              //ref.read(appStateProvider.notifier);
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 200,
                child: Center(
                  child: Text(
                    "Hmm, it looks like there's no data to display right now. This could be due to a slow internet connection or a temporary issue with the connection. Please try reloading the page.",
                  ),
                ),
              ),
            ),
          );
        }
        var attendance = data.attendance;
        if (_isopen.isEmpty || _isopen.length != attendance.length) {
          _isopen = List.generate(attendance.length, (index) => false);
        }
        return RefreshIndicator(
          onRefresh: () async {
            try {
              await ref.read(attendanceProvider.notifier).updateAttendance();
            } on NoNetworkExpection catch (e) {
              log("$e", level: 800);

              _showSnackBar(
                "Oops! No internet right now. Give it another try when you're back online.",
              );
            } on VtopErrorExpection catch (e) {
              log("$e", level: 800);

              _showSnackBar("Oops! It looks like Vtop is down right now.");
            } catch (e) {
              log("$e", level: 900);
              _showSnackBar("$e");
            }
            // ref.read(appStateProvider.notifier).triggers();
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 200,
              ),
              child: Column(
                children: [
                  AppExpansionPanelList(
                    dividerColor: Colors.transparent,
                    expansionCallback: (int i, bool isExpanded) {},
                    children: [
                      for (final (i, item) in attendance.indexed)
                        ExpansionPanel(
                          canTapOnHeader: true,
                          splashColor: Colors.transparent,
                          backgroundColor: AppColors.backgroundDark,
                          headerBuilder: (context, isOpen) {
                            bool islab = !item.courseType.endsWith("TH");
                            return InkWell(
                              splashColor: Colors.transparent,
                              onTap: () async {
                                bool temp = _isopen[i];
                                setState(() {
                                  _isopen = List.generate(
                                    attendance.length,
                                    (index) => false,
                                  );
                                  _isopen[i] = !temp;
                                });
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2.0,
                                    color: AppColors.textColor,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 0,
                                color: AppColors.backgroundDark,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            islab
                                                ? Icons.science
                                                : Icons.account_balance_rounded,
                                            color:
                                                islab
                                                    ? AppColors.secondary
                                                    : AppColors.primary,
                                          ),

                                          SizedBox(width: 5),
                                          Flexible(
                                            child: Column(
                                              children: [
                                                Text(
                                                  item.courseName.split("-")[1],
                                                  maxLines: 1,
                                                  textAlign: TextAlign.start,
                                                  overflow:
                                                      TextOverflow.ellipsis,

                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w800,
                                                    color: Colors.grey.shade400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 6),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                    text:
                                                        item.courseName.split(
                                                          "-",
                                                        )[0],

                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  item.facultyDetail,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              progreess(item.attendenceFatCat),
                                              Text(
                                                "BetweenExams",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ],
                                          ),

                                          Column(
                                            children: [
                                              progreess(
                                                item.attendancePercentage,
                                              ),
                                              Text(
                                                "Total",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 2),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "Attended Classes  ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: item.classesAttended,
                                                  style: TextStyle(
                                                    color: AppColors.primary,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "Total Classes  ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: item.totalClasses,
                                                  style: TextStyle(
                                                    color: AppColors.primary,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          // body: Text("Table data "),
                          body: FullAttendance(
                            courseId: item.courseId,
                            courseType: item.courseType,
                            exp: _isopen[i],
                          ),
                          isExpanded: _isopen[i],
                        ),
                    ],
                  ),
                  Text(
                    "Data updated on ${DateFormat('MMM dd, yyyy hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(attendance[0].updateTime * 1000))}",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (e, se) {
        if (e is NoNetworkExpection) {
          return _showerror("No internet connection to fetch data");
        } else if (e is VtopErrorExpection) {
          return _showerror("No internet connection to fetch data");
        } else {
          return _showerror("$e");
        }
      },
      loading: () {
        return Loadingsketpage();
      },
    );
  }
}

Widget progreess(String? value) {
  getPre(String? val) {
    try {
      if (val == null) {
        return 0.0;
      }
      val = val.replaceAll("%", "");
      return double.parse(val) / 100;
    } catch (e) {
      return 0.0;
    }
  }

  double k = getPre(value);

  return SizedBox(
    height: 55.0,
    child: Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 55,
          height: 55,
          child: CircularProgressIndicator(
            value: k,
            strokeWidth: 5,
            color: k >= 0.75 ? AppColors.green : AppColors.red,
          ),
        ),
        Text(
          (value ?? "-"),
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

class Loadingsket extends StatelessWidget {
  const Loadingsket({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
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
                DataColumn(label: Text("slot")),
              ],
              rows: [
                for (var _ in [0, 1, 2, 3, 4])
                  DataRow(
                    cells: [
                      DataCell(Text("1")),
                      DataCell(Text("10-67-7")),
                      DataCell(Text("present")),
                      DataCell(Text("a18898")),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Loadingsketpage extends StatelessWidget {
  const Loadingsketpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          if (index == 2 || index == 5) {
            return const Card(
              shape: RoundedRectangleBorder(side: BorderSide(width: 2.0)),
              elevation: 0,
              color: AppColors.backgroundDark,

              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.timelapse),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "Free Time",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "2 Slots",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          "aaaaaaaaaaaaa",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 2),
                  ],
                ),
              ),
            );
          } else {
            return const Card(
              shape: RoundedRectangleBorder(side: BorderSide(width: 2.0)),
              elevation: 0,
              color: AppColors.backgroundDark,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.account_balance_rounded),

                        SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            'aaaaaaaaaaaaaaaaaaaaa ',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,

                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "aaaaaaa",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Text(
                          "aaaa",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "aaaaaaaaaaa",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text(
                          "aaaaaaa",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
