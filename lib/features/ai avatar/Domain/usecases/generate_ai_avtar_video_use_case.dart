import 'package:graduation_project/features/ai%20avatar/Domain/repositories/ai_avatar_contract_repo.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_script_entity.dart';
import 'package:graduation_project/features/videos/domain/entities/url_video_entity.dart';

class GenerateAiAvtarVideoUseCase {
  final AiAvatarContractRepo aiAvatarContractRepo;

  GenerateAiAvtarVideoUseCase({required this.aiAvatarContractRepo});

  Future<GenerateScriptEntity> generateScript({
    required String userPromot,
    required String language,
    required String accentOrDialect,
    required String type,
  }) async {
    return aiAvatarContractRepo.generateScript(
      userPromot: userPromot,
      language: language,
      accentOrDialect: accentOrDialect,
      type: type,
    );
  }

  Future<String> generateVideo({
    required String title,
    required String generatedScript,
    required String language,
    required String accentOrDialect,
    required String speaker,
    required String type,
  }) async {
    return aiAvatarContractRepo.generateAiAvtarVideo(
      title: title,
      generatedScript: generatedScript,
      language: language,
      accentOrDialect: accentOrDialect,
      speaker: speaker,
      type: type,
    );
  }

  Future<UrlVideoEntity> checkVideoStatus(String jobId) async {
    return aiAvatarContractRepo.checkVideoStatus(jobId);
  }
}
