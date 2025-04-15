import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/date_format.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/core/widgets/custom_texts.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown(
      {super.key,
      required this.dropdownValue,
      required this.options,
      required this.hintText,
      this.backgroundColor,
      this.borderColor,
      this.fontSize,
      required this.onChanged,
      this.height,
      this.width,
      this.fromFilteringTimes = false,
      this.shadow});
  final Color? borderColor;
  dynamic dropdownValue;
  final List<dynamic> options;
  final String hintText;
  final Color? backgroundColor;
  final double? fontSize;
  final Function(dynamic) onChanged;
  final double? height;
  final double? width;
  final bool fromFilteringTimes;
  final BoxShadow? shadow;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(15.h),
        border: Border.all(
          width: 1,
          color: widget.borderColor ?? AppColors.purpleColor,
        ),
        boxShadow: widget.shadow != null ? [widget.shadow!] : [],
      ),
      child: DropdownButton<dynamic>(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: context.isDesktop || context.isTablet ? 15.h : 5.h),
        borderRadius: BorderRadius.circular(15.h),
        value: widget.dropdownValue,
        onChanged: (dynamic value) {
          setState(() {
            widget.dropdownValue = value!;
            widget.onChanged(value);
          });
        },
        hint: Text16(
          text: widget.hintText.tr(),
          textColor: Colors.black54,
          weight: FontWeight.w500,
          size: widget.fontSize,
        ),
        underline: const SizedBox(),
        isExpanded: true,
        dropdownColor: Colors.white,
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
        selectedItemBuilder: (BuildContext context) {
          return widget.options.map((dynamic value) {
            return Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text16(
                text: widget.fromFilteringTimes
                    ? "${CustomDateFormat.timeFormat12h(theTime: value.toString().split(' to ')[0], context: context)} ${"To".tr()} ${CustomDateFormat.timeFormat12h(theTime: value.toString().split(' to ')[1], context: context)}"
                    : value.toString().tr(),
                textColor: Colors.black,
                weight: FontWeight.w500,
                size: widget.fontSize,
              ),
            );
          }).toList();
        },
        items: widget.options.map<DropdownMenuItem<dynamic>>((dynamic value) {
          return DropdownMenuItem<dynamic>(
            value: value,
            child: Text16(
              text: widget.fromFilteringTimes
                  ? "${CustomDateFormat.timeFormat12h(theTime: value.toString().split(' to ')[0], context: context)} ${"To".tr()} ${CustomDateFormat.timeFormat12h(theTime: value.toString().split(' to ')[1], context: context)}"
                  : value.toString().tr(),
              textColor: Colors.black,
              weight: FontWeight.w500,
            ),
          );
        }).toList(),
      ),
    );
  }
}
