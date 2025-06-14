import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/exceptions.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/core/Errors/strings.dart';
import 'package:graduation_project/core/constant.dart';
import 'package:graduation_project/features/create%20videos/Data/Data%20Source/generate_video_data_source.dart';
import 'package:graduation_project/features/create%20videos/Data/Models/generate_script_model.dart';
import 'package:graduation_project/features/create%20videos/Data/Models/generate_video_reposne.dart';
import 'package:graduation_project/features/create%20videos/Domain/Contract%20Repo/generate_video_contract_repo.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_script_entity.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_video_status_entity.dart';
import 'package:graduation_project/features/videos/domain/entities/script_entity.dart';
import 'package:graduation_project/features/videos/domain/entities/url_video_entity.dart';

class GenerateVideoImplRepo implements GenerateVideoContractRepo {
  final GenerateVideoDataSource dataSource;

  GenerateVideoImplRepo({required this.dataSource});

  @override
  Future<UrlVideoEntity> checkVideoStatus(String jobId) async {
    final result = await dataSource.checkVideoStatus(jobId);
    return result.toEntity();
  }

  @override
  Future<String> generateVideo({
    required String title,
    required String generatedScript,
    required String language,
    required String accentOrDialect,
    required String type,
  }) async {
    return await dataSource.generateVideo(
      title: title,
      generatedScript: generatedScript,
      language: language,
      accentOrDialect: accentOrDialect,
      type: type,
    );
  }

  @override
  Future<ScriptEntity> genearateScript({
    required String userPromot,
    required String language,
    required String accentOrDialect,
    required String type,
  }) async {
    final result = await dataSource.generateScript(
      language: language,
      accentOrDialect: accentOrDialect,
      userPromot: userPromot,
      type: type,
    );
    return result.toEntity();
  }
}
