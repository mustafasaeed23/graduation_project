import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/widgets/trego_loading_lottie.dart';

import '../cache_helper/cache_helper.dart';

void showLoading({EasyLoadingMaskType maskType = EasyLoadingMaskType.black}) {
  EasyLoading.show(
    maskType: maskType,
    status: "Loading..".tr(),
    indicator: const TregoLoading(),
  );
}

void showCustomLoading({
  EasyLoadingMaskType maskType = EasyLoadingMaskType.black,
  Widget? indicator,
  required String message,
  bool dismissOnTap = true,
}) {
  EasyLoading.show(
    dismissOnTap: dismissOnTap,
    maskType: maskType,
    status: message,
    indicator: indicator,
  );
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.wave
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 35.0
    ..radius = 10.0
    ..userInteractions = false
    ..dismissOnTap = false
    ..textStyle =
        CacheHelper.isEn
            ? TextStyle(
              fontFamily: "NeueHaas",
              fontSize: 16.h,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            )
            : TextStyle(
              fontFamily: "Graphik",
              fontSize: 16.h,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            );
}

// void hideLoading() {
//   EasyLoading.dismiss();
// }

void showError(String message) {
  EasyLoading.dismiss();

  EasyLoading.showError(message, dismissOnTap: true);
}

void showSuccess(String message) {
  EasyLoading.dismiss();

  EasyLoading.showSuccess(message, dismissOnTap: true);
}

void showInfo(String message) {
  EasyLoading.dismiss();

  EasyLoading.showInfo(message, dismissOnTap: true);
}
