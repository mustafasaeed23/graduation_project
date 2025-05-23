import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/features/core/Presentation/widgets/step_widget.dart';
import 'package:graduation_project/features/create%20videos/Presentation/widgets/input_widget.dart';
import 'package:graduation_project/features/settings/Presentation/widgets/drop_down_widget.dart';

class UrlVideoScreen extends StatefulWidget {
  const UrlVideoScreen({super.key});

  @override
  State<UrlVideoScreen> createState() => _UrlVideoScreenState();
}

class _UrlVideoScreenState extends State<UrlVideoScreen> {
  String selectedOption = "motivitonal";
  String languageOption = "English";
  String accentOption = "Native";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.h),
            Row(
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
            ),
            SizedBox(height: 10.h),
            InputWidget(text: 'Input your URL',),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "category",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: AppColors.wamdahGoldColor2,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 15.h),

                  CustomDropdown<String>(
                    width: double.infinity,
                    items: ["motivitonal", "Ai Script", "Educational"],
                    value: selectedOption,
                    onChanged: (val) {
                      setState(() {
                        selectedOption = val!;
                      });
                    },
                    itemToString: (val) => val.toString(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        "Language",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: AppColors.wamdahGoldColor2,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 50.h, // Or whatever fits
                        child: CustomDropdown<String>(
                          width: 300, // or double.infinity
                          items: ["English", "Arabic"],
                          value: languageOption,
                          onChanged: (val) {
                            setState(() {
                              languageOption = val!;
                            });
                          },
                          itemToString: (val) => val.toString(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Accent",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: AppColors.wamdahGoldColor2,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 50.h, // Or whatever fits
                        child: CustomDropdown<String>(
                          // or double.infinity
                          items: ["Native", "Arabic"],
                          value: accentOption,
                          onChanged: (val) {
                            setState(() {
                              accentOption = val!;
                            });
                          },
                          itemToString: (val) => val.toString(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            Center(
              child: CustomButton(
                iconAsset: "assets/icons/Frame.svg",
                text: "Generate",
                width: 150,
                height: 40,
                fontSize: 14,
                color: AppColors.wamdahGoldColor2,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
