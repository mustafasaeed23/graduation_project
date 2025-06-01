import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:graduation_project/core/Api/wamdah_dio.dart';
import 'package:graduation_project/features/ai%20avatar/Data/datasources/ai_avatar_data_source.dart';
import 'package:graduation_project/features/ai%20avatar/Data/repositories/ai_avatar_imply_repo.dart';
import 'package:graduation_project/features/ai%20avatar/Domain/repositories/ai_avatar_contract_repo.dart';
import 'package:graduation_project/features/ai%20avatar/Domain/usecases/generate_ai_avtar_video_use_case.dart';
import 'package:graduation_project/features/ai%20avatar/Domain/usecases/get_all_ai_avtars_use_case.dart';
import 'package:graduation_project/features/auth/login/Data/Data%20Source/login_data_source.dart';
import 'package:graduation_project/features/auth/login/Data/Repository/login_imply_repo.dart';
import 'package:graduation_project/features/auth/login/Domain/Contract%20Repository/login_contract_repo.dart';
import 'package:graduation_project/features/auth/login/Domain/Use%20Cases/login_use_case.dart';
import 'package:graduation_project/features/auth/register/Data/Data%20Source/register_data_source.dart';
import 'package:graduation_project/features/auth/register/Data/Repository/register_imply_repo.dart';
import 'package:graduation_project/features/auth/register/Domain/Contract%20Repo/register_contract_repo.dart';
import 'package:graduation_project/features/auth/register/Domain/Use%20Case/register_use_case.dart';
import 'package:graduation_project/features/create%20videos/Data/Data%20Source/generate_video_data_source.dart';
import 'package:graduation_project/features/create%20videos/Data/Repository/imply_repo.dart';
import 'package:graduation_project/features/create%20videos/Domain/Contract%20Repo/generate_video_contract_repo.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/generate_script_use_case.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/generate_viedo_use_case.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/poll_video_status_use_case.dart';
import 'package:graduation_project/features/dashboard/Data/Data%20Source/dashboard_data_source.dart';
import 'package:graduation_project/features/dashboard/Data/repo/dashboard_imply_repo.dart';
import 'package:graduation_project/features/dashboard/Domain/contract%20repo/dashboard_contract_repo.dart';
import 'package:graduation_project/features/dashboard/Domain/usecases/dashboard_information_use_case.dart';
import 'package:graduation_project/features/dashboard/Domain/usecases/get_all_videos_use_case.dart';
import 'package:graduation_project/features/settings/Data/datasources/user_profile_data_source.dart';
import 'package:graduation_project/features/settings/Data/repositories/imply_repo.dart';
import 'package:graduation_project/features/settings/Domain/repositories/profile_contract_repo.dart';
import 'package:graduation_project/features/settings/Domain/usecases/get_user_profile_use_case.dart';
import 'package:graduation_project/features/videos/data/datasources/url_video_data_source.dart';
import 'package:graduation_project/features/videos/data/repositories/url_video_imply_repo.dart';
import 'package:graduation_project/features/videos/domain/repositories/generate_url_videos_contract_repo.dart';
import 'package:graduation_project/features/videos/domain/usecases/generate_url_video_use_cases.dart';
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
    // getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

    // /// Network Connection checker
    // getIt.registerLazySingleton<InternetConnectionChecker>(
    //   () => InternetConnectionChecker(),
    // );
    if (kIsWeb) {
      getIt.registerLazySingleton<NetworkInfo>(() => WebNetworkInfo());
    } else {
      getIt.registerLazySingleton<InternetConnectionChecker>(
        () => InternetConnectionChecker(),
      );
      getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
    }

    /// ========================================== Login====================================
    getIt.registerLazySingleton<LoginContractRepo>(
      () => LoginImplyRepo(loginDataSource: getIt.get<LoginDataSource>()),
    );

    getIt.registerLazySingleton<LoginDataSource>(() => LoginDataSource());

    getIt.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(loginContractRepo: getIt.get<LoginContractRepo>()),
    );

    /// ========================================== Register====================================
    /// Register Contract Repo
    getIt.registerLazySingleton<RegisterContractRepo>(
      () => RegisterImplyRepo(
        registerDataSource: getIt.get<RegisterDataSource>(),
      ),
    );

    /// Register Data Source
    getIt.registerLazySingleton<RegisterDataSource>(() => RegisterDataSource());

    /// Register Use Case
    getIt.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(
        registerContractRepo: getIt.get<RegisterContractRepo>(),
      ),
    );

    ///=================================dashboard=============================================
    // dashboard Data Source
    getIt.registerLazySingleton<DashboardDataSource>(
      () => DashboardDataSource(),
    );

    // dashboard repo
    getIt.registerLazySingleton<DashboardContractRepo>(
      () => DashboardImplyRepo(
        dashboardDataSource: getIt.get<DashboardDataSource>(),
      ),
    );

    // dashboard use case
    getIt.registerLazySingleton<DashboardInformationUseCase>(
      () => DashboardInformationUseCase(
        dashboardContractRepo: getIt.get<DashboardContractRepo>(),
      ),
    );

    // get all videos
    getIt.registerLazySingleton<GetAllVideosUseCase>(
      () => GetAllVideosUseCase(
        dashboardContractRepo: getIt.get<DashboardContractRepo>(),
      ),
    );

    /// ===================================== generate instant ai video =============================================
    getIt.registerLazySingleton<GenerateVideoDataSource>(
      () => GenerateVideoDataSource(),
    );
    getIt.registerLazySingleton<GenerateVideoContractRepo>(
      () => GenerateVideoImplRepo(
        dataSource: getIt.get<GenerateVideoDataSource>(),
      ),
    );
    getIt.registerLazySingleton<GenerateViedoUseCase>(
      () => GenerateViedoUseCase(repo: getIt.get<GenerateVideoContractRepo>()),
    );
    getIt.registerLazySingleton<GenerateScriptUseCase>(
      () => GenerateScriptUseCase(
        generateVideoContractRepo: getIt.get<GenerateVideoContractRepo>(),
      ),
    );
    getIt.registerLazySingleton<PollVideoStatusUseCase>(
      () => PollVideoStatusUseCase(
        repository: getIt.get<GenerateVideoContractRepo>(),
      ),
    );
    // =======================================Settings====================================
    getIt.registerLazySingleton<UserProfileDataSource>(
      () => UserProfileDataSource(),
    );
    getIt.registerLazySingleton<ProfileContractRepo>(
      () =>
          ImplyRepo(userProfileDataSource: getIt.get<UserProfileDataSource>()),
    );
    getIt.registerLazySingleton<GetUserProfileUseCase>(
      () => GetUserProfileUseCase(
        profileContractRepo: getIt.get<ProfileContractRepo>(),
      ),
    );

    /// =====================================ai avatar==========================================
    getIt.registerLazySingleton<AiAvatarDataSource>(() => AiAvatarDataSource());
    getIt.registerLazySingleton<AiAvatarContractRepo>(
      () => AiAvatarImplyRepo(dataSource: getIt.get<AiAvatarDataSource>()),
    );
    getIt.registerLazySingleton<GetAllAiAvtarsUseCase>(
      () => GetAllAiAvtarsUseCase(
        aiAvatarContractRepo: getIt.get<AiAvatarContractRepo>(),
      ),
    );
    getIt.registerLazySingleton<GenerateAiAvtarVideoUseCase>(
      () => GenerateAiAvtarVideoUseCase(
        aiAvatarContractRepo: getIt.get<AiAvatarContractRepo>(),
      ),
    );

    /// =========================================generate url video===============================
    getIt.registerLazySingleton<UrlVideoDataSource>(() => UrlVideoDataSource());
    getIt.registerLazySingleton<GenerateUrlVideoRepository>(()=> UrlVideoImplyRepo(dataSource : getIt.get<UrlVideoDataSource>()));
    getIt.registerLazySingleton<VideoUseCase>(() => VideoUseCase(repository: getIt.get<GenerateUrlVideoRepository>()));
  }
}
