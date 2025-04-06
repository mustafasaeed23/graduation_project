import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/helpers/extensions.dart';

import '../theming/colors.dart';
import 'custom_texts.dart';

class BackgroundedText extends StatelessWidget {
  const BackgroundedText({
    super.key,
    this.textSize,
    this.textColor,
    this.backgroundColor,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    required this.text,
    this.hasChevron = false,
    this.onPressed,
    this.hasPrefix = false,
    this.prefixIconAsset,
    this.border,
    this.textWeight = FontWeight.w600,
    this.isReversed = false,
    this.iconSize,
    this.enabled = true,
  });
  final String text;
  final double? textSize;
  final Color? textColor;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final bool hasChevron;
  final bool hasPrefix;
  final String? prefixIconAsset;
  final VoidCallback? onPressed;
  final FontWeight textWeight;
  final Border? border;
  final bool isReversed;
  final double? iconSize;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onPressed : null,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 20.w, vertical: verticalPadding ?? 5.h),
        decoration: BoxDecoration(
          color: !enabled ? Colors.grey : (backgroundColor ?? AppColors.orangeColor),
          borderRadius: BorderRadius.circular(borderRadius ?? 20.r),
          border: border,
        ),
        child: IntrinsicWidth(
          child: Row(
            textDirection: isReversed ? TextDirection.rtl : TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (hasPrefix)
                SvgPicture.asset(
                  prefixIconAsset!,
                  color: textColor ?? Colors.white,
                  height: iconSize ?? 20.r,
                ),
              if (hasPrefix) 10.width,
              Flexible(
                child: Text12(
                  text: text,
                  textColor: textColor ?? Colors.white,
                  size: textSize,
                  weight: textWeight,
                  spacing: 0.3,
                ),
              ),
              if (hasChevron) 10.width,
              if (hasChevron)
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: iconSize ?? 15.r,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
