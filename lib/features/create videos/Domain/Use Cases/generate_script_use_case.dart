import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/create%20videos/Domain/Contract%20Repo/generate_video_contract_repo.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_script_entity.dart';

class GenerateScriptUseCase {
  final GenerateVideoContractRepo generateVideoContractRepo;

  GenerateScriptUseCase({required this.generateVideoContractRepo});

  Future<Either<Failure, GenerateScriptEntity>> call({
    required String userPromot,
    required String language,
    required String accentOrDialect,
    required String type,
  }) async => await generateVideoContractRepo.generateScript(
    userPromot: userPromot,
    language: language,
    accentOrDialect: accentOrDialect,
    type: type,
  );
}
