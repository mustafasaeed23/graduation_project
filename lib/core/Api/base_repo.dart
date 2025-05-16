import 'package:graduation_project/core/Api/wamdah_dio.dart';

import '../helpers/network_info.dart';
import '../helpers/service_locator.dart';

abstract class BaseRepository {
  late NetworkInfo networkInfo;
  late WamdahDio dio;

  BaseRepository() {
    networkInfo = getIt.get<NetworkInfo>();
    dio = getIt.get<WamdahDio>();
  }
}
