import 'package:flutter/material.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/core/widgets/custom_texts.dart';
import 'package:graduation_project/features/core/Presentation/widgets/step_widget.dart';

class HowItWorksWidget extends StatelessWidget {
  const HowItWorksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff09444F), // dark blue-black
            Colors.black,
            Color(0xFF4C3B00),
            // dark golden
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text20(
              text: "How It Works",
              textColor: Colors.white,
              weight: FontWeight.w600,
              size: 30,
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StepWidget(
                stepNumber: "1",
                headTitle: "Upload Content",
                subTitle: "Add your media or URL",
              ),
              StepWidget(
                stepNumber: "2",
                headTitle: "Choose Style",
                subTitle: "Select AI parameters",
              ),
              StepWidget(
                stepNumber: "3",
                headTitle: "AI Processing",
                subTitle: "Magic happens here",
              ),
              StepWidget(
                stepNumber: "4",
                headTitle: "Download",
                subTitle: "Get your video",
              ),
            ],
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Text("Step 1", style: TextStyle(color: Colors.black)),
          //     SizedBox(width: 25),
          //     Text("Step 2", style: TextStyle(color: Colors.black)),
          //     SizedBox(width: 25),
          //     Text("Step 3", style: TextStyle(color: Colors.black)),
          //   ],
          // ),
        ],
      ),
    );
  }
}
