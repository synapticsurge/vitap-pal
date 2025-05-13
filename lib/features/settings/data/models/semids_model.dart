import 'package:vitapmate/core/shared/database/appdatabase.dart';
import 'package:vitapmate/features/settings/business/entities/semid_entity.dart';
import 'package:vitapmate/features/settings/business/entities/sub_semid_entities.dart';

class SemidsModel {
  static fromLocalToEntity(List<SemTableData> data) {
    List<SubSemidEntities> semids = [];
    for (var i in data) {
      semids.add(SubSemidEntities(semName: i.semName, semid: i.semid));
    }
    return SemidEntity(semids: semids);
  }

  static fromRemoteToEntity(List<String> data) {
    List<SubSemidEntities> semids = [];
    for (var i in data) {
      semids.add(
        SubSemidEntities(semName: i.split(":")[0], semid: i.split(":")[1]),
      );
    }
    return SemidEntity(semids: semids);
  }
}
