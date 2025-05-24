import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/create%20videos/Data/Models/create_video_model.dart';
import 'package:graduation_project/features/create%20videos/Domain/Contract%20Repo/generate_video_contract_repo.dart';

class GenerateViedoUseCase {
  final GenerateVideoContractRepo repo;
  GenerateViedoUseCase({required this.repo});
  Future<Either<Failure, VideoDataModel>> call({
    required String promot,
    required String language,
    required String accentOrDialect,
    required String type,
  }) async {
    return await repo.generateVideo(
      promot: promot,
      language: language,
      accentOrDialect: accentOrDialect,
      type: type,
    );
  }
}
