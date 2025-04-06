import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerWidget extends StatelessWidget {
  const SkeletonizerWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enableSwitchAnimation: true,
      containersColor: Colors.grey.shade200,
      effect:  ShimmerEffect(
        // begin: AlignmentDirectional.centerStart,
        // end: AlignmentDirectional.centerEnd,
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey[500]!,
        duration: const Duration(seconds: 2),
      ),
      ignorePointers: true,
      justifyMultiLineText: true,
      ignoreContainers: false,
      enabled: true,
      textBoneBorderRadius: const TextBoneBorderRadius.fromHeightFactor(1),
      switchAnimationConfig: const SwitchAnimationConfig(
        duration: Duration(seconds: 2),
        switchInCurve: Curves.easeInCubic,
        reverseDuration: Duration(seconds: 1),
      ),
      child: child,
    );
  }
}
