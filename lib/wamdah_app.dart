import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/routing/app_router.dart';
import 'package:graduation_project/core/routing/routes.dart';
import 'package:graduation_project/mobile/theme/app_theme.dart';
import 'package:graduation_project/mobile/theme/bloc/theme_bloc.dart';
import 'package:graduation_project/mobile/theme/bloc/theme_state.dart';
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
        providers: [BlocProvider(create: (context) => ThemeBloc())],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp(
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
              initialRoute: Routes.corePage,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: themeState.themeMode,
            );
          },
        ),
      ),
    );
  }
}
