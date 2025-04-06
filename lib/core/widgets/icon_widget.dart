import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_corner_updated/smooth_corner.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    this.onPressed,
    required this.iconAsset,
    this.size,
    this.padding,
    this.iconColor,
    this.bGColor,
    this.border,
    this.radius,
    this.isNetwork = false,
  });
  final VoidCallback? onPressed;
  final String iconAsset;
  final double? size;
  final double? padding;
  final Color? iconColor;
  final Color? bGColor;
  final BorderSide? border;
  final double? radius;
  final bool isNetwork;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SmoothContainer(
        padding: EdgeInsets.all(padding != null ? padding!.r : 10.r),
        smoothness: 1,
        color: bGColor,
        borderRadius: BorderRadius.circular(radius ?? 6.r),
        // foregroundDecoration: BoxDecoration(border: border),
        side: border ?? BorderSide.none,
        child: RepaintBoundary(
          child: isNetwork
              ? SvgPicture.network(
                  iconAsset,
                  width: size ?? 25.r,
                  color: iconColor,
                  height: 25.r,
                )
              : SvgPicture.asset(
                  iconAsset,
                  width: size ?? 25.r,
                  color: iconColor,
                ),
        ),
      ),
    );
  }
}
