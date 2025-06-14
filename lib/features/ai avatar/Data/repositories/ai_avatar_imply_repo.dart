import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/exceptions.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/ai%20avatar/Data/datasources/ai_avatar_data_source.dart';
import 'package:graduation_project/features/ai%20avatar/Domain/entities/ai_avtar_person_entity.dart';
import 'package:graduation_project/features/ai%20avatar/Domain/repositories/ai_avatar_contract_repo.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_script_entity.dart';
import 'package:graduation_project/features/videos/domain/entities/url_video_entity.dart';

class AiAvatarImplyRepo implements AiAvatarContractRepo {
  final AiAvatarDataSource dataSource;

  AiAvatarImplyRepo({required this.dataSource});
  @override
  Future<Either<Failure, List<AiAvtarPersonEntity>>> getAllAiAvtars() async {
    try {
      final result = await dataSource.getAllAiAvatar();
      return Right(result);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.message));
    } catch (e) {
      return const Left(
        ServerFailure(message: "Something went wrong, please try again later"),
      );
    }
  }

  @override
  Future<UrlVideoEntity> checkVideoStatus(String jobId) async {
    final result = await dataSource.checkVideoStatus(jobId);
    return result.toEntity();
  }

  @override
  Future<GenerateScriptEntity> generateScript({
    required String userPromot,
    required String language,
    required String accentOrDialect,
    required String type,
  }) async {
    return await dataSource.generateScript(
      type: type,
      accentOrDialect: accentOrDialect,
      language: language,
      userPromot: userPromot,
    );
  }

  @override
  Future<String> generateAiAvtarVideo({
    required String title,
    required String generatedScript,
    required String language,
    required String accentOrDialect,
    required String speaker,
    required String type,
  }) async {
    return await dataSource.generateAiAvtarVideo(
      type: type,
      speaker: speaker,
      title: title,
      generatedScript: generatedScript,
      language: language,
      accentOrDialect: accentOrDialect,
    );
  }
}
