import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/features/settings/Domain/entites/user_profile_entity.dart';

class PurchaseWidget extends StatelessWidget {
  final PaymentEntity payment;

  const PurchaseWidget({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Credits: ${payment.credits}",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Provider: ${payment.paymentProvider}",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          Text(
            "Date: ${payment.createdAtfinal.formatIsoStringToTime(context)}",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w300,
              color: AppColors.wamdahGoldColor2,
            ),
          ),
        ],
      ),
      trailing: Text(
        "EGP ${payment.egpAmount}",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: AppColors.wamdahGoldColor2,
        ),
      ),
    );
  }
}
