import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/dashboard/Domain/contract%20repo/dashboard_contract_repo.dart';
import 'package:graduation_project/features/dashboard/Domain/entities/videos_entity.dart';

class GetAllVideosUseCase {
  final DashboardContractRepo dashboardContractRepo;
  GetAllVideosUseCase({required this.dashboardContractRepo});

  Future<Either<Failure, List<VideosEntity>>> call() async {
    return await dashboardContractRepo.getAllVideos();
  }
}
