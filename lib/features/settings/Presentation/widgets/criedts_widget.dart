import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/features/settings/Domain/entites/user_profile_entity.dart';
import 'package:graduation_project/features/settings/Presentation/cubits/cubit/credits_cubit.dart';
import 'package:graduation_project/features/settings/Presentation/widgets/drop_down_widget.dart';
import 'package:graduation_project/features/settings/Presentation/widgets/purchase_widget.dart';

class CreditsWidget extends StatefulWidget {
  final List<PaymentEntity> payments;

  const CreditsWidget({super.key, required this.payments});

  @override
  State<CreditsWidget> createState() => _CreditsWidgetState();
}

class _CreditsWidgetState extends State<CreditsWidget> {
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
          width: double.infinity,
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
                  GestureDetector(
                    onTap: () {
                      context.read<CreditsCubitCubit>().purchaseCredits(
                        credit: selectedCredit,
                        context: context,
                      );
                    },
                    child: Container(
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
              ...widget.payments
                  .map((payment) => PurchaseWidget(payment: payment))
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }
}
