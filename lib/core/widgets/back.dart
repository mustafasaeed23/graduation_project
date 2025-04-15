import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/cache_helper/cache_helper.dart';
import 'package:graduation_project/core/helpers/extensions.dart';

class Back extends StatelessWidget {
  const Back({
    super.key,
    this.reversed = false,
    this.iconSize,
    this.bGColor,
    this.iconColor,
    this.border,
    this.onPressed,
    this.icon,
  });
  final bool reversed;
  final Color? iconColor;
  final double? iconSize;
  final Color? bGColor;
  final Border? border;
  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ??
          () {
            context.pop();
          },
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: Colors.transparent),
            color: bGColor ?? Colors.transparent,
          ),
          child: Center(
            child: Transform.rotate(
              angle: icon == null
                  ? !CacheHelper.isEn
                      ? 3.14
                      : 0
                  : 0,
              child: Icon(
                textDirection: TextDirection.ltr,
                icon ?? (reversed ? Icons.arrow_forward_ios : Icons.arrow_back_ios_new),
                size: iconSize ?? 20.h,
                color: iconColor ?? Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
