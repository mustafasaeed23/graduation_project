import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/create%20videos/Domain/Contract%20Repo/generate_video_contract_repo.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_video_status_entity.dart';

class PollVideoStatusUseCase {
  final GenerateVideoContractRepo repository;

  PollVideoStatusUseCase({required this.repository});

  Future<Either<Failure, GenerateVideoStatusEntity>> call(
    String jobId, {
    int maxAttempts = 15,
    Duration delay = const Duration(seconds: 2),
  }) async {
    for (int attempt = 0; attempt < maxAttempts; attempt++) {
      final result = await repository.getGeneratedVideo(jobId);

      if (result.isRight()) {
        final statusEntity = (result as Right).value;
        if (statusEntity.status == 'completed') {
          return Right(statusEntity); // ✅ FIXED
        }
      }

      await Future.delayed(delay);
    }

    return Left(TimeoutFailure());
  }
}
