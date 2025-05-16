import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/core/widgets/custom_texts.dart';

class StepWidget extends StatelessWidget {
  const StepWidget({
    super.key,
    required this.stepNumber,
    required this.headTitle,
    required this.subTitle,
    this.circleColor,
    this.fontSize,
  });

  final String stepNumber;
  final String headTitle;
  final String subTitle;
  final Color? circleColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: circleColor ?? AppColors.wamdahGoldColor2,
          child: Text(
            stepNumber,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: fontSize??20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 20),
        Text14(
          text: headTitle,
          textColor: Colors.white,
          weight: FontWeight.w600,
        ),
        SizedBox(height: 10),
        Text12(
          text: subTitle,
          textColor: Colors.white,
          weight: FontWeight.w400,
        ),
      ],
    );
  }
}
