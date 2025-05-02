import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/providers/app_state.dart';
import 'package:vitapmate/providers/attendance.dart';
import 'package:vitapmate/router/route_names.dart';
import '../component/expnasion_cutsom_plane.dart';

class Attendance extends ConsumerStatefulWidget {
  const Attendance({super.key});

  @override
  ConsumerState<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends ConsumerState<Attendance> {
  late List<bool> _isopen = [];
  @override
  Widget build(BuildContext context) {
    var k = ref.watch(attendanceProvider);
    return k.when(
      data: (data) {
        if (data.attendance.isEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(attendanceProvider.notifier).completeUpdate();
              ref.read(appStateProvider.notifier).triggers();
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
        if (_isopen.isEmpty) {
          _isopen = List.generate(attendance.length, (index) => false);
        }
        return RefreshIndicator(
          onRefresh: () async {
            await ref.read(attendanceProvider.notifier).completeUpdate();
            ref.read(appStateProvider.notifier).triggers();
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
                    dividerColor: AppColors.textColor,
                    expansionCallback: (int i, bool isExpanded) {
                      setState(() {
                        _isopen = List.generate(
                          attendance.length,
                          (index) => false,
                        );
                        _isopen[i] = isExpanded;
                      });
                    },
                    children: [
                      for (final (i, item) in attendance.indexed)
                        ExpansionPanel(
                          canTapOnHeader: true,
                          splashColor: Colors.transparent,
                          backgroundColor: AppColors.backgroundDark,
                          headerBuilder: (context, isOpen) {
                            bool islab =
                                !(item[DBattendance.courseTypeRow]?.endsWith(
                                      "TH",
                                    ) ??
                                    true);
                            return InkWell(
                              splashColor: Colors.transparent,
                              onTap: () {
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
                                                  '${item[DBattendance.courseNameRow]?.split("-")[1]}',
                                                  maxLines: 1,
                                                  textAlign: TextAlign.start,
                                                  overflow:
                                                      TextOverflow.ellipsis,

                                                  style: TextStyle(
                                                    fontSize: 14,
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
                                                        "${item[DBattendance.courseNameRow]?.split("-")[0]}",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "${item[DBattendance.facultyDetailRow]}",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              progreess(
                                                item[DBattendance
                                                    .attendenceFatCatRow],
                                              ),
                                              Text(
                                                "BetweenExams",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ],
                                          ),

                                          Column(
                                            children: [
                                              progreess(
                                                item[DBattendance
                                                    .attendancePercentageRow],
                                              ),
                                              Text(
                                                "Total",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ],
                                          ),
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
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      item[DBattendance
                                                          .classesAttendedRow],
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
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      item[DBattendance
                                                          .totalClassesRow],
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
                          body: Text("body"),
                          isExpanded: _isopen[i],
                        ),
                    ],
                  ),
                  Text(
                    "Data updated on ${DateFormat('MMM dd, yyyy hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(int.parse(attendance[0][DBattendance.timeRow] ?? "0") * 1000))}",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error:
          (e, se) => Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Add your vtop details in ",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextSpan(
                    text: "settings",
                    style: TextStyle(color: AppColors.primary, fontSize: 20),
                    onEnter:
                        (event) => context.goNamed(RouteNames.credsRouteName),
                  ),
                ],
              ),
            ),
          ),
      loading: () {
        return Loadingsket();
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
    height: 65.0,
    child: Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 65,
          height: 65,
          child: CircularProgressIndicator(
            value: k,
            strokeWidth: 5,
            color: k >= 0.75 ? AppColors.green : AppColors.red,
          ),
        ),
        Text(
          (value ?? "-"),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
