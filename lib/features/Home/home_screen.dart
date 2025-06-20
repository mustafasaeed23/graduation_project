import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/helpers/service_locator.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/features/Home/drawer_item_widget.dart';
import 'package:graduation_project/features/ai%20autopilot/presentation/screens/ai_autopilot_screen.dart';
import 'package:graduation_project/features/ai%20avatar/Domain/usecases/generate_ai_avtar_video_use_case.dart';
import 'package:graduation_project/features/ai%20avatar/Domain/usecases/get_all_ai_avtars_use_case.dart';
import 'package:graduation_project/features/ai%20avatar/Presentation/bloc/generate_ai_avatar_videos_bloc.dart';
import 'package:graduation_project/features/ai%20avatar/Presentation/cubit/ai_avatar_cubit.dart';
import 'package:graduation_project/features/ai%20avatar/Presentation/screens/ai_avatar_screen.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/generate_instant_video_use_cases.dart';
import 'package:graduation_project/features/create%20videos/Presentation/bloc/generate_instant_video_bloc.dart';
import 'package:graduation_project/features/create%20videos/Presentation/screens/create_video_screen.dart';
import 'package:graduation_project/features/dashboard/Domain/usecases/dashboard_information_use_case.dart';
import 'package:graduation_project/features/dashboard/Domain/usecases/get_all_videos_use_case.dart';
import 'package:graduation_project/features/dashboard/Presentation/cubit/dashboard_cubit.dart';
import 'package:graduation_project/features/dashboard/Presentation/screens/dashboard_screen.dart';
import 'package:graduation_project/features/settings/Domain/usecases/get_user_profile_use_case.dart';
import 'package:graduation_project/features/settings/Presentation/cubits/cubit/credits_cubit.dart';
import 'package:graduation_project/features/settings/Presentation/cubits/settings_cubit.dart';
import 'package:graduation_project/features/settings/Presentation/screens/settings_screen.dart';
import 'package:graduation_project/features/video%20details/cubit/video_details_cubit.dart';
import 'package:graduation_project/features/video%20details/domain/usecases/video_details_use_case.dart';
import 'package:graduation_project/features/videos/domain/usecases/generate_url_video_use_cases.dart';
import 'package:graduation_project/features/videos/presentation/bloc/generate_url_video_bloc.dart';
import 'package:graduation_project/features/videos/url_video_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Current screen index to manage the active screen.
  int _selectedIndex = 0;

  // Screens
  final List<Widget> _screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => DashboardCubit(
                useCase: getIt.get<DashboardInformationUseCase>(),
                getAllVideosUseCase: getIt.get<GetAllVideosUseCase>(),
              )..getDashboardInformation(),

          // ..getAllVideos(),
        ),
        BlocProvider(
          create:
              (context) => VideoDetailsCubit(
                videoDetailsUseCase: getIt.get<VideoDetailsUseCase>(),
              ),
        ),
      ],
      child: DashboardScreen(),
    ),
    BlocProvider(
      create:
          (context) => GenerateInstantVideoBloc(
            useCases: getIt.get<GenerateInstantVideoUseCase>(),
          ),
      child: CreateVideoScreen(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => AiAvatarCubit(
                getAllAiAvtarsUseCase: getIt.get<GetAllAiAvtarsUseCase>(),
              )..getAllAiAvtars(),
        ),
        BlocProvider(
          create:
              (context) => GenerateAiAvatarVideosBloc(
                useCases: getIt.get<GenerateAiAvtarVideoUseCase>(),
              ),
        ),
      ],
      child: AiAvatarScreen(),
    ),

    BlocProvider(
      create: (context) => VideoBloc(useCase: getIt.get<VideoUseCase>()),
      child: UrlVideoScreen(),
    ),

    MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => SettingsCubit(
                getUserProfileUseCase: getIt.get<GetUserProfileUseCase>(),
              )..getUserProfile(),
        ),
        BlocProvider(
          create:
              (context) => CreditsCubitCubit(
                getUserProfileUseCase: getIt.get<GetUserProfileUseCase>(),
              ),
        ),
      ],
      child: SettingsScreen(),
    ),
    AiAutopilotScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: Row(
        children: [
          // The Drawer will remain fixed on the left side
          Container(
            width: 300,
            color: AppColors.drawerBg,
            child: Drawer(
              backgroundColor: AppColors.drawerBg,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 120.h,
                    child: DrawerHeader(
                      margin: EdgeInsets.all(0),
                      decoration: const BoxDecoration(
                        color: AppColors.drawerBg,
                      ),
                      child: Row(
                        children: [
                          Image.asset("assets/images/logo2.png"),
                          Text(
                            'Wamdah',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.wamdahGoldColor2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  DrawerItemTile(
                    title: 'Dashboard',
                    assetName: 'assets/icons/home.svg',
                    isSelected: _selectedIndex == 0,
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                  ),
                  DrawerItemTile(
                    title: 'Instant AI Video',
                    assetName: 'assets/icons/ai_video.svg',
                    isSelected: _selectedIndex == 1,
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                  ),

                  DrawerItemTile(
                    title: 'Smart Url Video',
                    assetName: 'assets/icons/url_video.svg',
                    isSelected: _selectedIndex == 3,
                    onTap: () {
                      setState(() {
                        _selectedIndex = 3;
                      });
                    },
                  ),
                  DrawerItemTile(
                    title: 'Ai Avatar',
                    assetName: 'assets/icons/person-circle.svg',
                    isSelected: _selectedIndex == 2,
                    onTap: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                  ),
                  DrawerItemTile(
                    title: 'Settings',
                    assetName: 'assets/icons/settings.svg',
                    isSelected: _selectedIndex == 4,
                    onTap: () {
                      setState(() {
                        _selectedIndex = 4;
                      });
                    },
                  ),
                  DrawerItemTile(
                    title: 'AI Autopilot',
                    assetName: 'assets/icons/bx-user-voice.svg',
                    isSelected: _selectedIndex == 5,
                    onTap: () {
                      setState(() {
                        _selectedIndex = 5;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          // The main content area, which changes based on the selected screen
          Expanded(child: _screens[_selectedIndex]),
        ],
      ),
    );
  }
}
