import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitapmate/models/client.dart';
import 'package:vitapmate/models/timtable.dart';
import 'package:vitapmate/pages/timetable.dart';
import 'package:vitapmate/providers/client.p.dart';

class TimetableNotifer extends AsyncNotifier<TimetableList> {
  @override
  FutureOr<TimetableList> build() async {
    Client client = await ref.read(clinetProvider.future);
    var k = TimetableList(client.iclient);
    await k.fetchsemid();
    k.fetchFromVtop();
    return k;
  }
}

final timetableProvider =
    AsyncNotifierProvider<TimetableNotifer, TimetableList>(() {
      return TimetableNotifer();
    });
