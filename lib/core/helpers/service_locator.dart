import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation_project/core/Api/trego_dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utilies/app_preferences.dart';
import 'network_info.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    /// TregoDio
    WamdahDio dio = WamdahDio();
    dio.init();

    getIt.registerLazySingleton<WamdahDio>(() => dio);

    /// App Preferences
    getIt.registerLazySingleton<AppPreferences>(() => AppPreferences(getIt()));

    /// Shared Preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerFactory<SharedPreferences>(() => sharedPreferences);

    /// Network info
    getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

    /// Network Connection checker
    getIt.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker(),
    );

    /// Google SignIn
    getIt.registerLazySingleton(() => GoogleSignIn(scopes: ["email"]));

    /// Login Data Source
  }
}
