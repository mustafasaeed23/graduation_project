import 'package:graduation_project/core/Api/base_repo.dart';
import 'package:graduation_project/core/Api/end_points.dart';
import 'package:graduation_project/core/Api/wamdah_dio.dart';
import 'package:graduation_project/core/cache_helper/cache_helper.dart';
import 'package:graduation_project/features/auth/login/Data/Models/login_model.dart';

class LoginDataSource extends BaseRepository {
  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    if (!await networkInfo.isConnected) {
      throw Exception("No internet connection");
    }

    final response = await dio.post(
      endPoint: EndPoints.login,
      data: {"email": email, "password": password},
    );

    if (response.data["success"] != true) {
      throw Exception("Login failed: ${response.data["message"]}");
    }

    final tokens = response.data["data"]?["tokens"];
    if (tokens == null || tokens is! Map<String, dynamic>) {
      throw Exception("Invalid login response format");
    }
    await CacheHelper.saveAccessToken(accessToken: tokens['accessToken']);
    await CacheHelper.saveRefreshToken(refreshToken: tokens['refreshToken']);
    return LoginModel.fromJson(tokens);
  }
}
