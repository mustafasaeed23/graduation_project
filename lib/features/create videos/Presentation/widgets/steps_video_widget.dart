import 'package:flutter/material.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/features/core/Presentation/widgets/step_widget.dart';

class StepsVideoWidget extends StatelessWidget {
  const StepsVideoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StepWidget(
          stepNumber: "1",
          headTitle: "Input",
          subTitle: "",
          circleColor: AppColors.wamdahSecoundPrimary,
          fontSize: 15,
        ),
        StepWidget(
          stepNumber: "2",
          headTitle: "Content",
          subTitle: "",
          circleColor: AppColors.wamdahSecoundPrimary,
          fontSize: 15,
        ),
        StepWidget(
          stepNumber: "3",
          headTitle: "Language",
          subTitle: "",
          circleColor: AppColors.wamdahSecoundPrimary,
          fontSize: 15,
        ),
        StepWidget(
          stepNumber: "4",
          headTitle: "Style",
          subTitle: "",
          circleColor: AppColors.wamdahSecoundPrimary,
          fontSize: 15,
        ),
        StepWidget(
          stepNumber: "5",
          headTitle: "Generate",
          subTitle: "",
          circleColor: AppColors.wamdahSecoundPrimary,
          fontSize: 15,
        ),
      ],
    );
  }
}