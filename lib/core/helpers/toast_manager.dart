import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/cache_helper/cache_helper.dart';
import 'package:graduation_project/core/constant.dart';
import 'package:toastification/toastification.dart';

import '../theming/assets.dart';
import '../theming/colors.dart';
import '../widgets/custom_texts.dart';

class ToastManager {
  static void showInfoToast(String message, context, String description) {
    toastification.dismissAll();
    toastification.show(
      context: context,
      type: ToastificationType.info,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 3),
      title: Text16(
        text: message,
        textColor: Colors.white,
        weight: FontWeight.w700,
      ),
      description: Text14(
        text: description,
        textColor: Colors.white.withOpacity(0.8),
        weight: FontWeight.w600,
        maxLines: 3,
      ),
      icon: SvgPicture.asset(
        Assets.infoIcon,
        color: Colors.white,
        height: 24.r,
      ),
      alignment: Alignment.topCenter,
      direction: CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl,
      animationDuration: const Duration(milliseconds: 500),
      primaryColor: Colors.white,
      backgroundColor: AppColors.orangeColor,
      foregroundColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
      borderRadius: BorderRadius.circular(8.r),
      showProgressBar: false,
      closeButtonShowType: CloseButtonShowType.always,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => printDebug('Toast ${toastItem.id} tapped'),
        onCloseButtonTap: (toastItem) => toastification.dismiss(toastItem),
        onAutoCompleteCompleted:
            (toastItem) =>
                printDebug('Toast ${toastItem.id} auto complete completed'),
        onDismissed:
            (toastItem) => printDebug('Toast ${toastItem.id} dismissed'),
      ),
    );
  }

  static void showWarningToast(String message, context, String description) {
    toastification.dismissAll();
    toastification.show(
      context: context,
      type: ToastificationType.warning,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 3),
      title: Text16(
        text: message,
        textColor: Colors.black87,
        weight: FontWeight.w500,
      ),
      description: Text14(
        text: description,
        textColor: Colors.black87,
        weight: FontWeight.w500,
        maxLines: 3,
      ),
      icon: SvgPicture.asset(
        Assets.warningIcon,
        color: Colors.black,
        height: 24.r,
      ),
      alignment: Alignment.topCenter,
      direction: CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl,
      animationDuration: const Duration(milliseconds: 500),
      primaryColor: Colors.white,
      backgroundColor: AppColors.yellowColor,
      foregroundColor: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
      borderRadius: BorderRadius.circular(8.r),
      showProgressBar: false,
      closeButtonShowType: CloseButtonShowType.always,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => printDebug('Toast ${toastItem.id} tapped'),
        onCloseButtonTap: (toastItem) => toastification.dismiss(toastItem),
        onAutoCompleteCompleted:
            (toastItem) =>
                printDebug('Toast ${toastItem.id} auto complete completed'),
        onDismissed:
            (toastItem) => printDebug('Toast ${toastItem.id} dismissed'),
      ),
    );
  }

  static void showSuccessToast(String message, context, String description) {
    toastification.dismissAll();
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 3),
      title: Text16(
        text: message,
        textColor: Colors.white,
        weight: FontWeight.w600,
      ),
      description: Text14(
        text: description,
        textColor: Colors.white,
        weight: FontWeight.w500,
        maxLines: 3,
      ),
      icon: SvgPicture.asset(
        Assets.checkIcon,
        color: Colors.white,
        height: 24.r,
      ),
      alignment: Alignment.topCenter,
      direction: CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl,
      animationDuration: const Duration(milliseconds: 500),
      primaryColor: Colors.white,
      backgroundColor: AppColors.purpleColor,
      foregroundColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
      borderRadius: BorderRadius.circular(8.r),
      showProgressBar: false,
      closeButtonShowType: CloseButtonShowType.always,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => printDebug('Toast ${toastItem.id} tapped'),
        onCloseButtonTap: (toastItem) => toastification.dismiss(toastItem),
        onAutoCompleteCompleted:
            (toastItem) =>
                printDebug('Toast ${toastItem.id} auto complete completed'),
        onDismissed:
            (toastItem) => printDebug('Toast ${toastItem.id} dismissed'),
      ),
    );
  }

  static void showErrorToast(String title, context, String description) {
    toastification.dismissAll();
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 3),
      title: Text16(
        text: title,
        textColor: Colors.white,
        weight: FontWeight.w600,
      ),
      description: Text14(
        text: description,
        textColor: Colors.white70,
        weight: FontWeight.w500,
        maxLines: 3,
      ),
      icon: SvgPicture.asset(
        Assets.removeIcon,
        color: Colors.white,
        height: 24.r,
      ),
      alignment: Alignment.topCenter,
      direction: CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl,
      animationDuration: const Duration(milliseconds: 500),
      primaryColor: Colors.white,
      backgroundColor: AppColors.redColor,
      foregroundColor: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
      borderRadius: BorderRadius.circular(8.r),
      showProgressBar: false,
      closeButtonShowType: CloseButtonShowType.always,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => printDebug('Toast ${toastItem.id} tapped'),
        onCloseButtonTap: (toastItem) => toastification.dismiss(toastItem),
        onAutoCompleteCompleted:
            (toastItem) =>
                printDebug('Toast ${toastItem.id} auto complete completed'),
        onDismissed:
            (toastItem) => printDebug('Toast ${toastItem.id} dismissed'),
      ),
    );
  }

  static void wishListToastSuccess(
    String title,
    context,
    String description, {
    Color backgroundColor = AppColors.orangeColor,
    AlignmentGeometry alignment = Alignment.bottomCenter,
  }) {
    toastification.dismissAll();
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 3),
      description: Text14(
        text: description,
        textColor: Colors.white,
        weight: FontWeight.w500,
        maxLines: 3,
      ),
      alignment: alignment,
      direction: CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl,
      animationDuration: const Duration(milliseconds: 500),
      primaryColor: Colors.white,
      backgroundColor: backgroundColor,
      foregroundColor: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
      borderRadius: BorderRadius.circular(8.r),
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.always,
      closeOnClick: true,
      dismissDirection: DismissDirection.horizontal,
      pauseOnHover: true,
      applyBlurEffect: false,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => printDebug('Toast ${toastItem.id} tapped'),
        onCloseButtonTap: (toastItem) => toastification.dismiss(toastItem),
        onAutoCompleteCompleted:
            (toastItem) =>
                printDebug('Toast ${toastItem.id} auto complete completed'),
        onDismissed:
            (toastItem) => printDebug('Toast ${toastItem.id} dismissed'),
      ),
    );
  }
}
