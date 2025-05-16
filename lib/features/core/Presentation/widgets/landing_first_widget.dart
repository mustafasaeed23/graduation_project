import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routing/routes.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/core/widgets/custom_texts.dart';
import 'package:graduation_project/features/core/Presentation/widgets/core_featuers_widget.dart';
import 'package:graduation_project/features/core/Presentation/widgets/default_container.dart';
import 'package:graduation_project/features/core/Presentation/widgets/feature_card_data.dart';

class LandingFirstWidget extends StatelessWidget {
  const LandingFirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 800,
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
      child: Stack(
        children: [
          // BarWidget(),
          // Positioned(
          //   left: -100,
          //   bottom: -100,
          //   child: Container(
          //     width: 400,
          //     height: 400,
          //     decoration: BoxDecoration(
          //       color: Color(0xFF09444F).withOpacity(0.3),
          //       shape: BoxShape.circle,
          //     ),
          //   ),
          // ),
          Positioned(
            right: -100,
            top: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                color: Color(0xFF4C3B00).withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 20.h,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/images/logo2.png",
                  width: 30.w,
                  height: 100.h,
                  fit: BoxFit.fitHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text16(text: "Featuers", textColor: Colors.white),
                    SizedBox(width: 25),
                    Text16(text: "Guide", textColor: Colors.white),
                    SizedBox(width: 25),
                    Text16(text: "Blog", textColor: Colors.white),
                    SizedBox(width: 25),
                    Text16(text: "Pricing", textColor: Colors.white),
                    SizedBox(width: 25),
                  ],
                ),
                Container(
                  height: 40,
                  width: 85,
                  decoration: BoxDecoration(
                    color: AppColors.goldColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () => context.pushNamed(Routes.loginScreen),
                    child: Center(
                      child: Text14(text: "Sign In", textColor: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text20(
                  text:
                      "AI-Powered Reels. Instant Creation. Limitless \n Automation.",
                  textColor: Colors.white,
                  weight: FontWeight.bold,
                  alignment: TextAlign.center,
                  size: 30,
                ),
                SizedBox(height: 30.h),
                Text14(
                  text:
                      "Transform your content with cutting-edge AI video automation.",
                  weight: FontWeight.w400,
                  textColor: Colors.white,
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 50.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: AppColors.goldColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () => context.pushNamed(Routes.loginScreen),
                    child: Center(
                      child: Text14(
                        text: "Get Started",
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 120.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DefaultContainer(
                      imagePath: "assets/icons/vedio.svg",
                      headTitle: "Video Preview",
                      subTitle: "AI-generated content",
                      gradientColor1: Colors.black,
                      gradientColor2: AppColors.wamdahGoldColor2,
                    ),
                    DefaultContainer(
                      imagePath: "assets/icons/urlIcon.svg",
                      headTitle: "Magic Edit",
                      subTitle: "One-click automation",
                      gradientColor1: Colors.black,
                      gradientColor2: Color(0xFF0A2A3A),
                    ),
                    DefaultContainer(
                      imagePath: "assets/icons/svg.svg",
                      headTitle: "AI Processing",
                      subTitle: "Smart optimization",
                      gradientColor1: Colors.black,
                      gradientColor2: AppColors.wamdahGoldColor2,
                    ),
                  ],
                ),

                // CorefeatuerWidget(),
                // Row(),
                // FeatureCardsScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
