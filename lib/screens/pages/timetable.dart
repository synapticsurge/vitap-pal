import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/providers/app_state.dart';
import 'package:vitapmate/providers/timetable.dart';
import 'package:intl/intl.dart';
import 'package:vitapmate/router/route_names.dart';

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

  @override
  Widget build(BuildContext context) {
    var timetable = ref.watch(timetableProvider);

    return timetable.when(
      data: (data) {
        if (data.timetable.isEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(timetableProvider.notifier).completeUpdate();
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
        var pdayslist = [for (var i in data.uniquedays) i[DBtimetable.dayrow]];
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
        Map<String, List<dynamic>> daycourse = {};
        for (var i in data.timetable) {
          if (!daycourse.containsKey(i[DBtimetable.dayrow])) {
            daycourse[i[DBtimetable.dayrow]!] = [i];
          } else {
            daycourse[i[DBtimetable.dayrow]]?.add(i);
          }
        }

        var tabbarview = [for (var i in days) addFreeSlots(daycourse[i] ?? [])];
        Widget tabview(List val) {
          val.add({DBtimetable.serialrow: "-2"});
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: val.length,

            itemBuilder: (context, index) {
              var k = val[index];
              if (index == val.length - 1) {
                return Text(
                  "Data updated on ${DateFormat('MMM dd, yyyy hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(int.parse(val[index - 1][DBtimetable.timeRow]) * 1000))}",
                  textAlign: TextAlign.center,
                );
              }
              bool freeslot = k[DBtimetable.serialrow] == "-1";
              bool islab = !k[DBtimetable.courseTyperow].endsWith("TH");
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
                                int.parse(k[DBtimetable.slotrow]) == 1
                                    ? "1 Slot"
                                    : "${k[DBtimetable.slotrow]} Slots",
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
                                "${to12H(val[index - 1][DBtimetable.endTimerow])} - ${to12H(val[index + 1][DBtimetable.startTimerow])} ",
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
                                  '${k[DBtimetable.courseName]}',
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
                                  "${k[DBtimetable.blockrow].replaceFirst("ALL", "")} - ${k[DBtimetable.roomNorow]}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Text(
                                " ${k[DBtimetable.slotrow]}",
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
                                  "${to12H(k[DBtimetable.startTimerow])} - ${to12H(k[DBtimetable.endTimerow])}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Text(
                                k[DBtimetable.courseCoderow],
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
                        await ref
                            .read(timetableProvider.notifier)
                            .completeUpdate();
                        ref.read(appStateProvider.notifier).triggers();
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

List addFreeSlots(List t) {
  List r = [];

  for (int i = 0; i < t.length - 1; i++) {
    r.add(t[i]);
    final cClass = t[i][DBtimetable.endTimerow];
    final nClass = t[i + 1][DBtimetable.startTimerow];
    int diff = getdiff(cClass, nClass);
    int mod = (diff / 60).toInt();
    if (mod > 0) {
      var map = {
        DBtimetable.serialrow: "-1",
        DBtimetable.dayrow: "-",
        DBtimetable.slotrow: "$mod",
        DBtimetable.courseCoderow: "-",
        DBtimetable.courseTyperow: "-",
        DBtimetable.roomNorow: "-",
        DBtimetable.blockrow: "-",
        DBtimetable.startTimerow: "-",
        DBtimetable.endTimerow: "-",
        DBtimetable.semIdrow: "-",
      };
      r.add(map);
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
