import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/features/ai%20avatar/Presentation/cubit/ai_avatar_cubit.dart';
import 'package:graduation_project/features/ai%20avatar/Presentation/cubit/ai_avatar_state.dart';

class CustomSpokesPersonWidget extends StatelessWidget {
  final void Function(String selectedSpeakerName) onSpeakerSelected;

  const CustomSpokesPersonWidget({super.key, required this.onSpeakerSelected});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiAvatarCubit, AiAvatarState>(
      builder: (context, state) {
        if (state is AiAvatarLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is AiAvatarError) {
          return Center(child: Text(state.message));
        } else if (state is AiAvatarLoaded) {
          var entity = state.entity;
          return GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: entity.length,
            itemBuilder: (BuildContext context, int index) {
              final item = entity[index];
              return Container(
                width: 400,
                height: 400,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade800,
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: SizedBox(
                        // width: double.infinity,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Image.network(
                              item.avatarImage,
                              fit: BoxFit.contain,
                              width: double.infinity,
                              height: 220,
                            ),
                            Icon(
                              Icons.favorite_border,
                              size: 20,
                              color: Color(0xffFFD700),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      item.avatarName,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5.h),

                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff1F2228),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          item.avatarId,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    ElevatedButton(
                      onPressed: () {
                        onSpeakerSelected(item.avatarName);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFFD700),
                      ),
                      child: Text(
                        "select",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
