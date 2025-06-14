import 'package:graduation_project/core/Api/base_repo.dart';
import 'package:graduation_project/core/Api/end_points.dart';
import 'package:graduation_project/features/create%20videos/Data/Models/generate_video_reposne.dart';
import 'package:graduation_project/features/create%20videos/Data/Models/generate_script_model.dart';
import 'package:graduation_project/features/create%20videos/Data/Models/generate_video_status_model.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_video_status_entity.dart';
import 'package:graduation_project/features/videos/data/models/script_model.dart';
import 'package:graduation_project/features/videos/data/models/url_video_model.dart';

class GenerateVideoDataSource extends BaseRepository {
  // Future<GenerateVideoResponse> generateVideo({
  //   required String language,
  //   required String accentOrDialect,
  //   required String type,
  //   required String generatedScript,
  //   required String title,
  // }) async {
  //   if (!await networkInfo.isConnected) {
  //     throw Exception("No internet connection");
  //   }

  //   final response = await dio.post(
  //     endPoint: EndPoints.generateVideo,
  //     data: {
  //       "generatedScript": generatedScript,
  //       "title": title,
  //       "language": language,
  //       "accentOrDialect": accentOrDialect,
  //       "type": type,
  //     },
  //   );

  //   if (response.statusCode != 200 || !response.data.containsKey("jobId")) {
  //     throw Exception(
  //       "Generate Video failed: ${response.data["message"] ?? 'Unknown error'}",
  //     );
  //   }

  //   return GenerateVideoResponse.fromJson(response.data);
  // }
  Future<String> generateVideo({
    required String title,
    required String generatedScript,
    required String language,
    required String accentOrDialect,
    required String type,
  }) async {
    try {
      final response = await dio.post(
        endPoint: EndPoints.generateVideo,
        data: {
          "title": title,
          "generatedScript": generatedScript,
          "language": language,
          "accentOrDialect": accentOrDialect,
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

  // generate script
  // Future<GenerateScriptModel> generateScript({
  //   required String userPromot,
  //   required String language,
  //   required String accentOrDialect,
  //   required String type,
  // }) async {
  //   if (!await networkInfo.isConnected) {
  //     throw Exception("No internet connection");
  //   }
  //   final response = await dio.post(
  //     endPoint: EndPoints.generateScript,
  //     data: {
  //       "userPromot": userPromot,
  //       "language": language,
  //       "accentOrDialect": accentOrDialect,
  //       "type": type,
  //     },
  //   );
  //   if (response.data["success"] != true) {
  //     throw Exception("Generate Script failed: ${response.data["message"]}");
  //   }
  //   return GenerateScriptModel.fromJson(response.data["data"]);
  // }
  Future<ScriptModel> generateScript({
    required String userPromot,
    required String type,
    required String language,
    required String accentOrDialect,
  }) async {
    final response = await dio.post(
      endPoint: EndPoints.generateScript,
      data: {
        "userPromot": userPromot,
        "type": type,
        "language": language,
        "accentOrDialect": accentOrDialect,
      },
    );
    // In some cases, Dio returns response.data as a String. Check and decode manually if needed.
    if (response.data["success"] != true) {
      throw Exception("Generate Script failed: ${response.data["message"]}");
    }
    return ScriptModel.fromJson(response.data["data"]);
  }
}
