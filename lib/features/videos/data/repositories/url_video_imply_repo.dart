import 'package:graduation_project/features/videos/data/datasources/url_video_data_source.dart';
import 'package:graduation_project/features/videos/domain/entities/script_entity.dart';
import 'package:graduation_project/features/videos/domain/entities/url_video_entity.dart';
import 'package:graduation_project/features/videos/domain/repositories/generate_url_videos_contract_repo.dart';

class UrlVideoImplyRepo implements GenerateUrlVideoRepository {
  final UrlVideoDataSource dataSource;

  UrlVideoImplyRepo({required this.dataSource});
  @override
  Future<UrlVideoEntity> checkVideoStatus(String jobId) async {
    final result = await dataSource.checkVideoStatus(jobId);
    return result.toEntity();
  }

  @override
  Future<ScriptEntity> generateScript({
    required String url,
    required String language,
    required String accentOrDialect,
  }) async {
    final result = await dataSource.generateScript(
      url: url,
      language: language,
      accentOrDialect: accentOrDialect,
    );
    return result.toEntity();
  }

  @override
  Future<String> generateVideo({
    required String title,
    required String generatedScript,
    required String language,
    required String accentOrDialect,
  }) async {
    return await dataSource.generateVideo(
      title: title,
      generatedScript: generatedScript,
      language: language,
      accentOrDialect: accentOrDialect,
    );
  }
}
