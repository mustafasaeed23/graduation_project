import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/features/ai%20avatar/Presentation/widgets/CustomSpokesPersonWidget.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../create videos/Presentation/widgets/input_widget.dart';
import '../../../settings/Presentation/widgets/drop_down_widget.dart';

class AiAvatarScreen extends StatefulWidget {
  const AiAvatarScreen({super.key});

  @override
  State<AiAvatarScreen> createState() => _AiAvatarScreenState();
}

class _AiAvatarScreenState extends State<AiAvatarScreen> {
  String selectedOption = "motivitonal";
  String selectedAccent = "Arabic";
  String selectedLanguage = "Arabic";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputWidget(text: "Input your prompt or choose a script"),
              SizedBox(height: 20),
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
              SizedBox(height: 15.h),
              Text(
                "Pick Your Spokesperson",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFFD700),
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  SizedBox(width: 1.w),
                  Customspokespersonwidget(
                    name: "Tech Expert Mike",
                    position: "Technical Presenter",
                    avatarJopTitle: "Technical",
                    gender: "Female",
                    imagePath: "assets/images/profile_image.png",
                  ),
                  SizedBox(width: 10.w),
                  Customspokespersonwidget(
                    name: "Tech Expert Mike",
                    position: "Technical Presenter",
                    avatarJopTitle: "Technical",
                    gender: "Female",
                    imagePath: "assets/images/profile_image.png",
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
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
                            width: double.infinity,
                            // width: 300, // or double.infinity
                            items: ["English", "Arabic"],
                            value: selectedLanguage,
                            onChanged: (val) {
                              setState(() {
                                selectedLanguage = val!;
                              });
                              selectedLanguage;
                            },
                            itemToString: (val) => val.toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
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
                            width: double.infinity, // or double.infinity
                            items: ["Native", "Arabic"],
                            value: selectedAccent,
                            onChanged: (val) {
                              setState(() {
                                selectedAccent = val!;
                              });
                            },
                            itemToString: (val) => val.toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
