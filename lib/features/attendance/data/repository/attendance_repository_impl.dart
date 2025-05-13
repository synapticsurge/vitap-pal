import 'package:vitapmate/features/attendance/data/datasource/local_data_source.dart';
import 'package:vitapmate/features/attendance/data/datasource/remote_data_source.dart';
import 'package:vitapmate/features/attendance/domain/entities/full_attendance_entity.dart';
import 'package:vitapmate/features/attendance/domain/repository/attendance_repository.dart';

class AttendanceRepositoryImpl extends AttendanceRepository {
    LocalDataSource localDataSource;
    RemoteDataSource remoteDataSource;
    String semid;
    AttendanceRepositoryImpl({
    required this.semid,
    required this.remoteDataSource,
    required this.localDataSource,
  });
  
  @override
  Future<FullAttendanceEntity> getAttendanceFromStorage() {
    // TODO: implement getAttendanceFromStorage
    throw UnimplementedError();
  }
  
  @override
  Future<void> saveAttendanceToStoarge(FullAttendanceEntity fullattendanceEntity) {
    // TODO: implement saveAttendanceToStoarge
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateFullAttendance() {
    // TODO: implement updateFullAttendance
    throw UnimplementedError();
  }

 
}
