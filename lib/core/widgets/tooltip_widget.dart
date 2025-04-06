import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/cache_helper/cache_helper.dart';

class TooltipWidget extends StatelessWidget {
  final Color iconColor;
   const TooltipWidget({
    
    super.key, required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      preferBelow: true,
      showDuration: const Duration(seconds: 5),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      textStyle: CacheHelper.isEn
          ?  TextStyle(
              color: Colors.black,
              fontSize: 14.h,
              fontFamily: "NeueHaas",
            )
          :  TextStyle(
              color: Colors.black,
              fontSize: 14.h,
              fontFamily: "Graphik",
            ),
      textAlign: TextAlign.start,
      message:
          "At least 8 characters \n Includes an uppercase letter \n Includes a lowercase letter \n Includes a number \n No spaces".tr(),
      child: IconButton(
        iconSize: 25.h,
        onPressed: () {},
        icon: const Icon(Icons.info_outline),
        color: iconColor,
      ),
    );
  }
}
