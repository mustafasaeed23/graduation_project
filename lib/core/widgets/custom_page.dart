import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/widgets/back.dart';
import 'package:graduation_project/core/widgets/custom_texts.dart';
import 'custom_button.dart';

class CustomPage extends StatelessWidget {
  final String assetImage;
  final String title;
  final String description;
  final Color backgroundColor;
  final Color textColor;
  final bool hasButton;
  final bool hasBackButton;
  final String buttonText;
  final VoidCallback onPressed;
  const CustomPage({
    super.key,
    this.hasButton = true,
    this.hasBackButton = true,
    required this.backgroundColor,
    required this.assetImage,
    this.textColor = Colors.white,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        leading: hasBackButton
            ? Back(
                iconColor: textColor,
              )
            : null,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: 500.h,
                child: Image.asset(assetImage),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text28(
                      text: title,
                      size: 30.r,
                      weight: FontWeight.w700,
                      spacing: 0,
                      textColor: textColor,
                      alignment: TextAlign.center,
                    ),
                    10.height,
                    Text18(
                      text: description,
                      textColor: textColor,
                      weight: FontWeight.w400,
                      alignment: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: hasButton
          ? IntrinsicHeight(
              child: SafeArea(
                child: Container(
                  margin: EdgeInsets.only(left: 50.w, right: 50.w, bottom: 30.h),
                  child: CustomButton(
                    borderRadius: 50.r,
                    height: 50.h,
                    text: buttonText,
                    onPressed: onPressed,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
