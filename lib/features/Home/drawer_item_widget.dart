import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/theming/colors.dart';

class DrawerItemTile extends StatelessWidget {
  final String title;
  final String assetName;
  final bool isSelected;
  final VoidCallback onTap;

  const DrawerItemTile({
    super.key,
    required this.title,
    required this.assetName,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
      leading: SvgPicture.asset(
        assetName,
        color: isSelected ? Colors.black : Colors.white,
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            color: isSelected ? Colors.black : Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ),
      tileColor: isSelected ? AppColors.wamdahGoldColor2 : null,
      onTap: onTap,
    ).withDirectionalOnlyPadding(bottom: 5);
  }
}
