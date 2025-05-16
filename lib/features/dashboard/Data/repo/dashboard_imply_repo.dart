import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/exceptions.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/dashboard/Data/Data%20Source/dashboard_data_source.dart';
import 'package:graduation_project/features/dashboard/Domain/contract%20repo/dashboard_contract_repo.dart';
import 'package:graduation_project/features/dashboard/Domain/entities/user_data_entity.dart';

class DashboardImplyRepo implements DashboardContractRepo {
  final DashboardDataSource dashboardDataSource;

  DashboardImplyRepo({required this.dashboardDataSource});
  @override
  Future<Either<Failure, UserDataEntity>>
  getDashboardInformation() async {
    try {
      final result = await dashboardDataSource.getDashboardInformation();
      return Right(result);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.message));
    } catch (e) {
      return const Left(
        ServerFailure(message: "Something went wrong, please try again later"),
      );
    }
  }
}
