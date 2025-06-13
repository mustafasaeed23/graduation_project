import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/mobile/auto_pilot_screen.dart';
import 'package:graduation_project/mobile/layout/cubit/main_layout_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/mobile/mobile_home_screen.dart';
import 'package:graduation_project/mobile/profile_mobile_screen.dart';
import 'package:graduation_project/mobile/video_screen.dart';

class MainLayoutScreen extends StatelessWidget {
  MainLayoutScreen({super.key});

  final List<Widget> _screens = [
    MobileHomeScreen(),
    VideoScreen(),
    AutoPilotScreen(),
    ProfileMobileScreen(),
  ];

  final List<String> _labels = ['Home', 'Video', 'Ai Autopilot', 'Profile'];
  final List<String> _svgIcons = [
    "assets/icons/home-outline.svg",
    "assets/icons/video_mobile.svg",
    "assets/icons/cloud-upload-outline.svg",
    "assets/icons/person.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainLayoutCubit(),
      child: BlocBuilder<MainLayoutCubit, int>(
        builder: (context, currentIndex) {
          final cubit = context.read<MainLayoutCubit>();

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(_labels[currentIndex], style: GoogleFonts.poppins()),
              centerTitle: true,
            ),
            body: _screens[currentIndex],
            bottomNavigationBar: Container(
              height: 60.h,
              decoration: BoxDecoration(
                color:
                    Theme.of(
                      context,
                    ).bottomNavigationBarTheme.backgroundColor ??
                    Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(_labels.length, (index) {
                  final isSelected = index == currentIndex;

                  return GestureDetector(
                    onTap: () => cubit.changeTab(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration:
                          isSelected
                              ? BoxDecoration(
                                color: AppColors.wamdahSecoundPrimary,
                                borderRadius: BorderRadius.circular(12),
                              )
                              : null,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            _svgIcons[index],
                            color: isSelected ? Colors.white : Colors.grey,
                          ),
                          if (isSelected)
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                _labels[index],
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
