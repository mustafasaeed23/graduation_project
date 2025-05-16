import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/features/settings/Presentation/widgets/drop_down_widget.dart';
import 'package:graduation_project/features/settings/Presentation/widgets/purchase_widget.dart';

class CriedtsWidget extends StatefulWidget {
  const CriedtsWidget({super.key});

  @override
  State<CriedtsWidget> createState() => _CriedtsWidgetState();
}

class _CriedtsWidgetState extends State<CriedtsWidget> {
  int selectedCredit = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Credits & Purchase History",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: AppColors.wamdahGoldColor2,
          ),
        ),
        SizedBox(height: 30.h),
        Container(
          width: 800,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.drawerBg,
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Credits",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  CustomDropdown<int>(
                    width: 120,
                    items: [10, 20, 50, 100],
                    value: selectedCredit,
                    onChanged: (val) {
                      setState(() {
                        selectedCredit = val!;
                      });
                    },
                    itemToString: (val) => val.toString(),
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.wamdahGoldColor2,
                    ),
                    child: Text(
                      "Purchase",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Container(width: double.infinity, height: 1, color: Colors.grey),
              SizedBox(height: 20.h),
              Text(
                "Purchase History",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: AppColors.wamdahGoldColor2,
                ),
              ),
              SizedBox(height: 15.h),
              PurchaseWidget(),
              SizedBox(height: 20.h),
              PurchaseWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
