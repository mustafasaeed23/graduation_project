import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/features/ai%20avatar/Presentation/cubit/ai_avatar_cubit.dart';
import 'package:graduation_project/features/ai%20avatar/Presentation/cubit/ai_avatar_state.dart';

class CustomSpokesPersonWidget extends StatefulWidget {
  final void Function(String selectedSpeakerName) onSpeakerSelected;

  const CustomSpokesPersonWidget({super.key, required this.onSpeakerSelected});

  @override
  State<CustomSpokesPersonWidget> createState() =>
      _CustomSpokesPersonWidgetState();
}

class _CustomSpokesPersonWidgetState extends State<CustomSpokesPersonWidget> {
  String? selectedAvatarName; //

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiAvatarCubit, AiAvatarState>(
      builder: (context, state) {
        if (state is AiAvatarLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AiAvatarError) {
          return Center(child: Text(state.message));
        } else if (state is AiAvatarLoaded) {
          var entity = state.entity;

          return GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.9,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: entity.length,
            itemBuilder: (BuildContext context, int index) {
              final item = entity[index];
              final isSelected = selectedAvatarName == item.avatarName;
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade800,
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.network(
                          item.avatarImage,
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: 220,
                        ),
                      ],
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
                    SizedBox(height: 10.h),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedAvatarName = item.avatarName;
                        });
                        widget.onSpeakerSelected(item.avatarName);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor:
                            isSelected ? const Color(0xffFFD700) : Colors.grey,
                      ),
                      child: Text(
                        isSelected ? "Selected" : "Select",
                        style: GoogleFonts.poppins(
                          color: isSelected ? Colors.black : Colors.white,
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
          return const SizedBox();
        }
      },
    );
  }
}
