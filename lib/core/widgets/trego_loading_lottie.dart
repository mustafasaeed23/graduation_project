import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../theming/colors.dart';

class TregoLoading extends StatelessWidget {
  const TregoLoading({super.key, this.size});
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: AppColors.purpleColor,
        secondRingColor: AppColors.orangeColor,
        thirdRingColor: AppColors.yellowColor,
        size: size ?? 50.r,
      ),
    );
  }
}
