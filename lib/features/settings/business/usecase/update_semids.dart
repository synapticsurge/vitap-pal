import 'package:vitapmate/core/utils/usecase.dart';
import 'package:vitapmate/features/settings/business/entities/semid_entity.dart';
import 'package:vitapmate/features/settings/business/repository/semid_repository.dart';

class UpdateSemids extends Usecase<void, void> {
 final SemidRepository _semidRepository;
  UpdateSemids(this._semidRepository);
  @override
  Future<SemidEntity> call({void params}) async {
    return await _semidRepository.updateSemids();
  }
}
