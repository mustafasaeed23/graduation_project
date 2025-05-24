// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:graduation_project/core/helpers/extensions.dart';
// import 'package:graduation_project/core/theming/colors.dart';
// import 'package:graduation_project/features/dashboard/Presentation/cubit/dashboard_cubit.dart';
// import 'package:graduation_project/features/dashboard/Presentation/cubit/dashboard_state.dart';
// import 'package:graduation_project/features/dashboard/Presentation/screens/recent_video_details_screen.dart';
// import 'package:graduation_project/features/dashboard/Presentation/widgets/recent_video_container.dart';

// class AllVideosScreen extends StatelessWidget {
//   const AllVideosScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 35),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "All Videos",
//               style: GoogleFonts.poppins(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 15,
//               ),
//             ),
//             const SizedBox(height: 20), // Optional spacing
//             Expanded(
//               child: BlocBuilder<DashboardCubit, DashboardState>(
//                 builder: (context, state) {
//                   if (state is AllVideosSuccessState) {
//                     print("length ${state.videos.length}"); // Should print 232
//                     return GridView.builder(
//                       itemCount: state.videos.length, // or state.videos.length
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 4,
//                             crossAxisSpacing: 10,
//                             mainAxisSpacing: 10,
//                             childAspectRatio: 1, // Optional tweak
//                           ),
//                       itemBuilder:
//                           (context, index) => GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder:
//                                       (context) => RecentVideoDetailsScreen(
//                                         video: state.videos[index],
//                                       ),
//                                 ),
//                               );
//                             },
//                             child: RecentVideoContainer(
//                               imagePath: state.videos[index].thumbnailUrl,
//                               title: state.videos[index].title,
//                               createdAt: state.videos[index].createdAt
//                                   .formatIsoStringToRelativeTime(context),
//                               duration: state.videos[index].duration.toString(),
//                             ),
//                           ),
//                     );
//                   } else if (state is AllVideosErrorState) {
//                     return Center(
//                       child: Text(
//                         state.message,
//                         style: GoogleFonts.poppins(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 15,
//                         ),
//                       ),
//                     );
//                   }
//                   return const Center(child: CircularProgressIndicator());
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
