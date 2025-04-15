import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cache_helper/cache_helper.dart';
import '../helpers/service_locator.dart';
import '../theming/colors.dart';
import '../utilies/app_preferences.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final bool? obscureText;
  final bool? autofocus;
  final bool? autocorrect;
  final bool? enableSuggestions;
  final bool? readOnly;
  final bool? showCursor;
  final TextStyle? hintStyle;
  final Color? textColor;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final FormFieldSetter<String>? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? enabled;
  final autofillHints;
  final EdgeInsets? contentPadding;
  final EdgeInsets? padding;
  final bool? expands;
  final int? maxLines;
  final int? minLines;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? textSize;
  final TextAlign? textAlign;
  final FontWeight? textWeight;
  final FocusNode? focusNode;
  final InputBorder? errorBorder;
  final bool isTextDirectionReversed;
  final void Function()? onEditingComplete;
  const CustomTextFormField(
      {super.key,
      this.controller,
      this.onEditingComplete,
      this.isTextDirectionReversed = false,
      this.textAlign,
      this.padding,
      this.textColor,
      this.textWeight,
      this.textSize,
      this.hintStyle,
      this.hintText,
      this.labelText,
      this.backgroundColor,
      this.helperText,
      this.borderColor,
      this.borderWidth,
      this.errorText,
      this.obscureText = false,
      this.autofocus = false,
      this.autocorrect = true,
      this.enableSuggestions = true,
      this.readOnly = false,
      this.showCursor,
      this.maxLength,
      this.keyboardType,
      this.textInputAction,
      this.onChanged,
      this.validator,
      this.borderRadius,
      this.onSaved,
      this.inputFormatters,
      this.prefixIcon,
      this.suffixIcon,
      this.enabled,
      this.autofillHints,
      this.contentPadding,
      this.expands,
      this.maxLines,
      this.minLines,
      this.onFieldSubmitted,
      this.buildCounter,
      this.scrollPhysics,
      this.onTap,
      this.errorBorder,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        cursorColor: textColor,
        onEditingComplete: onEditingComplete,
        textAlign: textAlign ?? TextAlign.start,
        style: CacheHelper.isEn
            ? TextStyle(
                fontSize: textSize ?? 13.r,
                fontWeight: textWeight ?? FontWeight.w400,
                color: textColor ?? Colors.white,
                height: 1.3,
                letterSpacing: 0.2,
                fontFamily: "NeueHaas",
              )
            : TextStyle(
                fontSize: textSize ?? 13.r,
                fontWeight: textWeight ?? FontWeight.w400,
                color: textColor ?? Colors.white,
                height: 1.3,
                letterSpacing: 0.2,
                fontFamily: "Graphik",
              ),
        autofillHints: autofillHints,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        autovalidateMode: AutovalidateMode.onUnfocus,
        controller: controller,
        obscureText: obscureText!,
        autofocus: autofocus!,
        autocorrect: autocorrect!,
        enableSuggestions: enableSuggestions!,
        readOnly: readOnly!,
        showCursor: showCursor,
        maxLength: maxLength,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onChanged: onChanged,
        validator: validator,
        onSaved: onSaved,
        textDirection: isTextDirectionReversed
            ? CacheHelper.isEn
                ? TextDirection.rtl
                : TextDirection.ltr
            : CacheHelper.isEn
                ? TextDirection.ltr
                : TextDirection.rtl,
        inputFormatters: inputFormatters,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          errorStyle: CacheHelper.isEn
              ? TextStyle(
                  fontSize: 13.r,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                  letterSpacing: 0.2,
                  fontFamily: "NeueHaas",
                )
              : TextStyle(
                  fontSize: 13.r,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                  letterSpacing: 0.2,
                  fontFamily: "Graphik",
                ),
          labelStyle: hintStyle ??
              (CacheHelper.isEn
                  ? TextStyle(
                      fontSize: textSize ?? 14.r,
                      fontWeight: textWeight ?? FontWeight.w400,
                      color: textColor ?? Colors.white,
                      height: 1.3,
                      fontFamily: "NeueHaas",
                    )
                  : TextStyle(
                      fontSize: textSize ?? 14.r,
                      fontWeight: textWeight ?? FontWeight.w400,
                      color: textColor ?? Colors.white,
                      height: 1.3,
                      fontFamily: "Graphik",
                    )),
          fillColor: backgroundColor ?? Colors.transparent,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: borderWidth == null
                ? BorderSide.none
                : BorderSide(
                    color: borderColor ??
                        (getIt.get<AppPreferences>().getTheme() == "light"
                            ? AppColors.purpleColor.withOpacity(0.4)
                            : Colors.white.withOpacity(0.3)),
                    width: borderWidth!,
                  ),
            borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          ),
          border: OutlineInputBorder(
            borderSide: borderWidth == null
                ? BorderSide.none
                : BorderSide(
                    color: borderColor ??
                        (getIt.get<AppPreferences>().isLight()
                            ? AppColors.purpleColor.withOpacity(0.4)
                            : Colors.white.withOpacity(0.3)),
                    width: borderWidth!,
                  ),
            borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          ),

          ///on error
          errorBorder: errorBorder ??
              OutlineInputBorder(
                borderSide: borderWidth == null
                    ? BorderSide.none
                    : BorderSide(
                        color: borderColor ??
                            (getIt.get<AppPreferences>().isLight()
                                ? AppColors.purpleColor.withOpacity(0.4)
                                : Colors.white.withOpacity(0.3)),
                        width: borderWidth!,
                      ),
                borderRadius: borderRadius ?? BorderRadius.circular(10.r),
              ),

          ///wna dayes 3leeh
          focusedBorder: OutlineInputBorder(
            borderSide: borderWidth == null
                ? BorderSide.none
                : BorderSide(
                    color: borderColor ??
                        (getIt.get<AppPreferences>().isLight()
                            ? AppColors.purpleColor.withOpacity(0.4)
                            : Colors.white.withOpacity(0.3)),
                    width: borderWidth!,
                  ),
            borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: borderWidth == null
                ? BorderSide.none
                : BorderSide(
                    color: borderColor ?? Colors.grey.shade500,
                    width: borderWidth!,
                  ),
            borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          ),
          labelText: labelText,
          hintStyle: hintStyle ??
              (CacheHelper.isEn
                  ? TextStyle(
                      fontSize: textSize ?? 13.r,
                      fontWeight: textWeight ?? FontWeight.w400,
                      color: textColor ?? Colors.white,
                      height: 1.3,
                      letterSpacing: 0.2,
                      fontFamily: "NeueHaas",
                    )
                  : TextStyle(
                      fontSize: textSize ?? 13.r,
                      fontWeight: textWeight ?? FontWeight.w400,
                      color: textColor ?? Colors.white,
                      height: 1.3,
                      letterSpacing: 0.2,
                      fontFamily: "Graphik",
                    )),
          hintText: hintText,
          helperText: helperText,
          errorText: errorText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabled: enabled ?? true,
          contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        ),
        expands: expands ?? false,
        maxLines: maxLines ?? 1,
        minLines: minLines,
        onFieldSubmitted: onFieldSubmitted,
        scrollPhysics: scrollPhysics,
        onTap: onTap,
        focusNode: focusNode,
      ),
    );
  }
}
