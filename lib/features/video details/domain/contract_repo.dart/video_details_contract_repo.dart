import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/dashboard/Domain/entities/videos_entity.dart';

abstract class VideoDetailsContractRepo {
  Future<Either<Failure, VideosEntity>> renameVideoTitle({
    required String newTitle,
    required String videoId,
  });
}
