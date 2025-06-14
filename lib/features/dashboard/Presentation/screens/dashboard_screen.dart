import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routing/routes.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/features/dashboard/Domain/entities/user_data_entity.dart';
import 'package:graduation_project/features/dashboard/Presentation/cubit/dashboard_cubit.dart';
import 'package:graduation_project/features/dashboard/Presentation/cubit/dashboard_state.dart';
import 'package:graduation_project/features/dashboard/Presentation/screens/recent_video_details_screen.dart';
import 'package:graduation_project/features/dashboard/Presentation/widgets/recent_video_container.dart';
import 'package:graduation_project/features/dashboard/Presentation/widgets/user_container_information.dart';
import 'package:lottie/lottie.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  // final UserDataEntity entity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
        child: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            if (state is DashboardLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.wamdahGoldColor2,
                ),
              );
            } else if (state is DashboardError) {
              return Center(
                child: Text(
                  state.message,
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else if (state is DashboardLoaded) {
              final user = state.data;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " Welcome Back, ${user.name}",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Let's create something amazing today",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Wrap(
                      spacing: 10.w,
                      crossAxisAlignment: WrapCrossAlignment.center,

                      children: [
                        UserContainerInformation(
                          asset: 'assets/icons/vedio.svg',
                          text1: 'Total Videos',
                          text2: user.videosCount.toString(),
                        ),
                        UserContainerInformation(
                          asset: 'assets/icons/vedio.svg',
                          text1: 'Ai Credits',
                          text2: user.airCreditsEntity.airCredits.toString(),
                        ),
                        UserContainerInformation(
                          asset: 'assets/icons/vedio.svg',
                          text1: 'Storage Used',
                          text2: "100 %",
                        ),
                      ],
                    ),
                    SizedBox(height: 60),
                    Row(
                      children: [
                        Text(
                          "Recent Projects",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            // context.pushNamed(Routes.allVideosScreen);
                            // context.read<DashboardCubit>().getAllVideos();
                          },
                          child: Text(
                            "see all",
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    user.videosEntity.isEmpty
                        ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,

                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                "assets/animations/Animation - 1747426014372.json",
                                width: 500,
                                height: 500,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                "No videos yet, Let's Create something Amazing",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 15,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        )
                        : GridView.builder(
                          shrinkWrap: true,
                          physics:
                              NeverScrollableScrollPhysics(), // Prevent scroll conflicts
                          itemCount: user.videosEntity.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // 3 items per row
                            crossAxisSpacing: 10.w, // horizontal spacing
                            mainAxisSpacing: 10.h, // vertical spacing
                            childAspectRatio:
                                1.1, // adjust as needed for video item layout
                          ),
                          itemBuilder: (context, index) {
                            final video = user.videosEntity[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => RecentVideoDetailsScreen(
                                          video: video,
                                        ),
                                  ),
                                );
                              },
                              child: RecentVideoContainer(
                                videoUrl: video.videoSourceEntity.secureUrl,
                                title: video.title,
                                createdAt: video.createdAt
                                    .formatIsoStringToRelativeTime(context),
                                duration: video.duration.toString(),
                              ),
                            );
                          },
                        ),
                  ],
                ),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(
                    "assets/animations/Animation - 1747426014372.json",
                    width: 500,
                    height: 500,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "No videos yet, Let's Create something Amazing",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
