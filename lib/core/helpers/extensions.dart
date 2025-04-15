import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/date_format.dart';
import 'package:responsive_framework/responsive_framework.dart';


extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }

  void pop({bool? isTrue}) => Navigator.of(this).pop(
        isTrue ?? false,
      );
}

extension StringExtensions on String {
  String get firstTwoChars =>
      (length >= 2) ? substring(0, 2).toUpperCase() : this;
}

extension StringExtension on String {
  String removeSpecialCharacters() {
    return replaceAll('\t', '')
        .replaceAll('\r', '')
        .replaceAll('\n', '')
        .replaceAll('\\', '');
  }
}

// extension StringListExtension on BusTripEntity {
//   String toStringListAndRemoveBraces() {
//     return classes
//         .map((element) => element.className?.tr())
//         .toList()
//         .toString()
//         .replaceAll("[", "")
//         .replaceAll("]", "");
//   }
// }

extension RemoveBracesToString on List<String> {
  String toStringListAndRemoveBraces() {
    return toString().replaceAll("[", "").replaceAll("]", "").replaceAll(",", " -");
  }
}

// extension StringListExtension1 on TrainTripEntity {
//   String toStringListAndRemoveBraces() {
//     return classes
//         .map((element) => element.className?.tr())
//         .toList()
//         .toString()
//         .replaceAll("[", "")
//         .replaceAll("]", "");
//   }
// }

extension DateTimeExtension on DateTime {
  String toCustomFormat() {
    final year = this.year.toString().padLeft(4, '0');
    final month = this.month.toString().padLeft(2, '0');
    final day = this.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }
}

extension IsoStringFormatter on String {
  String formatIsoStringToTime(context) {
    try {
      DateTime dateTime = DateTime.parse(this);
      final String period = dateTime.hour < 12 ? 'AM'.tr() : 'PM'.tr();
      final int formattedHour =
          dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;

      return '${formattedHour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')} - $period';
    } catch (e) {
      // Handle parsing errors or invalid ISO strings
      return 'Invalid DateTime';
    }
  }
}

extension TimeAgoExtension on String {
  String formatIsoStringToRelativeTime(BuildContext context) {
    try {
      DateTime dateTime = DateTime.parse(this);
      Duration difference = DateTime.now().difference(dateTime);

      // Check for negative duration
      if (difference.isNegative) {
        return 'Invalid DateTime';
      }

      if (difference.inMinutes < 60) {
        return '${difference.inMinutes} ${difference.inMinutes == 1 ? "a minute ago".tr() : "minutes ago".tr()}'
            .tr();
      } else if (difference.inMinutes > 60 && difference.inMinutes < 1440) {
        return '${difference.inHours} ${difference.inHours == 1 ? "an hour ago".tr() : "hours ago".tr()}'
            .tr();
      } else {
        return difference.inDays == 1
            ? "Yesterday".tr()
            : CustomDateFormat.weekDayDayMonth(theTime: this, context: context);
      }
    } catch (e) {
      return 'Invalid DateTime';
    }
  }
}

extension RowPaddingExtension on Row {
  Row addPaddingBetweenChildren(double padding) {
    final childrenWithPadding = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      childrenWithPadding.add(children[i]);
      if (i < children.length - 1) {
        childrenWithPadding.add(SizedBox(width: padding));
      }
    }
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: childrenWithPadding,
    );
  }
}

extension DoubleExtraction on String {
  double extractDouble() {
    final numericPart =
        replaceAll(RegExp(r'[^0-9.]'), ''); // Remove non-numeric characters
    return double.tryParse(numericPart) ?? 0.0;
  }
}

extension IPAddressExtension on String {
  String removeLastSegment() {
    List<String> segments = split('.');
    if (segments.length >= 4) {
      segments.removeLast();
      return segments.join('.');
    }
    return this; // If the string doesn't contain a valid IP address, return the original string
  }
}

extension ListExtension<T> on List<T> {
  int indexOfContainingInt(int tableNum) {
    for (int i = 0; i < length; i++) {
      if (this[i].toString().contains(tableNum.toString())) {
        return i;
      }
    }
    return -1;
  }
}

extension ResponsiveFramework on BuildContext {
  bool get isPhone => ResponsiveBreakpoints.of(this).isPhone;
  bool get isMobile => ResponsiveBreakpoints.of(this).isMobile;
  bool get isTablet => ResponsiveBreakpoints.of(this).isTablet;
  bool get isDesktop => ResponsiveBreakpoints.of(this).isDesktop;
  bool get isWidePhoneScreen =>
      (ResponsiveBreakpoints.of(this).screenHeight /
              ResponsiveBreakpoints.of(this).screenWidth) <
          2 &&
      isPhone;
}

// extension SeatTypeExtension on SeatType {
//   String get typeName {
//     switch (this) {
//       case SeatType.empty:
//         return "empty";
//       case SeatType.toilet:
//         return "toilet";
//       case SeatType.seat:
//         return "seat";
//       }
//   }
// }

// extension SeatStatusExtension on SeatStatus {
//   String get statusName {
//     switch (this) {
//       case SeatStatus.available:
//         return "available";
//       case SeatStatus.notAvailable:
//         return "not available";
//       case SeatStatus.reserved:
//         return "reserved";
//       }

//   }
// }

extension SizedBoxExtension on double {
  SizedBox get height => SizedBox(height: h);
  SizedBox get width => SizedBox(width: w);
}

extension SizedBoxExtension1 on int {
  SizedBox get height => SizedBox(height: h);
  SizedBox get width => SizedBox(width: w);
}
