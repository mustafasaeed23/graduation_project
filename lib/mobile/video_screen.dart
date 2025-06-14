import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/mobile/ai_avatar_mobile_video.dart';
import 'package:graduation_project/mobile/instant_video_screen.dart';
import 'package:graduation_project/mobile/url_video_mobile_screen.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;

  final List<String> tabTitles = [
    'Instant Video',
    'Url Video',
    'Ai Avatar Video',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: List.generate(tabTitles.length, (index) {
                final isSelected = selectedIndex == index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? AppColors.wamdahGoldColor2
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        tabTitles[index],
                        style: GoogleFonts.poppins(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Builder(
            builder: (context) {
              if (selectedIndex == 0) {
                return InstantVideoScreen();
              } else if (selectedIndex == 1) {
                return UrlVideoMobileScreen();
              } else {
                return AiAvatarMobileVideo();
              }
            },
          ),
        ),
      ],
    );
  }
}
