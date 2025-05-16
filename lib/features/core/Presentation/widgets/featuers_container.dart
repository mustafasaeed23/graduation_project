import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/core/widgets/custom_texts.dart';

class FeatuersContainer extends StatelessWidget {
  const FeatuersContainer({
    super.key,
    required this.imagePath,
    required this.headTitle,
    required this.subTitle1,
    required this.subTitle2,
    required this.subTitle3,
    required this.gradientColor1,
    required this.gradientColor2,
  });
  final String imagePath;
  final String headTitle;
  final String subTitle1;
  final String subTitle2;
  final String subTitle3;
  final Color gradientColor1;
  final Color gradientColor2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      height: 228,
      width: 300,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.centerRight,
          colors: [gradientColor1, gradientColor2],
        ),
        // color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Icon(icon, size: 35, color: Colors.white),
          SvgPicture.asset(imagePath, color: AppColors.wamdahGoldColor2),
          SizedBox(height: 10),
          Text16(
            text: headTitle,
            textColor: AppColors.wamdahGoldColor2,
            weight: FontWeight.w600,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/checkIcon.svg",
                color: AppColors.wamdahGoldColor2,
              ),
              SizedBox(width: 10),
              Text12(
                text: subTitle1,
                textColor: Colors.white,
                weight: FontWeight.w400,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/checkIcon.svg",
                color: AppColors.wamdahGoldColor2,
              ),
              SizedBox(width: 10),

              Text12(
                text: subTitle2,
                textColor: Colors.white,
                weight: FontWeight.w400,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/checkIcon.svg",
                color: AppColors.wamdahGoldColor2,
              ),
              SizedBox(width: 10),

              Text12(
                text: subTitle3,
                textColor: Colors.white,
                weight: FontWeight.w400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
