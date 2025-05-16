import 'package:graduation_project/core/Api/base_repo.dart';
import 'package:graduation_project/core/Api/end_points.dart';
import 'package:graduation_project/features/auth/register/Data/Models/register_model.dart';

class RegisterDataSource extends BaseRepository {
  Future<RegisterModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    if (!await networkInfo.isConnected) {
      throw Exception("No internet connection");
    }
    final response = await dio.post(
      endPoint: EndPoints.register,
      data: {'name': name, 'email': email, 'password': password},
    );
    if (response.data["success"] != true) {
      throw Exception("Register failed: ${response.data["message"]}");
    }

    final tokens = response.data["data"]?["tokens"];
    if (tokens == null || tokens is! Map<String, dynamic>) {
      throw Exception("Invalid register response format");
    }

    return RegisterModel.fromJson(tokens);
  }
}
