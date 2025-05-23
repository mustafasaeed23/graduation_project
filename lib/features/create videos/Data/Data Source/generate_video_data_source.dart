import 'package:graduation_project/core/Api/base_repo.dart';
import 'package:graduation_project/core/Api/end_points.dart';
import 'package:graduation_project/features/create%20videos/Data/Models/create_video_model.dart';

class GenerateVideoDataSource extends BaseRepository {
  Future<VideoDataModel> generateVideo({
    required String promot,
    required String language,
    required String accentOrDialect,
    required String type,
  }) async {
    if (!await networkInfo.isConnected) {
      throw Exception("No internet connection");
    }
    final response = await dio.post(
      endPoint: EndPoints.generateVideo,
      data: {
        "promot": promot,
        "language": language,
        "accentOrDialect": accentOrDialect,
        "type": type,
      },
    );
    if (response.data["success"] != true) {
      throw Exception("Generate Video failed: ${response.data["message"]}");
    }
    return VideoDataModel.fromJson(response.data["data"]);
  }
}
