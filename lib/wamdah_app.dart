import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/routing/app_router.dart';
import 'package:graduation_project/core/routing/routes.dart';
import 'package:responsive_framework/responsive_framework.dart';

class WamdahWebSite extends StatefulWidget {
  const WamdahWebSite({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  State<WamdahWebSite> createState() => _WamdahWebSiteState();
}

class _WamdahWebSiteState extends State<WamdahWebSite> {
  // final AppPreferences _appPreferences = getIt.get<AppPreferences>();

  //  @override
  //   void didChangeDependencies() {
  //     super.didChangeDependencies();
  //     _appPreferences.getLocale().then(
  //       (locale) {
  //         if (mounted) {
  //           context.setLocale(locale);
  //         }
  //       },
  //     );
  //   }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
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
    );
  }
}
