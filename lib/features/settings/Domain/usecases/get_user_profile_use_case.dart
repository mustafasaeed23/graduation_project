import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/settings/Domain/entites/user_profile_entity.dart';
import 'package:graduation_project/features/settings/Domain/repositories/profile_contract_repo.dart';

class GetUserProfileUseCase {
  final ProfileContractRepo profileContractRepo;

  GetUserProfileUseCase({required this.profileContractRepo});

  Future<Either<Failure, UserProfileEntity>> call() async {
    return await profileContractRepo.getUserProfile();
  }
}
