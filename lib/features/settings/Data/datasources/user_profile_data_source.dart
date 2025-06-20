import 'package:graduation_project/core/Api/base_repo.dart';
import 'package:graduation_project/core/Api/end_points.dart';
import 'package:graduation_project/core/Errors/exceptions.dart';
import 'package:graduation_project/features/settings/Data/models/user_profile_model.dart';

class UserProfileDataSource extends BaseRepository {
  Future<UserProfileModel> getUserProfile() async {
    if (!await networkInfo.isConnected) {
      throw Exception("No internet connection");
    }

    final response = await dio.get(endPoint: EndPoints.userProfile);

    if (response.data["success"] == true) {
      final data = response.data["data"];

      if (data == null || data is! Map<String, dynamic>) {
        throw Exception("Invalid response format: 'data' is null or not a Map");
      }

      return UserProfileModel.fromJson(data);
    } else {
      throw ServerException(response.data["message"] ?? "Unknown error");
    }
  }

  Future<String> purchaseCredits({required int credit}) async {
    final response = await dio.post(
      endPoint: EndPoints.purchaseCredits,
      data: {"credits": credit},
    );

    if (response.data["success"] != true) {
      throw ServerException(response.data["message"]);
    }

    return response.data["message"];
  }
}
