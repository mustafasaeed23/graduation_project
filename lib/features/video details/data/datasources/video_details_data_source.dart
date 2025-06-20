import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Api/base_repo.dart';
import 'package:graduation_project/core/Api/end_points.dart';
import 'package:graduation_project/core/Errors/exceptions.dart';
import 'package:graduation_project/features/dashboard/Data/mappers/dashboard_mappers.dart';
import 'package:graduation_project/features/dashboard/Data/models/user_data_model.dart';
import 'package:graduation_project/features/dashboard/Domain/entities/videos_entity.dart';

class VideoDetailsDataSource extends BaseRepository {
  Future<VideosEntity> renameVideoTitle({
    required String newTitle,
    required String videoId,
  }) async {
    final response = await dio.patch(
      endPoint: EndPoints.renameVideoTitle,
      data: {"newTitle": newTitle, "videoId": videoId},
    );

    if (response.data["success"] == true) {
      final videoJson = response.data["data"];
      final videos =
          videoJson
              .map(
                (json) => DashboardMappers.getVideosEntityFromModel(
                  Videos.fromJson(json),
                ),
              )
              .toList(); // this should match your Videos model
      // Assuming you want to return the first VideosEntity from the list
      return videos.first as VideosEntity;
    } else {
      throw ServerException(response.data["message"]);
    }
  }
}
