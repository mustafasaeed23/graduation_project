import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/dashboard/Domain/entities/videos_entity.dart';
import 'package:graduation_project/features/video%20details/domain/contract_repo.dart/video_details_contract_repo.dart';

class VideoDetailsUseCase {
  final VideoDetailsContractRepo videoDetailsContractRepo;

  VideoDetailsUseCase({required this.videoDetailsContractRepo});

  Future<Either<Failure, VideosEntity>> renameVideoTitle({
    required String newTitle,
    required String videoId,
  }) async {
    return await videoDetailsContractRepo.renameVideoTitle(
      newTitle: newTitle,
      videoId: videoId,
    );
  }
}
