import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Customspokespersonwidget extends StatelessWidget {
  String imagePath;
  String name;
  String position;
  String avatarJopTitle;
  String gender;
  Customspokespersonwidget({
    required this.name,
    required this.position,
    required this.avatarJopTitle,
    required this.gender,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        // border: Border.all(color: Colors.white),
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
            child: Expanded(
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.asset(
                    imagePath,
                    fit: BoxFit.fill,
                    width: 250,
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
          Text(name, style: TextStyle(fontSize: 10, color: Colors.white)),
          SizedBox(height: 5.h),
          Text(position, style: TextStyle(fontSize: 10, color: Colors.grey)),
          SizedBox(height: 10.h),

          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff1F2228),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    avatarJopTitle,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff1F2228),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    gender,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xffFFD700)),
            child: Text(
              "select",
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
