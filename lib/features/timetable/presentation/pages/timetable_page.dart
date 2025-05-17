import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vitapmate/core/constants/constants.dart';
import 'package:intl/intl.dart';
import 'package:vitapmate/core/router/route_names.dart';
import 'package:vitapmate/core/shared/exceptions/custom_exceptions.dart';
import 'package:vitapmate/features/timetable/domain/entities/sub_timetable_entity.dart';
import 'package:vitapmate/features/timetable/presentation/providers/timetable.dart';

class TimetablePage extends StatelessWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Timetable();
  }
}

final key = GlobalKey();

class Timetable extends ConsumerStatefulWidget {
  const Timetable({super.key});

  @override
  ConsumerState<Timetable> createState() => _TimetableState();
}

class _TimetableState extends ConsumerState<Timetable>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  void _showSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(behavior: SnackBarBehavior.floating, content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    var timetable = ref.watch(timetableProvider);

    return timetable.when(
      data: (data) {
        if (data.timetable.isEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(timetableProvider.notifier).updateTimetable();
              //ref.read(app.notifier).triggers();
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

        var pdayslist = [];
        for (var i in data.timetable) {
          if (!pdayslist.contains(i.day)) {
            pdayslist.add(i.day);
          }
        }
        var dayslist = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];
        var days = [
          for (var i in dayslist)
            if (pdayslist.contains(i)) i,
        ];

        if (_tabController.length != days.length) {
          DateTime now = DateTime.now();
          int currentWeekday = now.weekday - 1;
          int index = 0;
          if (days.contains(dayslist[currentWeekday])) {
            index = days.indexOf(dayslist[currentWeekday]);
          }

          _tabController = TabController(
            length: days.length,
            vsync: this,
            initialIndex: index,
          );
        }
        Map<String, List<SubTimeTableEntity>> daycourse = {};
        for (var i in data.timetable) {
          if (!daycourse.containsKey(i.day)) {
            daycourse[i.day] = [i];
          } else {
            daycourse[i.day]?.add(i);
          }
        }

        var tabbarview = [for (var i in days) addFreeSlots(daycourse[i] ?? [])];
        Widget tabview(List<SubTimeTableEntity> val) {
          val.add(
            SubTimeTableEntity(
              serial: "-2",
              day: "-",
              slot: "-",
              courseCode: "-",
              courseType: "-",
              roomNo: "-",
              block: "-",
              startTime: "-",
              endTime: "-",
              name: "-",
              semid: "-",
              updateTime: 0,
            ),
          );
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: val.length,

            itemBuilder: (context, index) {
              var k = val[index];
              if (index == val.length - 1) {
                return Text(
                  "Data updated on ${DateFormat('MMM dd, yyyy hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(val[index - 1].updateTime * 1000))}",
                  textAlign: TextAlign.center,
                );
              }
              bool freeslot = k.serial == "-1";
              bool islab = !k.courseType.endsWith("TH");
              return freeslot
                  ? Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2.0, color: AppColors.textColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 0,
                    color: AppColors.backgroundDark,

                    // color: AppColors.green.withValues(alpha: 0.2,),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.timelapse, color: AppColors.green),
                              SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  "Free Time",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                int.parse(k.slot) == 1
                                    ? "1 Slot"
                                    : "${k.slot} Slots",

                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(height: 2),
                          Row(
                            children: [
                              Text(
                                "${to12H(val[index - 1].endTime)} - ${to12H(val[index + 1].startTime)} ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(height: 2),
                        ],
                      ),
                    ),
                  )
                  : Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.textColor, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 0,
                    color: AppColors.backgroundDark,

                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                child: Text(
                                  k.name,
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.grey.shade400,
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
                                  "${k.block.replaceFirst("ALL", "")} - ${k.roomNo}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Text(
                                " ${k.slot}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "${to12H(k.startTime)} - ${to12H(k.endTime)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Text(
                                k.courseCode,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
            },
          );
        }

        return Column(
          children: [
            TabBar(
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              tabs: [
                for (var i in days)
                  Text(
                    i,
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
              ],
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  for (var val in tabbarview)
                    RefreshIndicator(
                      onRefresh: () async {
                        try {
                          await ref
                              .read(timetableProvider.notifier)
                              .updateTimetable();
                        } on NoNetworkExpection catch (e) {
                          log("$e", level: 800);
                          
                          _showSnackBar(
                            "Oops! No internet right now. Give it another try when you're back online.",
                          );
                        } on VtopErrorExpection catch (e) {
                          log("$e", level: 800);
                         
                          _showSnackBar(
                            "Oops! It looks like Vtop is down right now.",
                          );
                        } catch (e) {
                          log("$e", level: 900);
                          _showSnackBar("$e");
                        }
                        //ref.read(appStateProvider.notifier).triggers();
                      },
                      child: tabview(val),
                    ),
                ],
              ),
            ),
          ],
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

String to12H(String time) {
  var list = time.split(":");
  int hours = int.parse(list[0]);
  if (hours > 12) {
    hours -= 12;
    list.add("PM");
  } else if (hours == 12) {
    list.add("PM");
  } else {
    list.add("AM");
  }
  return "$hours:${list[1]} ${list[2]} ";
}

List<SubTimeTableEntity> addFreeSlots(List<SubTimeTableEntity> t) {
  List<SubTimeTableEntity> r = [];

  for (int i = 0; i < t.length - 1; i++) {
    r.add(t[i]);
    final cClass = t[i].endTime;
    final nClass = t[i + 1].startTime;
    int diff = getdiff(cClass, nClass);
    int mod = (diff / 60).toInt();
    if (mod > 0) {
      r.add(
        SubTimeTableEntity(
          serial: "-1",
          day: "-",
          slot: "$mod",
          courseCode: "-",
          courseType: "-",
          roomNo: "-",
          block: "-",
          startTime: "-",
          endTime: "-",
          name: "-",
          semid: "-",
          updateTime: 0,
        ),
      );
    }
  }
  r.add(t[t.length - 1]);
  return r;
}

getdiff(a, b) {
  var first = a.split(":");
  var second = b.split(":");
  return (int.parse(second[0]) * 60 + int.parse(second[1])) -
      (int.parse(first[0]) * 60 + int.parse(first[1]));
}
