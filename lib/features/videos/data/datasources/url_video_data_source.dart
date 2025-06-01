import 'dart:convert';

import 'package:graduation_project/core/Api/base_repo.dart';
import 'package:graduation_project/core/Api/end_points.dart';
import 'package:graduation_project/features/videos/data/models/script_model.dart';
import 'package:graduation_project/features/videos/data/models/url_video_model.dart';

class UrlVideoDataSource extends BaseRepository {
  Future<ScriptModel> generateScript({
    required String url,
    required String language,
    required String accentOrDialect,
  }) async {
    final response = await dio.post(
      endPoint: EndPoints.generateScriptAd,
      data: {
        "url": url,
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

  Future<String> generateVideo({
    required String title,
    required String generatedScript,
    required String language,
    required String accentOrDialect,
  }) async {
    try {
      final response = await dio.post(
        endPoint: EndPoints.generateVideo,
        data: {
          "title": title,
          "generatedScript": generatedScript,
          "language": language,
          "accentOrDialect": accentOrDialect,
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
