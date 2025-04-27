import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vitapmate/constants.dart';
import 'package:vitapmate/providers/timetable.dart';

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
        if (data.semid.isEmpty || data.timetable.isEmpty) {
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
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: val.length,
            //shrinkWrap: true,
            itemBuilder: (context, index) {
              var k = val[index];
              bool freeslot = k[DBtimetable.serialrow] == "-1";
              bool islab = !k[DBtimetable.courseTyperow].endsWith("TH");
              return SingleChildScrollView(
                child:
                    freeslot
                        ? Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: AppColors.green, // Border color
                              width: 2.0, // Border width
                            ),
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ), // Border radius for rounded corners
                          ),

                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: AppColors.backgroundLight,
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Text(
                                        "Free Time",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18,
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
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                      ),
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
                              color:
                                  islab
                                      ? AppColors.secondary
                                      : AppColors.primary, // Border color
                              width: 2.0, // Border width
                            ),
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ), // Border radius for rounded corners
                          ),

                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      islab ? Icons.science : Icons.school,
                                      color: AppColors.backgroundLight,
                                    ),
                                    SizedBox(width: 5),
                                    Flexible(
                                      child: Text(
                                        '${k[DBtimetable.courseCoderow]}',
                                        maxLines: 2,
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.fade,

                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18,
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
                                        "Room no : ${k[DBtimetable.roomNorow]}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      " ${k[DBtimetable.blockrow]}",
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
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      k[DBtimetable.courseCoderow],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
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
                        print("refresh in tt");
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
