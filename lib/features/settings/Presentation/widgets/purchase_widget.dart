import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theming/colors.dart';

class PurchaseWidget extends StatelessWidget {
  const PurchaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Dec 15, 2024",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: Colors.white,
          ),
        ),
        Text(
          "50 Credits",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: AppColors.wamdahGoldColor2,
          ),
        ),
        Text(
          "100 EGP",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: AppColors.wamdahGoldColor2,
          ),
        ),
        Text(
          "PAY-1746620998480-WUIH8G",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: AppColors.wamdahGoldColor2,
          ),
        ),
        Text(
          "Success",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
