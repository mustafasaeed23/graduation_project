import 'package:flutter/material.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/core/widgets/custom_texts.dart';
import 'package:graduation_project/features/core/Presentation/widgets/featuers_container.dart';

class CorefeatuerWidget extends StatelessWidget {
  const CorefeatuerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xff09444F),
      width: double.infinity,
      height: 600,

      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff09444F), // dark blue-black
            Colors.black,
            Color(0xFF4C3B00),
            // dark golden
          ],
          // stops: [0.9, 0.0, 0.9],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 40),
          Text20(
            text: "Core Featuers",
            textColor: Colors.white,
            weight: FontWeight.bold,
            size: 30,
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FeatuersContainer(
                imagePath: "assets/icons/filmIcon.svg",
                headTitle: "Instant AI Video",
                subTitle1: "Generate AI videos instantly",
                subTitle2: 'Smart automation',
                subTitle3: 'Drag-and-drop interface',
                gradientColor1: Colors.black,
                gradientColor2: AppColors.wamdahGoldColor2,
              ),
              FeatuersContainer(
                imagePath: "assets/icons/filmIcon.svg",
                headTitle: "Instant AI Video",
                subTitle1: "Generate AI videos instantly",
                subTitle2: 'Smart automation',
                subTitle3: 'Drag-and-drop interface',
                gradientColor1: Colors.black,
                gradientColor2: Color(0xFF0A2A3A),
              ),
              FeatuersContainer(
                imagePath: "assets/icons/filmIcon.svg",
                headTitle: "Instant AI Video",
                subTitle1: "Generate AI videos instantly",
                subTitle2: 'Smart automation',
                subTitle3: 'Drag-and-drop interface',
                gradientColor1: Colors.black,
                gradientColor2: AppColors.wamdahGoldColor2,
              ),
            ],
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
