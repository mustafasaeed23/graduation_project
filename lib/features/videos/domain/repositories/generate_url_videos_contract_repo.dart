import 'package:graduation_project/features/videos/domain/entities/script_entity.dart';
import 'package:graduation_project/features/videos/domain/entities/url_video_entity.dart';

abstract class GenerateUrlVideoRepository {
  Future<ScriptEntity> generateScript({
    required String url,
    required String language,
    required String accentOrDialect,
  });
  Future<String> generateVideo({
    required String title,
    required String generatedScript,
    required String language,
    required String accentOrDialect,
  });
  Future<UrlVideoEntity> checkVideoStatus(String jobId);
}
