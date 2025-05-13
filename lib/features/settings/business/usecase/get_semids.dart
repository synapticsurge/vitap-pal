import 'package:vitapmate/core/utils/usecase.dart';
import 'package:vitapmate/features/settings/business/entities/semid_entity.dart';
import 'package:vitapmate/features/settings/business/repository/semid_repository.dart';

class GetSemidsUsecase implements Usecase<SemidEntity, void> {
  final SemidRepository _semidRepository;
  GetSemidsUsecase(this._semidRepository);
  @override
  Future<SemidEntity> call({void params}) async {
    return await _semidRepository.getSemidsFromStorage();
  }
}
