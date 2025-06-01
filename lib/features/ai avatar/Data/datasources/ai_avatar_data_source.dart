import 'package:graduation_project/core/Api/base_repo.dart';
import 'package:graduation_project/core/Api/end_points.dart' show EndPoints;
import 'package:graduation_project/core/Errors/exceptions.dart';
import 'package:graduation_project/features/ai%20avatar/Data/models/ai_avtatr_person_model.dart';
import 'package:graduation_project/features/create%20videos/Data/Models/generate_script_model.dart';
import 'package:graduation_project/features/videos/data/models/url_video_model.dart';

class AiAvatarDataSource extends BaseRepository {
  Future<List<AiAvtarPersonModel>> getAllAiAvatar() async {
    if (!await networkInfo.isConnected) {
      throw Exception("No internet connection");
    }

    final response = await dio.get(endPoint: EndPoints.getAiAvtar);

    if (response.data["success"] == true) {
      final aiAvatarJsonList = response.data["data"] as List;
      final aiAvatarModels =
          aiAvatarJsonList
              .map((json) => AiAvtarPersonModel.fromJson(json))
              .toList();
      return aiAvatarModels;
    } else {
      throw ServerException(response.data["message"]);
    }
  }

  Future<GenerateScriptModel> generateScript({
    required String userPromot,
    required String language,
    required String accentOrDialect,
    required String type,
  }) async {
    if (!await networkInfo.isConnected) {
      throw Exception("No internet connection");
    }
    final response = await dio.post(
      endPoint: EndPoints.generateScript,
      data: {
        "userPromot": userPromot,
        "language": language,
        "accentOrDialect": accentOrDialect,
        "type": type,
      },
    );
    if (response.data["success"] != true) {
      throw Exception("Generate Script failed: ${response.data["message"]}");
    }
    return GenerateScriptModel.fromJson(response.data["data"]);
  }

  Future<String> generateAiAvtarVideo({
    required String title,
    required String generatedScript,
    required String language,
    required String accentOrDialect,
    required String speacker,
    required String type,
  }) async {
    try {
      final response = await dio.post(
        endPoint: EndPoints.generateAiAvtarVideo,
        data: {
          "title": title,
          "generatedScript": generatedScript,
          "language": language,
          "accentOrDialect": accentOrDialect,
          "speacker": speacker,
          "type": type,
        },
      );

      final jobId = response.data["jobId"];

      if (jobId == null) {
        throw Exception('jobId is null. Response: ${response.data}');
      }

      return jobId;
    } catch (e) {
      throw Exception('Failed to generate video: $e');
    }
  }

  Future<UrlVideoModel> checkVideoStatus(String jobId) async {
    final response = await dio.get(
      endPoint: EndPoints.getGeneratedVideo(jobId),
    );
    // Parse directly from response.data because the API response has no "data" wrapper
    return UrlVideoModel.fromJson(response.data);
  }
}
