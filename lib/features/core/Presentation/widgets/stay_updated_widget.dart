import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/core/widgets/custom_text_form_field.dart';
import 'package:graduation_project/core/widgets/custom_texts.dart';

class StayUpdatedWidget extends StatelessWidget {
  const StayUpdatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 600,
      // color: AppColors.wamdahBackGround,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Text20(
            text: "Stay Updated",
            textColor: Colors.white,
            weight: FontWeight.w600,
            size: 30,
          ),
          SizedBox(height: 20),
          Text20(
            text: "Get the latest AI automation news and updates.",
            textColor: Colors.white,
            weight: FontWeight.w600,
          ),

          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450,
                child: CustomTextFormField(
                  hintText: "Enter Your Email",
                  textColor: Colors.black,
                  backgroundColor: AppColors.greyBoxOTP,
                ),
              ),
              SizedBox(width: 20),
              CustomButton(
                text: "Subscribe",
                fontSize: 12,
                onPressed: () {},
                width: 140,
                height: 50,
                color: AppColors.wamdahGoldColor2,
                textColor: Colors.black,
                borderRadius: 10,
              ),
            ],
          ),
          SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/logo2.png",
                    // width: 30.h,
                    height: 110.h,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text14(
                      alignment: TextAlign.center,
                      text:
                          "        Transform your content with \n AI- powered automation.",
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text16(
                    text: "Product",
                    textColor: AppColors.wamdahGoldColor2,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 10),
                  Text14(
                    text: "Features",
                    textColor: Colors.white,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 10),
                  Text14(
                    text: "Blog",
                    textColor: Colors.white,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 10),
                  Text14(
                    text: "Pricing",
                    textColor: Colors.white,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text16(
                    text: "Company",
                    textColor: AppColors.wamdahGoldColor2,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 10),
                  Text14(
                    text: "Guide",
                    textColor: Colors.white,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 10),
                  Text14(
                    text: "Support",
                    textColor: Colors.white,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 10),
                  Text14(
                    text: "Contact Us",
                    textColor: Colors.white,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
              Column(
                children: [
                  Text16(
                    text: "Connect With Us",
                    textColor: AppColors.wamdahGoldColor2,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.facebook, color: AppColors.wamdahGoldColor2),
                      SizedBox(width: 10),
                      SvgPicture.asset(
                        "assets/icons/linkedIn.svg",
                        color: AppColors.wamdahGoldColor2,
                      ),
                      SizedBox(width: 10),
                      SvgPicture.asset(
                        "assets/icons/github.svg",
                        color: AppColors.wamdahGoldColor2,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
