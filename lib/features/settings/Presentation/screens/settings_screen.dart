import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/features/settings/Presentation/cubit/settings_cubit.dart';
import 'package:graduation_project/features/settings/Presentation/cubit/settings_state.dart';
import 'package:graduation_project/features/settings/Presentation/widgets/criedts_widget.dart';
import 'package:graduation_project/features/settings/Presentation/widgets/security_widget.dart';
import 'package:graduation_project/features/settings/Presentation/widgets/social_media_widget.dart';
import 'package:graduation_project/features/settings/Presentation/widgets/user_profile_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 20),
        child: SingleChildScrollView(
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              if (state is UserProfileLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.wamdahGoldColor,
                  ),
                );
              } else if (state is UserProfileLoaded) {
                var entity = state.entity;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Settings & Security",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: AppColors.wamdahGoldColor2,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    UserProfileWidget(
                      userName: entity.user.name,
                      email: entity.user.email,
                    ),
                    SizedBox(height: 20.h),
                    SecurityWidget(),
                    SizedBox(height: 40.h),
                    SocialMediaWidget(),
                    SizedBox(height: 40.h),

                    CriedtsWidget(payments: entity.payments),
                    SizedBox(height: 50.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 350),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.wamdahGoldColor2,
                        ),
                        child: Text(
                          "Save Changes",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is UserProfileError) {
                return Center(child: Text(state.message));
              } else {
                return CircleAvatar();
              }
            },
          ),
        ),
      ),
    );
  }
}
