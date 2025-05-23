import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theming/colors.dart';

class InputWidget extends StatelessWidget {
  InputWidget({super.key, required this.text,  this.controller});
  final String text;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: AppColors.wamdahGoldColor2,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 15.h),
          SizedBox(
            width: double.infinity,
            // height: 300,
            child: TextFormField(
              // maxLength: 5,
              maxLines: 5,

              textAlign: TextAlign.start,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your prompt";
                }
                return null;
              },

              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),

              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                focusColor: Colors.white,
                // labelText: "Create a motivational video...",
                hintText: "Create a motivational video...",
                labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
                hintStyle: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
