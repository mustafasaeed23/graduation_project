import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';

class FindingButton extends StatelessWidget {
  const FindingButton({
    super.key,
    required this.disabled,
    required this.onPressed,
    required this.text,
    this.color,
  });
  final bool disabled;
  final VoidCallback onPressed;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      disabled: disabled,
      fontSize: 18.r,
      text: text,
      borderRadius: 15.r,
      onPressed: onPressed,
      fontWeight: FontWeight.w500,
      height: 50.h,
      color: color,
    );
  }
}
