import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theming/colors.dart';

class UserContainerInformation extends StatelessWidget {
  const UserContainerInformation({
    super.key,
    required this.asset,
    required this.text1,
    required this.text2,
  });
  final String asset;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      width: 80.w,
      // height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade900,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: AppColors.drawerBg,
            blurStyle: BlurStyle.inner,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                text1,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              Spacer(),
              SvgPicture.asset(
                asset,
                color: AppColors.wamdahGoldColor2,
                width: 20,
                height: 20,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            text2,
            style: GoogleFonts.poppins(
              color: AppColors.wamdahGoldColor2,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "+12% from last month",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
