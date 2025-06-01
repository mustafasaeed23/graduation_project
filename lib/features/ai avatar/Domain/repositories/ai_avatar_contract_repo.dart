import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/ai%20avatar/Domain/entities/ai_avtar_person_entity.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_script_entity.dart';
import 'package:graduation_project/features/videos/domain/entities/url_video_entity.dart';

abstract class AiAvatarContractRepo {
  Future<Either<Failure, List<AiAvtarPersonEntity>>> getAllAiAvtars();

  Future<GenerateScriptEntity> generateScript({
    required String userPromot,
    required String language,
    required String accentOrDialect,
    required String type,
  });

  Future<String> generateAiAvtarVideo({
    required String title,
    required String generatedScript,
    required String language,
    required String accentOrDialect,
    required String speacker,
    required String type,
  });
  Future<UrlVideoEntity> checkVideoStatus(String jobId);
}
