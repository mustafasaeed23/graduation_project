import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theming/colors.dart';
import 'custom_texts.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final BorderSide? borderSide;
  final double? elevation;
  final bool? enableShadow;
  final bool disabled;
  final List<Color>? gradientColors;
  final bool isIcon;
  final String? iconAsset;
  final Color iconColor;
  final double iconSize;

  final List<BoxShadow>? boxShadow;
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.borderRadius,
    this.borderSide,
    this.elevation,
    this.enableShadow,
    this.disabled = false,
    this.boxShadow,
    this.iconSize = 20,
    this.iconColor = Colors.white,
    this.isIcon = false,
    this.iconAsset,
    this.gradientColors,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.disabled ? null : widget.onPressed,
      onTapDown: (_) {
        setState(() {
          if (widget.disabled) return;
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          if (widget.disabled) return;

          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          if (widget.disabled) return;

          _isPressed = false;
        });
      },
      child: SizedBox(
        height: widget.height ?? 60.h,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: widget.width ?? MediaQuery.of(context).size.width * 0.9,
          margin: EdgeInsets.symmetric(horizontal: _isPressed ? 2.w : 0, vertical: _isPressed ? 1.h : 0)
              .add(widget.margin ?? EdgeInsets.zero),
          decoration: BoxDecoration(
            gradient: widget.gradientColors != null
                ? LinearGradient(colors: widget.gradientColors!, end: Alignment.bottomRight, begin: Alignment.topLeft)
                : null,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
            border: Border.all(color: widget.borderSide?.color ?? Colors.transparent),
            color: widget.disabled ? Colors.grey : widget.color ?? AppColors.purpleColor,
            boxShadow: widget.boxShadow ??
                [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: -1,
                    blurRadius: 5.h,
                  ),
                ],
          ),
          child: Center(
            child: !widget.isIcon
                ? Text20(
                    text: widget.text,
                    textColor: widget.textColor ?? Colors.white,
                    size: _isPressed ? widget.fontSize ?? 20.r - 1.r : widget.fontSize,
                    weight: widget.fontWeight,
                  )
                : SvgPicture.asset(
                    widget.iconAsset!,
                    color: widget.iconColor,
                    width: widget.iconSize,
                  ),
          ),
        ),
      ),
    );
  }
}
