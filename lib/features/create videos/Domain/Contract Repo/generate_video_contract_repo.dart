import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/create%20videos/Data/Models/create_video_model.dart';

abstract class GenerateVideoContractRepo {
  Future<Either<Failure, VideoDataModel>> generateVideo({
    required String promot,
    required String language,
    required String accentOrDialect,
    required String type,
  });
}
