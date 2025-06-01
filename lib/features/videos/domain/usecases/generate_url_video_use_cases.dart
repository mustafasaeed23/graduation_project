import 'package:graduation_project/features/videos/domain/entities/script_entity.dart';
import 'package:graduation_project/features/videos/domain/entities/url_video_entity.dart';
import 'package:graduation_project/features/videos/domain/repositories/generate_url_videos_contract_repo.dart';

class VideoUseCase {
  final GenerateUrlVideoRepository repository;

  VideoUseCase({required this.repository});

  Future<ScriptEntity> generateScript({
    required String url,
    required String language,
    required String accentOrDialect,
  }) {
    return repository.generateScript(
      url: url,
      language: language,
      accentOrDialect: accentOrDialect,
    );
  }

  Future<String> generateVideo({
    required String title,
    required String generatedScript,
    required String language,
    required String accentOrDialect,
  }) {
    return repository.generateVideo(
      title: title,
      generatedScript: generatedScript,
      language: language,
      accentOrDialect: accentOrDialect,
    );
  }

  Future<UrlVideoEntity> checkVideoStatus(String jobId) {
    return repository.checkVideoStatus(jobId);
  }
}
