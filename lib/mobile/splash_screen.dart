import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routing/routes.dart';
import 'package:graduation_project/core/theming/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _imageController;
  late AnimationController _textController;
  late Animation<Offset> _imageOffset;
  late Animation<Offset> _textOffset;

  @override
  void initState() {
    super.initState();

    _imageController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500), // slower
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500), // slower
    );

    _imageOffset = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // from right
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _imageController, curve: Curves.easeOut));

    _textOffset = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // from left
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));

    _imageController.forward();
    _textController.forward();

    Timer(const Duration(seconds: 5), () {
      context.pushNamed(Routes.onboardingScreen);
    });
  }

  @override
  void dispose() {
    _imageController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _imageOffset,
              child: Image.asset("assets/images/logo2.png"),
            ),
            const SizedBox(height: 20),
            SlideTransition(
              position: _textOffset,
              child: Text(
                "Wamdah",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(color: AppColors.wamdahGoldColor2, blurRadius: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
