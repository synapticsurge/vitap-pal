import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitapmate/core/shared/user/presentation/providers/user.dart';
import 'package:vitapmate/features/attendance/data/repository/attendance_repository_impl.dart';
import 'package:vitapmate/features/attendance/domain/repository/attendance_repository.dart';
import 'package:vitapmate/features/attendance/presentation/providers/state/data_source.dart';
part 'attendance_repository.g.dart';

@riverpod
Future<AttendanceRepository> attendanceRepository(Ref ref) async {
  return AttendanceRepositoryImpl(
    semid: await ref.watch(userProvider.selectAsync((val) => val.semid!)),
    remoteDataSource: await ref.read(attendanceRemoteDataSourceProvider.future),
    localDataSource: await ref.read(attendanceLocalDataSourceProvider.future),
  );
}
