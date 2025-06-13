import 'package:graduation_project/features/create%20videos/Domain/Contract%20Repo/generate_video_contract_repo.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_script_entity.dart';
import 'package:graduation_project/features/videos/domain/entities/script_entity.dart';
import 'package:graduation_project/features/videos/domain/entities/url_video_entity.dart';

class GenerateInstantVideoUseCase {
  final GenerateVideoContractRepo generateVideoContractRepo;
  GenerateInstantVideoUseCase({required this.generateVideoContractRepo});

  Future<ScriptEntity> generateScript({
    required String userPromot,
    required String type,
    required String language,
    required String accentOrDialect,
  }) {
    return generateVideoContractRepo.genearateScript(
      language: language,
      accentOrDialect: accentOrDialect,
      userPromot: userPromot,
      type: type,
    );
  }

  Future<String> generateVideo({
    required String title,
    required String generatedScript,
    required String language,
    required String accentOrDialect,
    required String type,
  }) {
    return generateVideoContractRepo.generateVideo(
      title: title,
      generatedScript: generatedScript,
      language: language,
      accentOrDialect: accentOrDialect,
      type: type,
    );
  }

  Future<UrlVideoEntity> checkVideoStatus(String jobId) {
    return generateVideoContractRepo.checkVideoStatus(jobId);
  }
}
