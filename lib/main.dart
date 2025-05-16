import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/bloc_observer.dart';
import 'package:graduation_project/core/cache_helper/cache_helper.dart';
import 'package:graduation_project/core/helpers/service_locator.dart';
import 'package:graduation_project/core/routing/app_router.dart';
import 'package:graduation_project/wamdah_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await CacheHelper.init();
  await ServicesLocator().init();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  runApp(WamdahWebSite(appRouter: AppRouter()));
}
