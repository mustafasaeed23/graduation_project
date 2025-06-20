import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Api/base_repo.dart';
import 'package:graduation_project/core/Api/end_points.dart';
import 'package:graduation_project/core/Api/wamdah_dio.dart';
import 'package:graduation_project/core/Errors/exceptions.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/dashboard/Data/mappers/dashboard_mappers.dart';
import 'package:graduation_project/features/dashboard/Data/models/user_data_model.dart';
import 'package:graduation_project/features/dashboard/Domain/entities/user_data_entity.dart';
import 'package:graduation_project/features/dashboard/Domain/entities/videos_entity.dart';

class DashboardDataSource extends BaseRepository {
  Future<UserDataEntity> getDashboardInformation() async {
    if (!await networkInfo.isConnected) {
      throw Exception("No internet connection");
    }

    final response = await dio.get(endPoint: EndPoints.userData);
    if (response.data["success"] == true) {
      final userDataJson = response.data["data"];
      final userDataModel = UserData.fromJson(userDataJson);
      final userDataEntity = DashboardMappers.getUserDataEntityFromModel(
        userDataModel,
      );
      return userDataEntity;
    } else {
      throw ServerException(response.data["message"]);
    }
  }
  Future<Either<Failure, List<VideosEntity>>> getAllUserVideos() async {
    try {
      if (!await networkInfo.isConnected) {
        return Left(ServerFailure(message: "No internet connection"));
      }

      final response = await dio.get(endPoint: EndPoints.getUserAllVideos);

      if (response.data["success"] == true) {
        final List<dynamic> videosJson = response.data["data"]["videos"];

        final videos =
            videosJson
                .map(
                  (json) => DashboardMappers.getVideosEntityFromModel(
                    Videos.fromJson(json),
                  ),
                )
                .toList();

        return Right(videos);
      } else {
        return Left(
          ServerFailure(message: response.data["message"] ?? "Unknown error"),
        );
      }
    } catch (e) {
      print("Repo exception: $e");
      return Left(
        ServerFailure(message: "Something went wrong, please try again later"),
      );
    }
  }
}
