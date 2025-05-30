import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/create%20videos/Data/Models/generate_video_reposne.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_script_entity.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_video_entity.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_video_status_entity.dart';

abstract class GenerateVideoContractRepo {
  Future<Either<Failure, GenerateScriptEntity>> generateScript({
    required String userPromot,
    required String language,
    required String accentOrDialect,
    required String type,
  });
  Future<Either<Failure, GenerateVideoEntity>> generateVideo({
    required String title,
    required String generatedScript,
    required String language,
    required String accentOrDialect,
    required String type,
  });

  Future<Either<Failure, GenerateVideoStatusEntity>> getGeneratedVideo(
    String jobId,
  );
}
