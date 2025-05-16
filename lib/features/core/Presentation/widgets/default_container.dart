import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/widgets/custom_texts.dart';

class DefaultContainer extends StatelessWidget {
  const DefaultContainer({
    super.key,
    required this.imagePath,
    required this.headTitle,
    required this.subTitle,
    required this.gradientColor1,
    required this.gradientColor2,
  });
  final String imagePath;
  final String headTitle;
  final String subTitle;
  final Color gradientColor1;
  final Color gradientColor2; // dark blue-black

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      height: 154,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.centerRight,
          colors: [
            gradientColor1,
            gradientColor2, // dark golden
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Icon(icon, size: 35, color: Colors.white),
          SvgPicture.asset(imagePath, color: Colors.white),
          SizedBox(height: 10),
          Text16(
            text: headTitle,
            textColor: Colors.white,
            weight: FontWeight.w600,
          ),
          SizedBox(height: 10),
          Text12(
            text: subTitle,
            textColor: Colors.white,
            weight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
