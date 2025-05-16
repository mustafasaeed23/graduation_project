import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cache_helper/cache_helper.dart';

class Text10 extends StatelessWidget {
  final int? maxLines;
  final double? size;
  final Color? textColor;
  final double? height;
  final double? spacing;
  final String? family;
  final TextOverflow? overFlow;
  final TextAlign? alignment;
  final FontWeight? weight;
  final TextDecorationStyle? decorationStyle;
  final TextDecoration? decoration;
  final TextDirection? direction;
  final Color? decorationColor;
  final double? decorationThickness;

  const Text10({
    super.key,
    required this.text,
    this.textColor,
    this.direction,
    this.size,
    this.overFlow,
    this.height,
    this.family,
    this.decorationStyle,
    this.alignment,
    this.weight,
    this.maxLines,
    this.spacing = 0.2,
    this.decoration,
    this.decorationColor,
    this.decorationThickness,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CacheHelper.isEn
          ? TextStyle(
              fontSize: size ?? 10.r,
              fontWeight: weight ?? FontWeight.w400,
              color: textColor ?? Colors.white,
              fontFamily: "NeueHaas",
              height: height,
              letterSpacing: spacing,
              decorationStyle: decorationStyle,
              decorationColor: decorationColor,
              decoration: decoration,
              decorationThickness: decorationThickness,
            )
          : TextStyle(
              fontSize: size ?? 10.r,
              fontWeight: weight ?? FontWeight.w400,
              color: textColor ?? Colors.white,
              fontFamily: "Graphik",
              height: height,
              letterSpacing: spacing,
              decorationStyle: decorationStyle,
              decorationColor: decorationColor,
              decoration: decoration,
              decorationThickness: decorationThickness,
            ),
      textAlign: alignment,
      overflow: overFlow,
      maxLines: maxLines,
      textDirection: direction ?? (CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl),
    );
  }

  withDirectionalOnlyPadding({required int start}) {}
}

class Text12 extends StatelessWidget {
  final int? maxLines;
  final double? size;
  final Color? textColor;
  final double? height;
  final double? spacing;
  final String? family;
  final TextOverflow? overFlow;
  final TextAlign? alignment;
  final TextDirection? direction;
  final FontWeight? weight;
  final TextDecorationStyle? decorationStyle;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final double? decorationThickness;

  const Text12({
    super.key,
    required this.text,
    this.textColor,
    this.direction,
    this.size,
    this.overFlow,
    this.height,
    this.family,
    this.decorationStyle,
    this.alignment,
    this.weight,
    this.maxLines,
    this.spacing = 0.2,
    this.decoration,
    this.decorationColor,
    this.decorationThickness,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CacheHelper.isEn
          ? TextStyle(
              fontSize: size ?? 12.r,
              fontWeight: weight ?? FontWeight.w400,
              color: textColor ?? Colors.white,
              fontFamily: "NeueHaas",
              height: height,
              letterSpacing: spacing,
              decorationStyle: decorationStyle,
              decorationColor: decorationColor,
              decoration: decoration,
              decorationThickness: decorationThickness,
            )
          : TextStyle(
              fontSize: size ?? 12.r,
              fontWeight: weight ?? FontWeight.w400,
              color: textColor ?? Colors.white,
              fontFamily: "Graphik",
              height: height,
              letterSpacing: spacing,
              decorationStyle: decorationStyle,
              decorationColor: decorationColor,
              decoration: decoration,
              decorationThickness: decorationThickness,
            ),
      textAlign: alignment,
      overflow: overFlow,
      maxLines: maxLines,
      textDirection: direction ?? (CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl),
    );
  }
}

class Text14 extends StatelessWidget {
  final int? maxLines;
  final double? size;
  final Color? textColor;
  final double? height;
  final double? spacing;
  final String? family;
  final TextOverflow? overFlow;
  final TextAlign? alignment;
  final FontWeight? weight;
  final TextDecorationStyle? decorationStyle;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final double? decorationThickness;
  final TextDirection? direction;

  const Text14({
    super.key,
    required this.text,
    this.textColor,
    this.direction,
    this.size,
    this.overFlow,
    this.height,
    this.family,
    this.decorationStyle,
    this.alignment,
    this.weight,
    this.maxLines,
    this.spacing = 0.2,
    this.decoration,
    this.decorationColor,
    this.decorationThickness,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CacheHelper.isEn
          ? TextStyle(
              fontSize: size ?? 14.r,
              fontWeight: weight ?? FontWeight.w400,
              color: textColor ?? Colors.white,
              fontFamily: "NeueHaas",
              height: height,
              letterSpacing: spacing,
              decorationStyle: decorationStyle,
              decorationColor: decorationColor,
              decoration: decoration,
              decorationThickness: decorationThickness,
            )
          : TextStyle(
              fontSize: size ?? 14.r,
              fontWeight: weight ?? FontWeight.w400,
              color: textColor ?? Colors.white,
              fontFamily: "Graphik",
              height: height,
              letterSpacing: spacing,
              decorationStyle: decorationStyle,
              decorationColor: decorationColor,
              decoration: decoration,
              decorationThickness: decorationThickness,
            ),
      textAlign: alignment,
      overflow: overFlow,
      maxLines: maxLines,
      textDirection: direction ?? (CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl),
    );
  }
}

class Text16 extends StatelessWidget {
  final int? maxLines;
  final double? size;
  final Color? textColor;
  final double? height;
  final double? spacing;
  final String? family;
  final TextOverflow? overFlow;
  final TextAlign? alignment;
  final FontWeight? weight;
  final TextDecorationStyle? decorationStyle;
  final TextDecoration? decoration;
  final TextDirection? direction;
  final Color? decorationColor;
  final double? decorationThickness;
  final bool reverseTextDirection;
  const Text16({
    super.key,
    this.reverseTextDirection = false,
    required this.text,
    this.textColor,
    this.size,
    this.overFlow,
    this.height,
    this.family,
    this.decorationStyle,
    this.direction,
    this.alignment,
    this.weight,
    this.maxLines,
    this.spacing = 0.2,
    this.decoration,
    this.decorationColor,
    this.decorationThickness,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CacheHelper.isEn
          ? TextStyle(
              fontFamily: "NeueHaas",
              fontSize: size ?? 16.r,
              fontWeight: weight ?? FontWeight.w400,
              color: textColor ?? Colors.white,
              decorationColor: decorationColor,
              decoration: decoration,
              decorationThickness: decorationThickness,
              height: height,
              letterSpacing: spacing,
              decorationStyle: decorationStyle,
            )
          : TextStyle(
              fontSize: size ?? 16.r,
              fontWeight: weight ?? FontWeight.w400,
              color: textColor ?? Colors.white,
              fontFamily: "Graphik",
              height: height,
              letterSpacing: spacing,
              decorationStyle: decorationStyle,
              decorationColor: decorationColor,
              decoration: decoration,
              decorationThickness: decorationThickness,
            ),
      textAlign: alignment,
      overflow: overFlow,
      maxLines: maxLines,
      textDirection: direction ?? (CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl),
    );
  }
}

class Text18 extends StatelessWidget {
  final int? maxLines;
  final double? size;
  final Color? textColor;
  final double? height;
  final double? spacing;
  final String? family;
  final TextOverflow? overFlow;
  final TextAlign? alignment;
  final FontWeight? weight;
  final TextDecorationStyle? decorationStyle;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDirection? direction;
  final double? decorationThickness;
  const Text18({
    super.key,
    required this.text,
    this.textColor,
    this.size,
    this.overFlow,
    this.height,
    this.family,
    this.decorationStyle,
    this.direction,
    this.alignment,
    this.weight,
    this.maxLines,
    this.spacing = 0.2,
    this.decoration,
    this.decorationColor,
    this.decorationThickness,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CacheHelper.isEn
          ? TextStyle(
              fontSize: size ?? 18.r,
              fontWeight: weight ?? FontWeight.w400,
              color: textColor ?? Colors.white,
              height: height,
              letterSpacing: spacing,
              decorationStyle: decorationStyle,
              decorationColor: decorationColor,
              decoration: decoration,
              decorationThickness: decorationThickness,
              fontFamily: "NeueHaas",
            )
          : TextStyle(
              fontSize: size ?? 18.r,
              fontWeight: weight ?? FontWeight.w400,
              color: textColor ?? Colors.white,
              fontFamily: "Graphik",
              height: height,
              letterSpacing: spacing,
              decorationStyle: decorationStyle,
              decorationColor: decorationColor,
              decoration: decoration,
              decorationThickness: decorationThickness,
            ),
      textAlign: alignment,
      overflow: overFlow,
      maxLines: maxLines,
      textDirection: direction ?? (CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl),
    );
  }
}

class Text20 extends StatelessWidget {
  final int? maxLines;
  final double? size;
  final Color? textColor;
  final double? height;
  final double? spacing;
  final String? family;
  final TextOverflow? overFlow;
  final TextAlign? alignment;
  final FontWeight? weight;
  final TextDecorationStyle? decorationStyle;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDirection? direction;
  final double? decorationThickness;
  const Text20({
    super.key,
    required this.text,
    this.textColor,
    this.size,
    this.overFlow,
    this.direction,
    this.height,
    this.family,
    this.decorationStyle,
    this.alignment,
    this.weight,
    this.maxLines,
    this.spacing = 0.2,
    this.decoration,
    this.decorationColor,
    this.decorationThickness,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CacheHelper.isEn
          ? TextStyle(
              fontSize: size ?? 20.r,
              fontWeight: weight ?? FontWeight.w400,
              color: textColor ?? Colors.white,
              height: height,
              letterSpacing: spacing,
              decorationStyle: decorationStyle,
              decorationColor: decorationColor,
              decoration: decoration,
              decorationThickness: decorationThickness,
              fontFamily: "NeueHaas",
            )
          : TextStyle(
              fontSize: size ?? 20.r,
              fontWeight: weight ?? FontWeight.w400,
              color: textColor ?? Colors.white,
              fontFamily: "Graphik",
              height: height,
              letterSpacing: spacing,
              decorationStyle: decorationStyle,
              decorationColor: decorationColor,
              decoration: decoration,
              decorationThickness: decorationThickness,
            ),
      textAlign: alignment,
      overflow: overFlow,
      maxLines: maxLines,
      textDirection: direction ?? (CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl),
    );
  }
}

class Text22 extends StatelessWidget {
  final int? maxLines;
  final double? size;
  final Color? textColor;
  final double? height;
  final double? spacing;
  final String? family;
  final TextOverflow? overFlow;
  final TextAlign? alignment;
  final FontWeight? weight;
  final TextDecorationStyle? decorationStyle;
  final TextDecoration? decoration;
  final TextDirection? direction;
  final Color? decorationColor;
  final double? decorationThickness;
  const Text22({
    super.key,
    required this.text,
    this.textColor,
    this.direction,
    this.size,
    this.overFlow,
    this.height,
    this.family,
    this.decorationStyle,
    this.alignment,
    this.weight,
    this.maxLines,
    this.spacing = 0.2,
    this.decoration,
    this.decorationColor,
    this.decorationThickness,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CacheHelper.isEn
          ? TextStyle(
              fontSize: size ?? 22.r,
              fontWeight: weight ?? FontWeight.w400,
              color: textColor ?? Colors.white,
              height: height,
              letterSpacing: spacing,
              decorationStyle: decorationStyle,
              decorationColor: decorationColor,
              decoration: decoration,
              decorationThickness: decorationThickness,
              fontFamily: "NeueHaas",
            )
          : TextStyle(
              fontSize: size ?? 22.r,
              fontWeight: weight ?? FontWeight.w400,
              color: textColor ?? Colors.white,
              fontFamily: "Graphik",
              height: height,
              letterSpacing: spacing,
              decorationStyle: decorationStyle,
              decorationColor: decorationColor,
              decoration: decoration,
              decorationThickness: decorationThickness,
            ),
      textAlign: alignment,
      overflow: overFlow,
      maxLines: maxLines,
      textDirection: direction ?? (CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl),
    );
  }
}

class Text24 extends StatelessWidget {
  final int? maxLines;
  final double? size;
  final Color? textColor;
  final double? height;
  final double? spacing;
  final String? family;
  final TextOverflow? overFlow;
  final TextAlign? alignment;
  final FontWeight? weight;
  final TextDecorationStyle? decorationStyle;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDirection? direction;
  final double? decorationThickness;
  const Text24({
    super.key,
    required this.text,
    this.textColor,
    this.size,
    this.overFlow,
    this.height,
    this.family,
    this.decorationStyle,
    this.alignment,
    this.weight,
    this.direction,
    this.maxLines,
    this.spacing = 0.2,
    this.decoration,
    this.decorationColor,
    this.decorationThickness,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CacheHelper.isEn
          ? TextStyle(
              fontSize: size ?? 24.r,
              fontWeight: weight ?? FontWeight.w400,
              color: textColor ?? Colors.white,
              fontFamily: "NeueHaas",
              height: height,
              letterSpacing: spacing,
              decorationStyle: decorationStyle,
              decorationColor: decorationColor,
              decoration: decoration,
              decorationThickness: decorationThickness,
            )
          : TextStyle(
              fontSize: size ?? 24.r,
              fontWeight: weight ?? FontWeight.w400,
              color: textColor ?? Colors.white,
              fontFamily: "Graphik",
              height: height,
              letterSpacing: spacing,
              decorationStyle: decorationStyle,
              decorationColor: decorationColor,
              decoration: decoration,
              decorationThickness: decorationThickness,
            ),
      textAlign: alignment,
      overflow: overFlow,
      maxLines: maxLines,
      textDirection: direction ?? (CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl),
    );
  }
}

class Text26 extends StatelessWidget {
  final int? maxLines;
  final double? size;
  final Color? textColor;
  final double? height;
  final double? spacing;
  final String? family;
  final TextOverflow? overFlow;
  final TextAlign? alignment;
  final FontWeight? weight;
  final TextDecorationStyle? decorationStyle;
  final TextDirection? direction;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final double? decorationThickness;
  const Text26({
    super.key,
    required this.text,
    this.textColor,
    this.size,
    this.overFlow,
    this.direction,
    this.height,
    this.family,
    this.decorationStyle,
    this.alignment,
    this.weight,
    this.maxLines,
    this.spacing = 0.2,
    this.decoration,
    this.decorationColor,
    this.decorationThickness,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CacheHelper.isEn
          ? TextStyle(
              fontSize: size ?? 26.r,
              fontWeight: weight ?? FontWeight.w400,
              color: textColor ?? Colors.white,
              height: height,
              letterSpacing: spacing,
              decorationStyle: decorationStyle,
              decorationColor: decorationColor,
              decoration: decoration,
              decorationThickness: decorationThickness,
              fontFamily: "NeueHaas",
            )
          : TextStyle(
              fontSize: size ?? 26.r,
              fontWeight: weight ?? FontWeight.w400,
              color: textColor ?? Colors.white,
              fontFamily: "Graphik",
              height: height,
              letterSpacing: spacing,
              decorationStyle: decorationStyle,
              decorationColor: decorationColor,
              decoration: decoration,
              decorationThickness: decorationThickness,
            ),
      textAlign: alignment,
      overflow: overFlow,
      maxLines: maxLines,
      textDirection: direction ?? (CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl),
    );
  }
}

class Text28 extends StatelessWidget {
  final int? maxLines;
  final double? size;
  final Color? textColor;
  final double? height;
  final double? spacing;
  final String? family;
  final TextOverflow? overFlow;
  final TextAlign? alignment;
  final FontWeight? weight;
  final bool isItalic;
  final Color? decorationColor;
  final TextDirection? direction;
  final TextDecoration? decoration;
  final double? decorationThickness;
  final TextDecorationStyle? decorationStyle;
  const Text28({
    super.key,
    required this.text,
    this.textColor,
    this.size,
    this.overFlow,
    this.height,
    this.family,
    this.decorationStyle,
    this.alignment,
    this.weight,
    this.maxLines,
    this.spacing = 0.2,
    this.isItalic = false,
    this.decoration,
    this.direction,
    this.decorationColor,
    this.decorationThickness,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CacheHelper.isEn
          ? TextStyle(
              fontSize: size ?? 28.r,
              fontWeight: weight ?? FontWeight.w400,
              color: textColor ?? Colors.white,
              height: height,
              letterSpacing: spacing,
              decorationStyle: decorationStyle,
              decorationColor: decorationColor,
              decoration: decoration,
              decorationThickness: decorationThickness,
              fontFamily: "NeueHaas",
            )
          : TextStyle(
              fontSize: size ?? 28.r,
              fontWeight: weight ?? FontWeight.w400,
              color: textColor ?? Colors.white,
              fontFamily: "Graphik",
              height: height,
              letterSpacing: spacing,
              decorationStyle: decorationStyle,
              decorationColor: decorationColor,
              decoration: decoration,
              decorationThickness: decorationThickness,
            ),
      textAlign: alignment,
      overflow: overFlow,
      maxLines: maxLines,
      textDirection: direction ?? (CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl),
    );
  }
}
