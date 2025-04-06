import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class CustomDateFormat {
  static String formatDaysMonthsYears(String theTime, BuildContext context, {bool toLocal = false}) {
    DateTime dateTime;
    if (toLocal) {
      dateTime = DateTime.parse(theTime).toLocal();
    } else {
      dateTime = DateTime.parse(theTime);
    }

    final DateFormat formatter = DateFormat('d-M-yyyy', context.locale.toString());
    return formatter.format(dateTime);
  }

  static String formatSlashedDaysMonthsYears(String theTime, BuildContext context, {bool toLocal = false}) {
    DateTime dateTime;
    if (toLocal) {
      dateTime = DateTime.parse(theTime).toLocal();
    } else {
      dateTime = DateTime.parse(theTime);
    }
    final DateFormat formatter = DateFormat('yyyy/MM/dd', context.locale.toString());
    return formatter.format(dateTime);
  }

  static String formatYearsMonthsDays({required String theTime, String? locale, bool toLocal = false}) {
    if (toLocal) {
      return DateFormat('yyyy-MM-dd', locale.toString()).format(
        DateTime.parse(theTime).toLocal(),
      );
    } else {
      return DateFormat('yyyy-MM-dd', locale.toString()).format(
        DateTime.parse(theTime),
      );
    }
  }

  static String weekDayDayMonth({required String theTime, BuildContext? context, bool toLocal = false}) {
    if (toLocal) {
      return DateFormat('EEE, d MMM', context?.locale.toString()).format(
        DateTime.parse(theTime).toLocal(),
      );
    } else {
      return DateFormat('EEE, d MMM', context?.locale.toString()).format(
        DateTime.parse(theTime),
      );
    }
  }

  static String weekDay({required String theTime, BuildContext? context, bool toLocal = false}) {
    if (toLocal) {
      return DateFormat('EEE', context?.locale.toString()).format(
        DateTime.parse(theTime).toLocal(),
      );
    } else {
      return DateFormat('EEE', context?.locale.toString()).format(
        DateTime.parse(theTime),
      );
    }
  }

  static String DMMMYYYY({
    required String theTime,
    BuildContext? context,
    bool toLocal = false,
  }) {
    if (toLocal) {
      return DateFormat('d MMM, yyyy', context?.locale.toString()).format(
        DateTime.parse(theTime).toLocal(),
      );
    } else {
      return DateFormat('d MMM, yyyy', context?.locale.toString()).format(
        DateTime.parse(theTime),
      );
    }
  }

  static String dayMonth({required String theTime, BuildContext? context, bool toLocal = false}) {
    if (toLocal) {
      return DateFormat('d MMM', context?.locale.toString()).format(
        DateTime.parse(theTime).toLocal(),
      );
    } else {
      return DateFormat('d MMM', context?.locale.toString()).format(
        DateTime.parse(theTime),
      );
    }
  }

  static String timeFormat12hWithoutAM({required String theTime, BuildContext? context, bool toLocal = false}) {
    if (toLocal) {
      return DateFormat("h:mm ", context?.locale.toString()).format(
        DateTime.parse(theTime).toLocal(),
      );
    } else {
      return DateFormat("h:mm ", context?.locale.toString()).format(
        DateTime.parse(theTime),
      );
    }
  }

  static String timeFormat12h({required String theTime, BuildContext? context, bool toLocal = false}) {
    if (toLocal) {
      return DateFormat("h:mm a", context?.locale.toString()).format(
        DateTime.parse(theTime).toLocal(),
      );
    } else {
      return DateFormat("h:mm a", context?.locale.toString()).format(
        DateTime.parse(theTime),
      );
    }
  }

  static String timeFormatAMOrPM({required String theTime, BuildContext? context, bool toLocal = false}) {
    if (toLocal) {
      return DateFormat("a", context?.locale.toString()).format(
        DateTime.parse(theTime).toLocal(),
      );
    } else {
      return DateFormat("a", context?.locale.toString()).format(
        DateTime.parse(theTime),
      );
    }
  }

  static String formatMMM({required String theTime, BuildContext? context, bool toLocal = false}) {
    if (toLocal) {
      return DateFormat('MMM', context?.locale.toString()).format(
        DateTime.parse(theTime).toLocal(),
      );
    } else {
      return DateFormat('MMM', context?.locale.toString()).format(
        DateTime.parse(theTime),
      );
    }
  }

  static String tripTimeFormat({
    required String time,
    BuildContext? context,
  }) {
    return CustomDateFormat.timeFormat12hWithoutAM(theTime: time, context: context);
  }

  static String formatYearsMonthsDaysHurMinSec(String theTime, BuildContext? context, {bool toLocal = false}) {
    DateTime dateTime;
    if (toLocal) {
      dateTime = DateTime.parse(theTime).toLocal();
    } else {
      dateTime = DateTime.parse(theTime);
    }
    final DateFormat formatter = DateFormat('d MMM  hh:mm a', context?.locale.toString());
    return formatter.format(dateTime);
  }

  static String formatHourMinuteAmPm(String theTime, BuildContext? context, {bool toLocal = false}) {
    DateTime dateTime;
    if (toLocal) {
      dateTime = DateTime.parse(
        theTime,
      ).toLocal();
    } else {
      dateTime = DateTime.parse(
        theTime,
      );
    }
    final DateFormat formatter = DateFormat('hh:mm a', context?.locale.toString());
    return formatter.format(dateTime);
  }

  static String formatOnlyHour(String theTime, BuildContext? context, {bool toLocal = false}) {
    DateTime dateTime;
    if (toLocal) {
      dateTime = DateTime.parse(theTime).toLocal();
    } else {
      dateTime = DateTime.parse(theTime);
    }

    final DateFormat formatter = DateFormat('hh', context?.locale.toString());
    return formatter.format(dateTime);
  }

  static String formatOnlyMinute(String theTime, BuildContext? context, {bool toLocal = false}) {
    DateTime dateTime;
    if (toLocal) {
      dateTime = DateTime.parse(theTime).toLocal();
    } else {
      dateTime = DateTime.parse(theTime);
    }
    final DateFormat formatter = DateFormat('mm', context?.locale.toString());
    return formatter.format(dateTime);
  }
}
