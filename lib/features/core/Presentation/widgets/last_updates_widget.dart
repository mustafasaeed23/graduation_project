import 'package:flutter/material.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/core/widgets/custom_texts.dart';

class LastUpdatesWidget extends StatelessWidget {
  const LastUpdatesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 600,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff09444F), // dark blue-black
            Colors.black,
            Color(0xFF4C3B00),
            // dark golden
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 40),
          Text20(
            text: "Last Updates",
            textColor: Colors.white,
            weight: FontWeight.w600,
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LastUpdateCard(
                imagePath: "assets/images/div.png",
                title: "AI Video Trends 2025",
                subTitle:
                    "Latest insights on AI video creation and automation.",
              ),
              LastUpdateCard(
                imagePath: "assets/images/div2.png",
                title: "AI Video Trends 2025",
                subTitle:
                    "Latest insights on AI video creation and automation.",
              ),
              LastUpdateCard(
                imagePath: "assets/images/div3.png",
                title: "AI Video Trends 2025",
                subTitle:
                    "Latest insights on AI video creation and automation.",
              ),
            ],
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}

class LastUpdateCard extends StatelessWidget {
  const LastUpdateCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });
  final String imagePath;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 395,
      height: 366,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: Text16(
              text: title,
              textColor: Colors.white,
              weight: FontWeight.w600,
              size: 20,
            ),
          ),
          // SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: Text12(
              text: subTitle,
              textColor: Colors.white,
              weight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 12),
              Text12(
                text: "Read More",
                textColor: Colors.white,
                weight: FontWeight.w400,
              ),
              SizedBox(width: 10),
              Icon(Icons.navigate_next_sharp, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
