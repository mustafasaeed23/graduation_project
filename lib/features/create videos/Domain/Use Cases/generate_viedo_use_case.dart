import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/create%20videos/Data/Models/generate_video_reposne.dart';
import 'package:graduation_project/features/create%20videos/Domain/Contract%20Repo/generate_video_contract_repo.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_video_entity.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_video_status_entity.dart';

class GenerateViedoUseCase {
  final GenerateVideoContractRepo repo;
  GenerateViedoUseCase({required this.repo});
  Future<Either<Failure, GenerateVideoEntity>> call({
    required String generatedScript,
    required String title,
    required String language,
    required String accentOrDialect,
    required String type,
  }) async {
    return await repo.generateVideo(
      generatedScript: generatedScript,
      title: title,
      language: language,
      accentOrDialect: accentOrDialect,
      type: type,
    );
  }

  Future<Either<Failure, GenerateVideoStatusEntity>> getGeneratedVideo(
    String jobId,
  ) => repo.getGeneratedVideo(jobId);
}
