import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/dashboard/Domain/entities/user_data_entity.dart';

abstract class DashboardContractRepo {
  Future<Either<Failure, UserDataEntity>> getDashboardInformation();
}
