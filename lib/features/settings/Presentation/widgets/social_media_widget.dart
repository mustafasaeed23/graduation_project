import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theming/colors.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Social Media & AI Autopilot",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: AppColors.wamdahGoldColor2,
          ),
        ),
        SizedBox(height: 20.h),
        Container(
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
              SizedBox(height: 20.h),
              ItemWidget(
                imagePath: "assets/images/igIcon.svg",
                text: "Instagram",
                // isConnected: false,
              ),
              SizedBox(height: 15.h),
              ItemWidget(
                imagePath: "assets/images/tiktokIconsvg.svg",
                text: "TikTok",
                // isConnected: true,
              ),
              SizedBox(height: 15.h),
              ItemWidget(
                imagePath: "assets/images/youTube.svg",
                text: "YouTube",
                // isConnected: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key, required this.imagePath, required this.text});
  final String imagePath;
  final String text;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool isConnected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(widget.imagePath),
        SizedBox(width: 5.w),
        Text(
          widget.text,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            setState(() {
              isConnected = !isConnected; // Toggle the state
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color:
                  isConnected ? AppColors.wamdahGoldColor2 : Colors.transparent,
              border: Border.all(
                color: isConnected ? AppColors.wamdahGoldColor2 : Colors.white,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isConnected ? Icons.check_circle : Icons.wifi,
                  color: isConnected ? Colors.white : Colors.white,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  isConnected ? "Connected" : "Connect",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: isConnected ? Colors.black : Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
