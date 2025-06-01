import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/service_locator.dart';
import 'package:graduation_project/core/routing/app_router.dart';
import 'package:graduation_project/core/routing/routes.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/generate_script_use_case.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/generate_viedo_use_case.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/poll_video_status_use_case.dart';
import 'package:graduation_project/features/create%20videos/Presentation/cubit/generate_video_cubit.dart';
import 'package:responsive_framework/responsive_framework.dart';

class WamdahWebSite extends StatefulWidget {
  const WamdahWebSite({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  State<WamdahWebSite> createState() => _WamdahWebSiteState();
}

class _WamdahWebSiteState extends State<WamdahWebSite> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) => GenerateVideoCubit(
                  generateVideoUseCase: getIt.get<GenerateViedoUseCase>(),
                  generateScriptUseCase: getIt.get<GenerateScriptUseCase>(),
                  pollVideoStatusUseCase: getIt.get<PollVideoStatusUseCase>(),
                ),
          ),
        ],
        child: MaterialApp(
          builder: EasyLoading.init(
            builder:
                (context, child) => ResponsiveBreakpoints.builder(
                  child: child!,
                  breakpoints: [
                    const Breakpoint(start: 0, end: 450, name: MOBILE),
                    const Breakpoint(start: 451, end: 800, name: TABLET),
                    const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  ],
                ),
          ),
          debugShowCheckedModeBanner: false,
          title: 'Wamdah App',
          onGenerateRoute: widget.appRouter.generateRoute,
          initialRoute: Routes.homePage,
        ),
      ),
    );
  }
}
