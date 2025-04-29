import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/providers/timetable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

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
          return Loadingsket();
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
                      side: BorderSide(width: 2.0),

                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 0,
                    color: AppColors.green.withValues(alpha: 0.2),

                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/freetime.svg',
                                height: 22,
                                width: 22,
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  "Free Time",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                    color: AppColors.green.withValues(
                                      alpha: 0.8,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                int.parse(k[DBtimetable.slotrow]) == 1
                                    ? "1 Slot"
                                    : "${k[DBtimetable.slotrow]} Slots",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2),
                          Row(
                            children: [
                              Text(
                                "${to12H(val[index - 1][DBtimetable.endTimerow])} - ${to12H(val[index + 1][DBtimetable.startTimerow])} ",
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          SizedBox(height: 2),
                        ],
                      ),
                    ),
                  )
                  : Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        //color: islab?AppColors.stext : AppColors.ptext,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 0,
                    color:
                        islab
                            ? AppColors.secondary.withValues(alpha: 0.3)
                            : AppColors.primary.withValues(alpha: 0.3),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              islab
                                  ? SvgPicture.asset(
                                    'assets/icons/lab.svg',
                                    height: 25,
                                    width: 25,
                                  )
                                  : SvgPicture.asset(
                                    'assets/icons/theory.svg',
                                    height: 22,
                                    width: 22,
                                  ),

                              SizedBox(width: 5),
                              Flexible(
                                child: Text(
                                  '${k[DBtimetable.courseName]}',
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,

                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                    color:
                                        islab
                                            ? AppColors.secondary
                                            : AppColors.primary.withValues(
                                              blue: 4,
                                            ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "${k[DBtimetable.blockrow]} - ${k[DBtimetable.roomNorow]}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Text(
                                " ${k[DBtimetable.slotrow]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "${to12H(k[DBtimetable.startTimerow])} - ${to12H(k[DBtimetable.endTimerow])}",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                              Text(
                                k[DBtimetable.courseCoderow],
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                      },
                      child: tabview(val),
                    ),
                ],
              ),
            ),
          ],
        );
      },
      error: (e, se) => Text("some thing went worng $e"),
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
          return const ListTile(
            title: Text("Feature Title"),
            subtitle: Text("Loading description..."),
            trailing: Icon(Icons.circle),
          );
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
