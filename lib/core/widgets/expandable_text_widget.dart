import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/theming/styles.dart';

import '../theming/colors.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  double lineHeight;
  double textHeight;
  ExpandableTextWidget({super.key, required this.text, this.lineHeight = 1, this.textHeight = 180});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > widget.textHeight) {
      firstHalf = widget.text.substring(0, widget.textHeight.toInt());
      secondHalf = widget.text.substring(widget.textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          height: widget.lineHeight,
          color: Colors.grey, // Default text color
        ),
        children: [
          TextSpan(
            text: hiddenText
                ? '$firstHalf...' // Display first half with ellipsis
                : (firstHalf + secondHalf),
            style: style14grey.copyWith(height: 1.5),
          ),
          TextSpan(
            text: " ${hiddenText ? 'Show more'.tr() : 'Show less'.tr()}",
            style: style14grey.copyWith(
              color: AppColors.purpleColor,
              fontWeight: FontWeight.w600,
              fontSize: 14.r,
              height: 1.5,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(
                  () {
                    hiddenText = !hiddenText;
                  },
                );
              },
          ),
        ],
      ),
    );
  }
}
