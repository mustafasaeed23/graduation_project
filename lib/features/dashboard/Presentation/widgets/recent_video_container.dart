import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theming/colors.dart';

class RecentVideoContainer extends StatelessWidget {
  const RecentVideoContainer({
    super.key,
    required this.imagePath,
    required this.title,
    required this.createdAt,
    required this.duration,
  });
  final String imagePath;
  final String title;
  final String createdAt;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 200, // or any height you need
              width: double.infinity,
              child: Image.network(
                imagePath,
                fit:
                    BoxFit
                        .fitHeight, // or BoxFit.fill if cropping isn't a concern
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          // SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: Text(
              createdAt,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 10,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text(
                  "$duration sec",
                  style: GoogleFonts.poppins(
                    color: AppColors.wamdahGoldColor2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                SvgPicture.asset(
                  "assets/icons/edit.svg",
                  color: AppColors.wamdahGoldColor2,
                ),
                SizedBox(width: 15),
                SvgPicture.asset(
                  "assets/icons/save.svg",
                  color: AppColors.wamdahGoldColor2,
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
