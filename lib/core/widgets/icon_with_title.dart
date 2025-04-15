import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'custom_texts.dart';

class IconWithTitleWidget extends StatelessWidget {
  const IconWithTitleWidget({
    super.key,
    required this.svgIcon,
    required this.title,
    this.iconColor,
    this.iconSize,
    this.titleColor,
    this.titleSize,
    this.onTap,
    this.reversed = false,
    this.padding,
    this.isNetwork = false,
    this.spacing = 0,
    this.hasIcon = true,
    this.weight,
  });
  final String svgIcon;
  final String title;
  final double? titleSize;
  final double? iconSize;
  final double? spacing;
  final Color? iconColor;
  final Color? titleColor;
  final VoidCallback? onTap;
  final bool reversed;
  final bool hasIcon;
  final bool isNetwork;
  final double? padding;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(padding ?? 0),
        child: Row(
          textDirection: reversed ? TextDirection.rtl : TextDirection.ltr,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (hasIcon)
              RepaintBoundary(
                child: isNetwork
                    ? SvgPicture.network(
                        svgIcon,
                        width: iconSize ?? 25.r,
                        color: iconColor,
                      )
                    : SvgPicture.asset(
                        svgIcon,
                        width: iconSize ?? 25.r,
                        color: iconColor,
                      ),
              )
            else
              SizedBox(
                width: iconSize ?? 25.r,
              ),
            SizedBox(
              width: spacing ?? 5.w,
            ),
            Flexible(
              child: Text12(
                text: title,
                size: titleSize ?? 18.r,
                textColor: titleColor,
                maxLines: 1,
                overFlow: TextOverflow.ellipsis,
                weight: weight ?? FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
