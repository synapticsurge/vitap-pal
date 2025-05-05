import 'package:vitapmate/features/settings/business/entities/semid_entity.dart';
import 'package:vitapmate/features/settings/business/repository/semid_repository.dart';
import 'package:vitapmate/features/settings/business/usecase/usecase.dart';

class GetSemidsUsecase implements Usecase<SemidEntity, void> {
  final SemidRepository _semidRepository;
  GetSemidsUsecase(this._semidRepository);
  @override
  Future<SemidEntity> call({void params}) {
    return _semidRepository;
  }
}
