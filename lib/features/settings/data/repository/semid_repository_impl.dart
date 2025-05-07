import 'package:vitapmate/features/settings/business/entities/semid_entity.dart';
import 'package:vitapmate/features/settings/business/repository/semid_repository.dart';
import 'package:vitapmate/features/settings/data/datasource/local_data_source.dart';
import 'package:vitapmate/features/settings/data/datasource/remote_data_source.dart';

class SemidRepositoryImpl extends SemidRepository {
  final LocalDataSource _localDatasource;
  final RemoteDataSource _remoteDataSource;
  SemidRepositoryImpl(this._localDatasource, this._remoteDataSource);

  @override
  Future<SemidEntity> getSemidsFromStorage() async {
    return await _localDatasource.getSemidsFromStorage();
  }

  @override
  Future<SemidEntity> updateSemids() async {
    SemidEntity data = await _remoteDataSource.fetchSemids();
    await _localDatasource.saveSemidsToStorage(data);
    return data;
  }
}
