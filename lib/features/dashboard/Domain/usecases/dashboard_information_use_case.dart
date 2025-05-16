import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/dashboard/Domain/contract%20repo/dashboard_contract_repo.dart';
import 'package:graduation_project/features/dashboard/Domain/entities/user_data_entity.dart';

class DashboardInformationUseCase {
  final DashboardContractRepo dashboardContractRepo;

  DashboardInformationUseCase({required this.dashboardContractRepo});

  Future<Either<Failure, UserDataEntity>> call() async {
    return await dashboardContractRepo.getDashboardInformation();
  }
}
