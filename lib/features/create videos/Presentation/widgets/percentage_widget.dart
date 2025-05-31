import 'dart:async';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:lottie/lottie.dart';

class LoadingWithPercentage extends StatefulWidget {
  final VoidCallback onButtonPressed;

  const LoadingWithPercentage({super.key, required this.onButtonPressed});

  @override
  State<LoadingWithPercentage> createState() => _LoadingWithPercentageState();
}

class _LoadingWithPercentageState extends State<LoadingWithPercentage> {
  double percentage = 0.0;
  Timer? timer;
  bool showButton = false;

  @override
  void initState() {
    super.initState();
    startLoading();
  }

  void startLoading() {
    const totalDuration = Duration(minutes: 2);
    const updateInterval = Duration(milliseconds: 600);
    final step =
        100 / (totalDuration.inMilliseconds / updateInterval.inMilliseconds);

    timer = Timer.periodic(updateInterval, (timer) {
      if (percentage >= 100) {
        timer.cancel();
        setState(() {
          percentage = 100;
          showButton = true;
        });
      } else {
        setState(() {
          percentage += step;
          if (percentage > 100) percentage = 100;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                value: percentage / 100,
                strokeWidth: 6,
                backgroundColor: AppColors.wamdahBackGround,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.wamdahGoldColor2,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  "assets/animations/Animation - 1748706708268.json",
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 4),
                Text(
                  "${percentage.toInt()}%",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        if (showButton)
          ElevatedButton(
            onPressed: widget.onButtonPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.wamdahSecoundPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              "Continue to video",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
      ],
    );
  }
}
