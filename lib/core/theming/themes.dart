import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/theming/styles.dart';

import 'colors.dart';

final ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent/status bar is hidden.
      statusBarIconBrightness: Brightness.light, // For iOS: status bar text color
    ),
    backgroundColor: AppColors.scaffoldBackground,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  timePickerTheme: TimePickerThemeData(
    backgroundColor: Colors.white,
    helpTextStyle: style14grey.copyWith(
      color: AppColors.purpleColor,
      fontWeight: FontWeight.w600,
      fontSize: 18.r,
    ),
    cancelButtonStyle: ButtonStyle(
      textStyle: WidgetStatePropertyAll(
        style14grey.copyWith(
          color: AppColors.purpleColor,
          fontWeight: FontWeight.w500,
          fontSize: 16.r,
        ),
      ),
    ),
    confirmButtonStyle: ButtonStyle(
      textStyle: WidgetStatePropertyAll(
        style14grey.copyWith(
          color: AppColors.purpleColor,
          fontWeight: FontWeight.w500,
          fontSize: 16.r,
        ),
      ),
    ),
    dayPeriodTextStyle: style14grey.copyWith(
      color: AppColors.purpleColor,
      fontWeight: FontWeight.w500,
      fontSize: 16.r,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey,
  ),
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  primaryColor: AppColors.purpleColor,
);

final ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    elevation: 0,
    scrolledUnderElevation: 0,
    color: Color(0xff222225),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey[600],
  ),
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  primaryColor: Colors.white,
);
