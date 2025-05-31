import 'package:graduation_project/core/Api/base_repo.dart';
import 'package:graduation_project/core/Api/end_points.dart';
import 'package:graduation_project/features/create%20videos/Data/Models/generate_video_reposne.dart';
import 'package:graduation_project/features/create%20videos/Data/Models/generate_script_model.dart';
import 'package:graduation_project/features/create%20videos/Data/Models/generate_video_status_model.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_video_status_entity.dart';

class GenerateVideoDataSource extends BaseRepository {
  Future<GenerateVideoResponse> generateVideo({
    required String language,
    required String accentOrDialect,
    required String type,
    required String generatedScript,
    required String title,
  }) async {
    if (!await networkInfo.isConnected) {
      throw Exception("No internet connection");
    }

    final response = await dio.post(
      endPoint: EndPoints.generateVideo,
      data: {
        "generatedScript": generatedScript,
        "title": title,
        "language": language,
        "accentOrDialect": accentOrDialect,
        "type": type,
      },
    );

    if (response.statusCode != 200 || !response.data.containsKey("jobId")) {
      throw Exception(
        "Generate Video failed: ${response.data["message"] ?? 'Unknown error'}",
      );
    }

    return GenerateVideoResponse.fromJson(response.data);
  }

  Future<GenerateVideoStatusModel> getVideoStatus(String jobId) async {
    final response = await dio.get(
      endPoint: EndPoints.getGeneratedVideo(jobId),
    );

    if (response.statusCode != 200 || !response.data.containsKey("status")) {
      throw Exception(response.data["message"] ?? "Unknown error");
    }

    return GenerateVideoStatusModel.fromJson(response.data);
  }

  // generate script
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
}
