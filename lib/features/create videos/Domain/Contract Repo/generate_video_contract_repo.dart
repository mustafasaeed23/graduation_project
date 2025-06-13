import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_script_entity.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_video_entity.dart';
import 'package:graduation_project/features/videos/domain/entities/script_entity.dart';
import 'package:graduation_project/features/videos/domain/entities/url_video_entity.dart';

abstract class GenerateVideoContractRepo {
  Future<ScriptEntity> genearateScript({
    required String userPromot,
    required String language,
    required String accentOrDialect,
    required String type,
  });

  Future<String> generateVideo({
    required String title,
    required String generatedScript,
    required String language,
    required String accentOrDialect,
    required String type,
  });

  Future<UrlVideoEntity> checkVideoStatus(String jobId);
}
