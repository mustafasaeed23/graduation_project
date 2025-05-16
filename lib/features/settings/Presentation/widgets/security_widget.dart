import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/features/settings/Presentation/widgets/switcher_icon_widget.dart';

class SecurityWidget extends StatelessWidget {
  const SecurityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.drawerBg,
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Security",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Text(
                "Two-Factor Authentication",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              Spacer(),
              IconSwitcher(),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            "Add an extra layer of security",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
          SizedBox(height: 12.h),

          Text(
            "Change Password",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              color: AppColors.wamdahGoldColor2,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
