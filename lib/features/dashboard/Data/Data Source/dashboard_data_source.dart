import 'package:graduation_project/core/Api/base_repo.dart';
import 'package:graduation_project/core/Api/end_points.dart';
import 'package:graduation_project/core/Api/wamdah_dio.dart';
import 'package:graduation_project/core/Errors/exceptions.dart';
import 'package:graduation_project/features/dashboard/Data/mappers/dashboard_mappers.dart';
import 'package:graduation_project/features/dashboard/Data/models/user_data_model.dart';
import 'package:graduation_project/features/dashboard/Domain/entities/user_data_entity.dart';

class DashboardDataSource extends BaseRepository {
  Future<UserDataEntity> getDashboardInformation() async {
    if (!await networkInfo.isConnected) {
      throw Exception("No internet connection");
    }

    final response = await dio.get(endPoint: EndPoints.userData);

    // Fix the assignment bug here (== instead of =)
    if (response.data["success"] == true) {
      final userDataJson = response.data["data"];
      final userDataModel = UserData.fromJson(userDataJson);
      final userDataEntity = DashboardMappers.getUserDataEntityFromModel(userDataModel);
      return userDataEntity;
    } else {
      throw ServerException(response.data["message"]);
    }
  }
}