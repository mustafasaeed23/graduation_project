import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/features/ai%20autopilot/presentation/widgets/account_widget.dart';
import 'package:graduation_project/features/ai%20autopilot/presentation/widgets/upload_video_widget.dart';

class AiAutopilotScreen extends StatelessWidget {
  const AiAutopilotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Connected Accounts",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              children: [
                AccountWidget(
                  image: 'assets/images/youTube.svg',
                  title: 'YouTube',
                ),
                SizedBox(width: 20.w),
                AccountWidget(
                  image: 'assets/images/igIcon.svg',
                  title: 'Instagram',
                ),
              ],
            ),
            SizedBox(height: 60),
            UploadVideoWidget(),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 350),
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.wamdahGoldColor2,
                ),
                child: Text(
                  "Upload",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
