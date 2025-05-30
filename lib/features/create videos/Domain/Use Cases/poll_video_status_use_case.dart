import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/create%20videos/Domain/Contract%20Repo/generate_video_contract_repo.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_video_status_entity.dart';

class PollVideoStatusUseCase {
  final GenerateVideoContractRepo repository;
  final Duration pollInterval;
  final Duration timeout;

  PollVideoStatusUseCase({
    required this.repository,
    this.pollInterval = const Duration(seconds: 2),
    this.timeout = const Duration(minutes: 1),
  });

  Future<Either<Failure, GenerateVideoStatusEntity>> execute(
    String jobId,
  ) async {
    final endTime = DateTime.now().add(timeout);

    while (DateTime.now().isBefore(endTime)) {
      final result = await repository.getGeneratedVideo(jobId);

      return result.fold((failure) => Left(failure), (statusEntity) async {
        if (statusEntity.status == 'completed') {
          return Right(statusEntity);
        }
        await Future.delayed(pollInterval);
        return await execute(jobId);
      });
    }

    throw TimeoutException('Video processing timed out');
  }
}
