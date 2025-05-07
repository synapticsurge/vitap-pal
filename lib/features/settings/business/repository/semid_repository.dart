
import 'package:vitapmate/features/settings/business/entities/semid_entity.dart';

abstract class SemidRepository {
  Future<SemidEntity> getSemidsFromStorage();
  Future<SemidEntity> updateSemids();
}
