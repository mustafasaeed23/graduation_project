import 'package:graduation_project/core/Api/base_repo.dart';
import 'package:graduation_project/core/Api/end_points.dart' show EndPoints;
import 'package:graduation_project/core/Errors/exceptions.dart';
import 'package:graduation_project/features/ai%20avatar/Data/models/ai_avtatr_person_model.dart';

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
}
