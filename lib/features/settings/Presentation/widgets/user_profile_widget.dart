import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.drawerBg,
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 15),
          Column(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  "assets/images/profile_image.png",
                  width: 80,
                  height: 80,
                ),
              ),
              SizedBox(height: 15.h),
              CustomButton(
                text: "change photo",
                color: AppColors.wamdahGoldColor2,
                textColor: Colors.white,
                width: 100,
                height: 35,
                fontWeight: FontWeight.w500,
                fontSize: 10,
              ),
            ],
          ),
          SizedBox(width: 15.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Username",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.wamdahGoldColor2,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                width: 260,
                height: 45,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black,
                ),
                child: Text(
                  "Saleh",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Email",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.wamdahGoldColor2,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                width: 260,
                height: 45,
                padding: EdgeInsets.all(10),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black,
                ),
                child: Text(
                  "Saleh@gmail.com",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
            // ),
            // SizedBox(height: 10.h,),
            // Column(
            //   children: [

            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}
