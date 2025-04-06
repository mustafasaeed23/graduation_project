import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveFrameworkWidget extends StatelessWidget {
  const ResponsiveFrameworkWidget({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      breakpoints: tregoBreakpoints,
      child: ResponsiveScaledBox(
        width: ResponsiveValue<dynamic>(
          context,
          conditionalValues: [
            const Condition.between(
              start: 0,
              end: 380,
              value: 360,
            ),
            const Condition.between(
              start: 381,
              end: 500,
              value: 380,
            ),
            const Condition.between(
              start: 501,
              end: 850,
              value: 700,
            ),
            const Condition.between(
              start: 851,
              end: 1200,
              value: 880,
            ),
          ],
        ).value.toDouble(),
        child: widget,
      ),
    );
  }
}
