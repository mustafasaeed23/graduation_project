import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/service_locator.dart';
import 'package:graduation_project/features/Home/home_screen.dart';
import 'package:graduation_project/features/ai%20avatar/Presentation/screens/ai_avatar_screen.dart';
import 'package:graduation_project/features/auth/login/Domain/Use%20Cases/login_use_case.dart';
import 'package:graduation_project/features/auth/login/Presentation/screens/login_screen.dart';
import 'package:graduation_project/features/auth/login/cubit/login_cubit.dart';
import 'package:graduation_project/features/auth/register/Domain/Use%20Case/register_use_case.dart';
import 'package:graduation_project/features/auth/register/Presentation/cubit/register_cubit.dart';
import 'package:graduation_project/features/auth/register/Presentation/screens/register_screen.dart';
import 'package:graduation_project/features/core/Presentation/screens/core_screen.dart';
import 'package:graduation_project/features/dashboard/Domain/usecases/dashboard_information_use_case.dart';
import 'package:graduation_project/features/dashboard/Domain/usecases/get_all_videos_use_case.dart';
import 'package:graduation_project/features/dashboard/Presentation/cubit/dashboard_cubit.dart';
import 'package:graduation_project/features/dashboard/Presentation/screens/all_videos_screen.dart';
import 'package:graduation_project/mobile/layout/layout_screen.dart';
import 'package:graduation_project/mobile/onboarding_screen.dart';
import 'package:graduation_project/mobile/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          child: BlocProvider(
            create:
                (context) =>
                    LoginCubit(loginUseCase: getIt.get<LoginUseCase>()),
            child: LoginScreen(),
          ),
        );
      case Routes.registerScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          child: BlocProvider(
            create:
                (context) => RegisterCubit(
                  registerUseCase: getIt.get<RegisterUseCase>(),
                ),
            child: RegisterScreen(),
          ),
        );
      case Routes.corePage:
        return PageTransition(
          child: CoreScreen(),
          type: PageTransitionType.fade,
        );
      case Routes.aiScreen:
        return PageTransition(
          child: AiAvatarScreen(),
          type: PageTransitionType.fade,
        );

      case Routes.homePage:
        return PageTransition(
          child: HomeScreen(),
          type: PageTransitionType.fade,
        );

      ///==================mobile====================
      case Routes.splashScreen:
        return PageTransition(
          child: SplashScreen(),
          type: PageTransitionType.fade,
        );
      case Routes.onboardingScreen:
        return PageTransition(
          child: OnboardingScreen(),
          type: PageTransitionType.fade,
        );
        case Routes.layoutScreen:
        return PageTransition(
          child: MainLayoutScreen(),
          type: PageTransitionType.fade,
        );

      default:
        return PageTransition(
          child: Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
          type: PageTransitionType.theme,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          settings: settings,
        );
    }
  }
}
