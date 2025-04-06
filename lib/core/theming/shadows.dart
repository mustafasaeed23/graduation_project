import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/theming/colors.dart';


final defaultBoxShadow = BoxShadow(
  color: Colors.black45,
  spreadRadius: -5.r,
  blurRadius: 12.r,
  offset: Offset(0, 5.h), // changes position of shadow
);
final tripOptionShadow = BoxShadow(
  color: AppColors.purpleColor,
  spreadRadius: -1.r,
  blurRadius: 2.r,
  offset: const Offset(0,0),
);
final tregoNavBarShadow = BoxShadow(
  color: Colors.black26,
  spreadRadius: -1.r,
  blurRadius: 12.r,
  offset: Offset(0, 8.h),
);

final tripTextFieldShadow = BoxShadow(
  color: AppColors.purpleColor,
  spreadRadius: -1.r,
  blurRadius: 5.r,
  offset: const Offset(0, 0),
);
