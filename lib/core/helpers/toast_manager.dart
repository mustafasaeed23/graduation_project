import 'package:flutter/material.dart';
import 'package:graduation_project/core/cache_helper/cache_helper.dart';
import 'package:graduation_project/core/constant.dart';
import 'package:toastification/toastification.dart';

import '../theming/colors.dart';
import '../widgets/custom_texts.dart';

class ToastManager {
  static void showInfoToast(String message, context, String description) {
    toastification.show(
      context: context,
      type: ToastificationType.info,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 3),
      title: Text12(
        text: message,
        textColor: Colors.white,
        weight: FontWeight.w700,
      ),
      description: Text10(
        text: description,
        textColor: Colors.white.withOpacity(0.8),
        weight: FontWeight.w600,
      ),
      // icon: SvgPicture.asset(
      //   Assets.infoIcon,
      //   color: Colors.white,
      //   width: 12,
      // ),
      alignment: Alignment.topCenter,
      direction: CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl,
      animationDuration: const Duration(milliseconds: 500),
      primaryColor: Colors.white,
      backgroundColor: AppColors.orangeColor,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      borderRadius: BorderRadius.circular(8),
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
    toastification.show(
      context: context,
      type: ToastificationType.warning,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 3),
      title: Text12(
        text: message,
        textColor: Colors.black87,
        weight: FontWeight.w500,
      ),
      description: Text10(
        text: description,
        textColor: Colors.black87,
        weight: FontWeight.w500,
      ),
      // icon: SvgPicture.asset(
      //   Assets.warningIcon,
      //   color: Colors.black,
      //   width: 12,
      // ),
      alignment: Alignment.topCenter,
      direction: CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl,
      animationDuration: const Duration(milliseconds: 500),
      primaryColor: Colors.white,
      backgroundColor: AppColors.yellowColor,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      borderRadius: BorderRadius.circular(8),
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
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 3),
      title: Text12(
        text: message,
        textColor: Colors.white,
        weight: FontWeight.w600,
      ),
      description: Text10(
        text: description,
        textColor: Colors.white,
        weight: FontWeight.w500,
      ),
      // icon: SvgPicture.asset(
      //   Assets.checkIcon,
      //   color: Colors.white,
      //   width: 12,
      // ),
      alignment: Alignment.topCenter,
      direction: CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl,
      animationDuration: const Duration(milliseconds: 500),
      primaryColor: Colors.white,
      backgroundColor: AppColors.purpleColor,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      borderRadius: BorderRadius.circular(8),
      showProgressBar: false,
      closeButtonShowType: CloseButtonShowType.always,
      closeOnClick: true,
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

  static void showErrorToast(String title, context, String description) {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 3),
      title: Text12(
        text: title,
        textColor: Colors.white,
        weight: FontWeight.w500,
      ),
      description: Text10(
        text: description,
        textColor: Colors.white70,
        weight: FontWeight.w500,
      ),
      // icon: SvgPicture.asset(
      //   Assets.exitIcon,
      //   color: Colors.white,
      //   width: 12,
      // ),
      alignment: Alignment.topCenter,
      direction: CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl,
      animationDuration: const Duration(milliseconds: 500),
      primaryColor: Colors.white,
      backgroundColor: Colors.red,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      borderRadius: BorderRadius.circular(8),
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

  static void showBottomSmallToastSuccess({
    required context,
    required String description,
    Color? bgColor,
    Color? textColor,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 3),
      // title: Text16(
      //   text: title,
      //   textColor: Colors.white,
      //   weight: FontWeight.w500,
      // ),
      description: Text14(
        text: description,
        textColor: textColor ?? Colors.white,
        weight: FontWeight.w500,
      ),
      // icon: SvgPicture.asset(
      //   Assets.removeIcon,
      //   color: Colors.white,
      //   width: 24,
      // ),
      alignment: AlignmentDirectional.bottomEnd,
      direction: CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl,
      animationDuration: const Duration(milliseconds: 500),
      primaryColor: Colors.white,
      backgroundColor: bgColor ?? AppColors.orangeColor,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      borderRadius: BorderRadius.circular(8),
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
