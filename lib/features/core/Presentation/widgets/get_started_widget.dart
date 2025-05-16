// import 'package:flutter/material.dart';
// import 'package:graduation_project/core/theming/colors.dart';
// import 'package:graduation_project/core/widgets/custom_texts.dart';
// import 'package:graduation_project/features/core/Presentation/widgets/default_container.dart';

// class GetStartedWidget extends StatelessWidget {
//   const GetStartedWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 600,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//       stops: [0.0, 0.5, 1.0],
//       colors: [

//         const Color(0x33033B4C), // 20% opacity
//         const Color(0xFF000000), // 100% opacity
//         const Color(0x1AFFD700), // 10% opacity
//       ],
//     ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text20(
//             alignment: TextAlign.center,
//             text:
//                 "AI-Powered Reels. Instant Creation. Limitless \n Automation.",
//             textColor: Colors.white,
//             weight: FontWeight.w600,
//             size: 30,
//           ),
//           SizedBox(height: 15),
//           Text14(
//             text:
//                 "Transform your content with cutting-edge AI video automation.",
//             textColor: Colors.white,
//             weight: FontWeight.w400,
//           ),
//           SizedBox(height: 35),
//           Container(
//             height: 60,
//             width: 190,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: AppColors.wamdahGoldColor,
//             ),
//             child: Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text16(
//                     text: "Get Started",
//                     textColor: Colors.black,
//                     weight: FontWeight.w500,
//                   ),
//                   SizedBox(width: 10),
//                   Icon(Icons.navigate_next_sharp),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 35),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               DefaultContainer(
//                 imagePath: "assets/icons/vedio.svg",
//                 headTitle: "Video Preview",
//                 subTitle: "AI-generated content",
//               ),
//               DefaultContainer(
//                 imagePath: "assets/icons/magic.svg",
//                 headTitle: "Magic Edit",
//                 subTitle: "One-click automation",
//               ),
//               DefaultContainer(
//                 imagePath: "assets/icons/svg.svg",
//                 headTitle: "AI Processing",
//                 subTitle: "Smart optimization",
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
