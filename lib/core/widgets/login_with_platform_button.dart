import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/helpers/extensions.dart';

import 'custom_texts.dart';

class LoginWithPlatformButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final String text;
  final String assetPath;
  final VoidCallback onTap;
  const LoginWithPlatformButton({
    super.key,
    required this.buttonColor,
    required this.textColor,
    required this.text,
    required this.assetPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: buttonColor,
          boxShadow: const [
            BoxShadow(blurRadius: 4, color: Colors.grey, blurStyle: BlurStyle.outer),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RepaintBoundary(
              child: SvgPicture.asset(
                assetPath,
                height: 24.r,
              ),
            ),
            20.width,
            Text16(
              size: 17.r,
              text: text,
              textColor: textColor,
              weight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
