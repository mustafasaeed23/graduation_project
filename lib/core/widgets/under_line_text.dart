import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/theming/colors.dart';

import 'custom_texts.dart';

class UnderLineText extends StatelessWidget {
  const UnderLineText({
    super.key,
    required this.text,
    this.size,
    this.textColor,
    this.onTap,
    this.weight,
    this.height,
    this.underLineColor,
    this.direction,
  });
  final String text;
  final double? size;
  final Color? textColor;
  final Color? underLineColor;
  final VoidCallback? onTap;
  final FontWeight? weight;
  final double? height;
  final TextDirection? direction;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: underLineColor ?? AppColors.purpleColor, // Set the color of the line
              width: 1.0, // Set the width of the line
            ),
          ),
        ),
        child: Text14(
          text: text,
          size: size,
          weight: weight ?? FontWeight.w400,
          height: height ?? 1.5.r,
          textColor: textColor ?? AppColors.purpleColor,
          direction: direction,
        ),
      ),
    );
  }
}
