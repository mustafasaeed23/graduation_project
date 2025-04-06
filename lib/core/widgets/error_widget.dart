import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/widgets/custom_texts.dart';


class TregoErrorWidget extends StatelessWidget {
  const TregoErrorWidget({
    super.key,
    required this.asset,
    required this.message,
    this.textColor = Colors.black,
    this.secondaryWidget,
  });
  final Color textColor;
  final String asset;
  final String message;
  final Widget? secondaryWidget;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 350.h,
              child: SvgPicture.asset(
                asset,
                height: 350.h,
              ),
            ),
            20.height,
            Text20(
              text: message.tr(),
              textColor: textColor,
              weight: FontWeight.w500,
              alignment: TextAlign.center,
            ),
            20.height,
            if (secondaryWidget != null) secondaryWidget!,
          ],
        ),
      ),
    );
  }
}
