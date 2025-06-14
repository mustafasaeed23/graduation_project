import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routing/routes.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/mobile/theme/bloc/theme_bloc.dart';
import 'package:graduation_project/mobile/theme/bloc/theme_event.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/images/onboardin1.jpg',
      'title': "Welcome to Wamdah".tr(),
      'description': 'Explore quality and value at your fingertips.'.tr(),
    },
    {
      'image': 'assets/images/onBoadringImage.png',
      'title': "Find the Best Products".tr(),
      'description': 'Browse a wide selection tailored just for you.'.tr(),
    },
    {
      'image': 'assets/images/onboarding2.jpg',
      'title': "Get Started Now".tr(),
      'description': 'Enjoy a seamless shopping experience.'.tr(),
    },
  ];

  void _nextPage() {
    if (_currentPage == _pages.length - 1) {
      context.pushNamed(Routes.layoutScreen); // Navigate to home or login
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void _toggleTheme() {
    context.read<ThemeBloc>().add(ThemeToggled());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
        actions: [
          // Language toggle button (optional, keep your own implementation)
          // TextButton(
          //   onPressed: _toggleLanguage,
          //   child: Text(
          //     context.locale.languageCode == 'en' ? 'عربي' : 'EN',
          //     style: GoogleFonts.poppins(
          //       color: theme.appBarTheme.foregroundColor,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 16,
          //     ),
          //   ),
          // ),
          IconButton(
            onPressed: _toggleTheme,
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              color: theme.appBarTheme.foregroundColor,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (_, index) {
                final page = _pages[index];
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(page['image']!, height: 300.h),
                      SizedBox(height: 40.h),
                      Text(
                        page['title']!,
                        style: GoogleFonts.poppins(
                          color:
                              theme.textTheme.bodyMedium?.color ?? Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        page['description']!,
                        style: GoogleFonts.poppins(
                          color:
                              theme.textTheme.bodyMedium?.color?.withOpacity(
                                0.7,
                              ) ??
                              Colors.black54,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _pages.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                width: _currentPage == index ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color:
                      _currentPage == index
                          ? AppColors.wamdahGoldColor2
                          : theme.brightness == Brightness.dark
                          ? Colors.grey.shade700
                          : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ElevatedButton(
              onPressed: _nextPage,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: AppColors.wamdahGoldColor2,
                minimumSize: const Size.fromHeight(50),
              ),
              child: Text(
                _currentPage == _pages.length - 1
                    ? "Get Started".tr()
                    : "Next".tr(),
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  // void _toggleLanguage() {
  //   // Your existing language toggle function here
  //   if (context.locale.languageCode == 'en') {
  //     context.setLocale(const Locale('ar'));
  //   } else {
  //     context.setLocale(const Locale('en'));
  //   }
  // }
}
