import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theming/colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.grey.shade200,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade200,
    foregroundColor: Colors.black,
    elevation: 0,
    centerTitle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.amber,
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: GoogleFonts.poppins(),
    unselectedLabelStyle: GoogleFonts.poppins(),
    type: BottomNavigationBarType.fixed,
  ),
  colorScheme: ColorScheme.light(
    primary: Colors.amber,
    secondary: Colors.amberAccent,
  ),
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: Colors.black87,
    displayColor: Colors.black87,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[900],
    selectedItemColor: Colors.amber,
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: GoogleFonts.poppins(),
    unselectedLabelStyle: GoogleFonts.poppins(),
    type: BottomNavigationBarType.fixed,
  ),
  colorScheme: ColorScheme.dark(
    primary: Colors.amber,
    secondary: Colors.amberAccent,
  ),
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: Colors.white70,
    displayColor: Colors.white70,
  ),
);
