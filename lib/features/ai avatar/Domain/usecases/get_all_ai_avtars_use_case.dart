import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/ai%20avatar/Domain/entities/ai_avtar_person_entity.dart';
import 'package:graduation_project/features/ai%20avatar/Domain/repositories/ai_avatar_contract_repo.dart';
import 'package:graduation_project/features/dashboard/Domain/usecases/get_all_videos_use_case.dart';

class GetAllAiAvtarsUseCase {
  final AiAvatarContractRepo aiAvatarContractRepo;

  GetAllAiAvtarsUseCase({required this.aiAvatarContractRepo});

  Future<Either<Failure, List<AiAvtarPersonEntity>>> call() async {
    return await aiAvatarContractRepo.getAllAiAvtars();
  }
}
